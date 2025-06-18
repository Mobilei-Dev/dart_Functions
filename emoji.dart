import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() async {
  final pdf = pw.Document();

  // List of points to print with emoji bullets
  final points = [
    'Use Dart for cross-platform development',
    'Write clean and maintainable code',
    'Leverage Flutter for UI design',
    'Use emojis to make lists fun! 😊🚀',
  ];

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Container(
          color: PdfColors.black, // black background so white text is visible
          padding: pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: points.map((point) {
              return pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 4),
                child: pw.Text(
                  '👉 $point',
                  style: pw.TextStyle(
                    color: PdfColors.white, // white text color
                    fontSize: 14,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    ),
  );

  // Save the PDF file to disk
  final file = File('emoji_bullets.pdf');
  await file.writeAsBytes(await pdf.save());

  print('PDF generated: ${file.path}');
}
