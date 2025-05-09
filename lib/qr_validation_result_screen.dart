import 'package:flutter/material.dart';
import 'qr_scanner_screen.dart';

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
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    final validationData = validateQRData(qrData);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: const Color(0xFF1A1442),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.04,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: screenHeight * 0.06,
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

            //  result list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(screenWidth * 0.03),
                itemCount: validationData.length,
                itemBuilder: (context, index) {
                  final item = validationData[index];
                  final isValid = item['status'] == 'VALID';

                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.008,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  item['tag'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03,
                                  vertical: screenHeight * 0.005,
                                ),
                                decoration: BoxDecoration(
                                  color: isValid ? Colors.green : Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  item['status'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Value: ${item['value'] ?? ''}',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Text(
                                      'Length: ${item['length']}',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        color: Colors.grey[600],
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (item['note'] != null)
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.01),
                              child: Text(
                                item['note'],
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: screenWidth * 0.03,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom section
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                        child: Image.asset(
                          'assets/home.png',
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.08,
                          color: const Color(0xFF1A1442),
                        ),
                      ),
                    ),
                  ),
                  // Back to Scanner 
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black26),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QRScannerScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Back to Scanner',
                          style: TextStyle(
                            color: const Color(0xFF1A1442),
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.01),
              child: Text(
                "This application developed by DirectPay for developers, merchants and community. Version 1.0",
                style: TextStyle(
                  fontSize: screenWidth * 0.025,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
