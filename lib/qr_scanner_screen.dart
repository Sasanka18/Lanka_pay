import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'qr_validation_result_screen.dart';
import 'qr_validation_failed_screen.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool isFlashOn = false;
  MobileScannerController? cameraController;

  @override
  void initState() {
    super.initState();
    cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: isFlashOn,
    );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Padding(
            padding: EdgeInsets.only(top: 30), 
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.8,
              child: Image.asset(
                'assets/index.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
             
              children: [
                const SizedBox(height: 220), 
                Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
               
                    // QR Code scanner frame
                    Container(
                      width: screenWidth * 0.5,
                      height: screenWidth * 0.5,
                      margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                      child: MobileScanner(
                        controller: cameraController!,
                        onDetect: (capture) {
                          final List<Barcode> barcodes = capture.barcodes;
                          try {
                            if (barcodes.isEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QRValidationFailedScreen(),
                                ),
                              );
                              return;
                            }

                            for (final barcode in barcodes) {
                              if (barcode.rawValue != null) {
                                // Validate QR code format
                                if (barcode.rawValue!.startsWith('00')) { 
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QRValidationResultScreen(
                                        qrData: barcode.rawValue!,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const QRValidationFailedScreen(),
                                    ),
                                  );
                                }
                                break;
                              }
                            }
                          } catch (e) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QRValidationFailedScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ),

                    
                    const SizedBox(height: 16),
                    
                    // Flashlight button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12), 
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          isFlashOn ? Icons.flash_off : Icons.flash_on,
                          size: screenWidth * 0.06,
                          color: const Color(0xFF1A1442),
                        ),
                        onPressed: () {
                          setState(() {
                            isFlashOn = !isFlashOn;
                            cameraController?.toggleTorch();
                          });
                        },
                      ),
                    ),
                  ],
                ),

                // Instructions text
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: 16,
                  ),
                  child: Text(
                    "Place above square direct to the QR code.\nYou will be redirected to the result screen automatically.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Color.fromARGB(255, 42, 30, 115),
                    ),
                  ),
                ),

                const Spacer(),

                // Back to Dashboard button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(color: Colors.black26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        
                           SizedBox(width: 8),
                           Text(
                            'Back to Dashboard',
                            style: TextStyle(
                              color: Color(0xFF1A1442),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
