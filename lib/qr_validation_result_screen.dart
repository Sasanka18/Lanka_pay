import 'package:flutter/material.dart';

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
    //final screenSize = MediaQuery.of(context).size;
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
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 40,
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
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'QR',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Qr Code Validator',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14
                    )
                  ),
                ],
              ),
            ),

            // Validation result list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: validationData.length,
                itemBuilder: (context, index) {
                  final item = validationData[index];
                  final isValid = item['status'] == 'VALID';

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          // Tag and Value/Length Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Tag on left corner
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['tag'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Status in middle
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isValid ? Colors.green : Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  item['status'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // Value and Length on right corner
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Value: ${item['value'] ?? ''}',
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.end,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Length: ${item['length']}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Note if exists
                          if (item['note'] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                item['note'],
                                style: const TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home Button
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                        child: Image.asset(
                          'assets/home.png',
                          height: 35,
                          width: 35,
                          color: const Color(0xFF1A1442),
                        ),
                      ),
                    ),
                  ),
                  
                  // Back to Scanner Button
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 60,
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
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Back to Scanner',
                            style: TextStyle(
                              color: Color(0xFF1A1442),
                              fontSize: 16,
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

            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "This application developed by DirectPay for developers, merchants and community. Version 1.0",
                style: TextStyle(fontSize: 10, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
