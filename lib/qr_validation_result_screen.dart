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
    final screenSize = MediaQuery.of(context).size;
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
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 40,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'LANKAQR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
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
                    child: ListTile(
                      title: Text(item['tag']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Value: ${item['value'] ?? ''}'),
                          Text('Length: ${item['length']}'),
                          if (item['note'] != null)
                            Text(item['note'], style: const TextStyle(color: Colors.red)),
                        ],
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isValid ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item['status'],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
