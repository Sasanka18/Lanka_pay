import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Container(
              width: 1.sw,
              height: 0.15.sh,
              child: Image.asset(
                'assets/index.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF1A1442),
                    child: Center(
                      child: Text(
                        'Unable to load image',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // QR Scanner section
            Expanded(
              flex: 3,
              child: Container(
                width: 0.8.sw,
                height: 0.8.sw,
                margin: EdgeInsets.symmetric(horizontal: 0.1.sw),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2.w),
                ),
                child: MobileScanner(
                  controller: cameraController,
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
            ),

            // Bottom section
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Flashlight toggle button
                  IconButton(
                    icon: Icon(
                      isFlashOn ? Icons.flash_off : Icons.flash_on,
                      size: 28.sp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isFlashOn = !isFlashOn;
                        cameraController?.toggleTorch();
                      });
                    },
                  ),

                  // Instructions text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Place above square direct to the QR code.\nYou will be redirected to the result screen automatically.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF1A1442),
                      ),
                    ),
                  ),

                  // Back to Dashboard button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10.r,
                              offset: Offset(0, 5.h),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/home.png',
                              height: 24.h,
                              width: 24.w,
                              color: const Color(0xFF1A1442),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Back to Dashboard',
                              style: TextStyle(
                                color: const Color(0xFF1A1442),
                                fontSize: 16.sp,
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

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
