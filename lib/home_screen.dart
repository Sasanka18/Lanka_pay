import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'qr_scanner_screen.dart';
import 'qr_validation_result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QRValidationResultScreen(qrData: image.path),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error accessing gallery'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with image and branding
            Stack(
              children: [
                // Blue header background
                Container(
                  width: 1.sw,
                  height: 0.45.sh,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1442),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                // Text content
                Positioned(
                  top: 0.05.sh,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'LANKAQR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Qr Code Validator',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Use this application to validate any LankaQR codes\neasily, fast, and accurately.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 0.03.sh),

            // Scan QR Code button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QRScannerScreen()),
                  );
                },
                child: Container(
                  height: 0.12.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10.r,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.qr_code_scanner, size: 40, color: Color(0xFF1A1442)),
                        SizedBox(height: 8),
                        Text(
                          'SCAN QR CODE',
                          style: TextStyle(
                            color: Color(0xFF1A1442),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 0.03.sh),

            const Text(
              'Scan QR code from Gallery',
              style: TextStyle(
                color: Color(0xFF1A1442),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Once upload the QR to the App, you will be\nredirected to the result screen.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF1A1442), fontSize: 13),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.025),

            // Upload buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _pickImage(context),
                  child: Container(
                    height: 55.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        'Choose QR Code',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: () => _pickImage(context),
                  child: Container(
                    height: 55.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.r,
                          offset: Offset(0, 5.h),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.upload,
                      color: Colors.black54,
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Footer text
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                'This application developed by DirectPay for developers,\nmerchants and community. Version 1.0',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.sp, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
