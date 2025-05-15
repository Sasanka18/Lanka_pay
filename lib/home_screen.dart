import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
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
  
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), 
      minTextAdapt: true,
    );

    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1.2.sh, 
            width: 1.sw,   
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/LankaQR Validator.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo image
                  Image.asset(
                    'assets/logo.png',
                    height: 150.h,
                    width: 150.w,
                  ),
                  Text(
                    'QR Code Validator',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    'Use this application to validate any LankaQR codes\neasily, fast, and accurately.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 80.h), 

                  // Power button 
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 60.w),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                        ),
                        child: Icon(
                          Icons.power_settings_new,
                          color: const Color(0xFF1A1442),
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h), 

                  // Scan QR Code button
                  GestureDetector(
                    onTap: () {
                      try {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QRScannerScreen(),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error opening scanner'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 0.7.sw,
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.r,
                            offset: Offset(0, 5.h),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            size: 40.sp,
                            color: const Color(0xFF1A1442)
                          ),
                          SizedBox(height: 8.h),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                'SCAN ',
                                style: TextStyle(
                                  color: const Color(0xFF1A1442),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                'QR',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                ' CODE',
                                style: TextStyle(
                                  color: const Color(0xFF1A1442),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  Text(
                    'Scan QR code from Gallery',
                    style: TextStyle(
                      color: const Color(0xFF201B51),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  const Text(
                    'Once uploaded, you will be redirected\nto the result screen.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF201B51)),
                  ),

                  SizedBox(height: 24.h),

                  // Upload buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _pickImage(context),
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.white, 
                            border: Border.all(color: Colors.black26), 
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Choose QR Code',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF525252), 
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
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.upload,
                              color: Color(0xFF1A1442)),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  const Text(
                    'This application developed by DirectPay for developers,\nmerchants and community. Version 1.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Colors.white54),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
