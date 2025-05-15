import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRValidationFailedScreen extends StatelessWidget {
  const QRValidationFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 32.h),
              color: const Color(0xFF201B51),
              child: Column(
                children: [
                  // Logo and QR icon row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 60.h,
                        width: 60.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LANKA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'QR',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Qr Code Validator',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            Text(
              'Scan Result',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600
              ),
            ),

            SizedBox(height: 24.h),

            // Failure icon
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 57, 68, 196),
                  width: 4.w
                ),
              ),
              child: Icon(
                Icons.close,
                size: 48.sp,
                color: const Color.fromARGB(255, 57, 68, 196)
              ),
            ),

            SizedBox(height: 16.h),

            Text(
              'Validation Failed.',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'No Data Found.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14.sp
              ),
            ),

            SizedBox(height: 32.h),

            // Back to scanner button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.25.sw),
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
                      SizedBox(width: 8.w),
                      Text(
                        'Back to Scanner',
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

            SizedBox(height: 20.h),

            // Home icon
            GestureDetector(
              onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: Icon(
                Icons.home,
                size: 28.sp,
                color: Colors.black45
              ),
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                "This application developed by DirectPay for developers,\nmerchants and community. Version 1.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.grey
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
