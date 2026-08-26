import 'dart:io';

import 'package:flutter/material.dart';

import '../services/ocr_services.dart';
import 'result_screen.dart';

class PreviewScreen extends StatefulWidget {
  final File image;

  const PreviewScreen({
    super.key,
    required this.image,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final OCRService _ocrService = OCRService();

  bool _loading = false;

  Future<void> _extractText() async {
    setState(() {
      _loading = true;
    });

    final text = await _ocrService.extractText(widget.image);

    setState(() {
      _loading = false;
    });

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(text: text),
      ),
    );
  }

  @override
  void dispose() {
    _ocrService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  widget.image,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: _loading ? null : _extractText,
                icon: _loading
                    ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Icon(Icons.document_scanner),
                label: Text(
                  _loading ? "Extracting..." : "Extract Text",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}