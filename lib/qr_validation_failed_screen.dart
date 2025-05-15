import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRValidationFailedScreen extends StatelessWidget {
  const QRValidationFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove MediaQuery since we're using ScreenUtil
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              color: const Color(0xFF1A1442),
              child: Column(
                children: [
                  Icon(Icons.qr_code, size: 40.sp, color: Colors.white),
                  SizedBox(height: 8.h),
                  Text(
                    'LANKAQR',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Qr Code Validator',
                    style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),

            Text(
              'Scan Result',
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 24.h),

            // Failure icon
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.deepPurple, width: 4.w),
              ),
              child: Icon(
                  Icons.close,
                  size: 48.sp,
                  color: Colors.deepPurple),
            ),

            SizedBox(height: 16.h),

            Text(
              'Validation Failed.',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8.h),

            Text(
              'No Data Found.',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.sp),
            ),

            SizedBox(height: 32.h),

            // Back to scanner button
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.w, vertical: 12.h),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.black12),
                elevation: 4,
              ),
              child: Text(
                'Back to Scanner',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),

            SizedBox(height: 20.h),

            // Home icon
            Icon(
                Icons.home,
                size: 28.sp,
                color: Colors.black45),

            const Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                "This application developed by DirectPay for developers,\nmerchants and community. Version 1.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
