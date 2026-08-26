import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OCRService {
  final TextRecognizer _textRecognizer = TextRecognizer();

  Future<String> extractText(File image) async {
    final inputImage = InputImage.fromFile(image);

    final RecognizedText recognisedText =
    await _textRecognizer.processImage(inputImage);

    return recognisedText.text;
  }

  void dispose() {
    _textRecognizer.close();
  }
}