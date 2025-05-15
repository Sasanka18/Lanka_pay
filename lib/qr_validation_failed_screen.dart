import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFF1A1442),
              child: Column(
                children: const [
                  Icon(Icons.qr_code, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text('LANKAQR', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Qr Code Validator', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Text(
              'Scan Result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 24),

            // Failure icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.deepPurple, width: 4),
              ),
              child: const Icon(Icons.close, size: 48, color: Colors.deepPurple),
            ),

            const SizedBox(height: 16),

            Text(
              'Validation Failed.',
              style: TextStyle(color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              'No Data Found.',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),

            const SizedBox(height: 32),

            // Back to scanner button
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.black12),
                elevation: 4,
              ),
              child: const Text('Back to Scanner'),
            ),

            const SizedBox(height: 20),

            // Home icon
            const Icon(Icons.home, size: 28, color: Colors.black45),

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
