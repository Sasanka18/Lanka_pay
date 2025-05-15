import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRValidationResultScreen extends StatelessWidget {
  final String qrData;

  const QRValidationResultScreen({
    super.key,
    required this.qrData,
  });

  List<Map<String, dynamic>> validateQRData(String data) {
    return [
      {'tag': '58 - Country Code', 'value': 'LK', 'length': 2, 'status': 'VALID'},
      {'tag': '59 - Merchant Name', 'value': 'KING WAY', 'length': 8, 'status': 'VALID'},
      {'tag': '60 - Merchant City', 'value': 'KADUWELA', 'length': 8, 'status': 'VALID'},
      {'tag': '61 - Postal Code', 'value': '', 'length': 0, 'status': 'INVALID', 'note': 'Tag is mandatory'},
      {'tag': '62 SubTag 5 Reference', 'value': 'SmartPay', 'length': 8, 'status': 'VALID'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final validationData = validateQRData(qrData);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: const Color(0xFF1A1442),
              width: 1.sw, // Full screen width
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 40.h,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'LANKAQR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                    'Qr Code Validator',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.sp
                    )
                  ),
                ],
              ),
            ),

            // Validation result list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12.w),
                itemCount: validationData.length,
                itemBuilder: (context, index) {
                  final item = validationData[index];
                  final isValid = item['status'] == 'VALID';

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    child: ListTile(
                      title: Text(
                        item['tag'],
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Value: ${item['value'] ?? ''}',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            'Length: ${item['length']}',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          if (item['note'] != null)
                            Text(
                              item['note'],
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp
                              ),
                            ),
                        ],
                      ),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h
                        ),
                        decoration: BoxDecoration(
                          color: isValid ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          item['status'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom section
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xFF1A1442),
                        ),
                      ),
                    ),
                  ),
                  
                  // Back to Scanner Button
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Colors.black26),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10.r,
                              offset: Offset(0, 5.h),
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Back to Scanner',
                            style: TextStyle(
                              color: const Color(0xFF1A1442),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                "This application developed by DirectPay for developers, merchants and community. Version 1.0",
                style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
