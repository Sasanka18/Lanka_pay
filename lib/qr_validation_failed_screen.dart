import 'package:flutter/material.dart';

class QRValidationFailedScreen extends StatelessWidget {
  const QRValidationFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
              color: const Color(0xFF201B51),
              child: Column(
                children: [
                  // Logo and QR icon row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.15,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LANKA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'QR',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Qr Code Validator',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            Text(
              'Scan Result',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            // Failure icon
            Container(
              padding: EdgeInsets.all(screenWidth * 0.015),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 57, 68, 196),
                  width: 4
                ),
              ),
              child: Icon(
                Icons.close,
                size: screenWidth * 0.12,
                color: const Color.fromARGB(255, 57, 68, 196)
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            Text(
              'Validation Failed.',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            Text(
              'No Data Found.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: screenWidth * 0.035
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            // Back to scanner button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: screenHeight * 0.07,
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
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Back to Scanner',
                        style: TextStyle(
                          color: const Color(0xFF1A1442),
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // Home icon
            GestureDetector(
              onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: Icon(
                Icons.home,
                size: screenWidth * 0.07,
                color: Colors.black45
              ),
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.015),
              child: Text(
                "This application developed by DirectPay for developers,\nmerchants and community. Version 1.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.025,
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
