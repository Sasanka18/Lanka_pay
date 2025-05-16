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
        child: Stack(
          children: [
            // Background image container
            Container(
              width: 1.sw,
              height: 1.sh,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/LankaQR Validator.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Main content
            Column(
              children: [
                // Header text content
                SizedBox(height: 0.05.sh),
                Image.asset(
                  'assets/logo.png',
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      size: 40.sp,
                      color: Colors.white70,
                    );
                  },
                ),
                Text(
                  'Qr Code Validator',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'Use this application to validate any LankaQR codes\neasily, fast, and accurately.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      height: 1.5,
                    ),
                  ),
                ),

                SizedBox(height: 0.23.sh), // Reduced from 0.24.sh

                // Scan QR Code button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QRScannerScreen()),
                    ),
                    child: Container(
                      height: 0.1.sh, // Reduced from 0.12.sh
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
                      child: Row( // Changed from Column to Row for better spacing
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.qr_code_scanner, size: 32.sp, color: const Color(0xFF1A1442)),
                              SizedBox(height: 8.h),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'SCAN ',
                                      style: TextStyle(
                                        color: const Color(0xFF1A1442),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'QR',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' CODE',
                                      style: TextStyle(
                                        color: const Color(0xFF1A1442),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 0.03.sh), // Reduced spacing after button

                // Gallery section
                Text(
                  'Scan QR code from Gallery',
                  style: TextStyle(
                    color: const Color(0xFF1A1442),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Once upload the QR to the App, you will be\nredirected to the result screen.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:  const Color(0xFF1A1442),
                    fontSize: 13.sp,
                  ),
                ),

                SizedBox(height: 0.02.sh),

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
                    style: TextStyle(fontSize: 10.sp, color: const Color.fromARGB(179, 128, 128, 128)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
