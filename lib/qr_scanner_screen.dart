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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Index image as header
            Container(
              width: screenWidth,
              height: screenHeight * 0.15, // 15% of screen height
              child: Image.asset(
                'assets/index.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 4), // Reduced from 8 to 4 for minimal gap

            // QR Code scanner frame
            Expanded(
              flex: 3, // Takes 3 parts of remaining space
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final scannerSize = screenWidth * 0.8; // 80% of screen width
                  return Container(
                    width: scannerSize,
                    height: scannerSize,
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1, // 10% of screen width
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: MobileScanner(
                      controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.normal,
                        facing: CameraFacing.back,
                        torchEnabled: isFlashOn,
                      ),
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
                              if (barcode.rawValue!.startsWith('00')) { // Example validation for LankaQR
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
                  );
                },
              ),
            ),

            // Bottom section
            Expanded(
              flex: 2, // Takes 2 parts of remaining space
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Flashlight toggle button
                  IconButton(
                    icon: Icon(
                      isFlashOn ? Icons.flash_off : Icons.flash_on,
                      size: screenWidth * 0.07, // 7% of screen width
                      color: Colors.black,
                    ),
                    onPressed: () => setState(() => isFlashOn = !isFlashOn),
                  ),

                  // Instructions text
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04, // 4% of screen width
                    ),
                    child: Text(
                      "Place above square direct to the QR code.\nYou will be redirected to the result screen automatically.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035, // 3.5% of screen width
                        color: const Color(0xFF1A1442),
                      ),
                    ),
                  ),

                  // Back to Dashboard button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 60,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/home.png',
                              height: 24,
                              width: 24,
                              color: const Color(0xFF1A1442),
                            ),
                            const SizedBox(width: 8),
                            const Text(
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
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02), // 2% of screen height
          ],
        ),
      ),
    );
  }
}
