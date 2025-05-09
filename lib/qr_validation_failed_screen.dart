import 'package:flutter/material.dart';

class QRValidationFailedScreen extends StatelessWidget {
  const QRValidationFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 50),
              color: Color(0xFF201B51),
              child: Column(
                children: [
                  // Logo and QR icon row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 60,
                        width: 60,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'LANKA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'QR',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Qr Code Validator',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              'Scan Result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 24),

            // Failure icon
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromARGB(255, 57, 68, 196), width: 4),
              ),
              child: const Icon(Icons.close, size: 48, color: Color.fromARGB(255, 57, 68, 196)),
            ),

            const SizedBox(height: 16),

            const Text(
              'Validation Failed.',
              style: TextStyle(color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'No Data Found.',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),

            const SizedBox(height: 32),

            // Back to scanner button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
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
                  
                      const SizedBox(width: 8),
                      Text(
                        'Back to Scanner',
                        style: TextStyle(
                          color: const Color(0xFF1A1442),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Home icon
            GestureDetector(
              onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: const Icon(
                Icons.home, 
                size: 28, 
                color: Colors.black45
              ),
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "This application developed by DirectPay for developers,\nmerchants and community. Version 1.0",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
