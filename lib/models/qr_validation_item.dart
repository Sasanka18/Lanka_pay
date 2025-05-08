class QRValidationItem {
  final String tag;
  final String value;
  final int length;
  final String status;
  final String? note;

  QRValidationItem({
    required this.tag,
    required this.value,
    required this.length,
    required this.status,
    this.note,
  });

  bool get isValid => status == 'VALID';
}