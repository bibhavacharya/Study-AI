import 'dart:io';

import 'package:flutter/material.dart';

import '../route/app_routes.dart';
import '../services/image_picker_service.dart';
import 'preview_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ImagePickerService picker = ImagePickerService();

  Future<void> _pickImage(
      BuildContext context,
      bool fromCamera,
      ) async {
    File? image;

    if (fromCamera) {
      image = await picker.pickFromCamera();
    } else {
      image = await picker.pickFromGallery();
    }

    if (image == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PreviewScreen(image: image!),
      ),
    );
  }

  Widget buildButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 28),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study AI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.menu_book_rounded,
              size: 90,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            const Text(
              "AI Notes Summarizer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Capture your handwritten or printed notes and get AI-generated summaries instantly.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            buildButton(
              context: context,
              icon: Icons.camera_alt,
              title: "Scan Notes",
              color: Colors.deepPurple,
              onTap: () {
                _pickImage(context, true);
              },
            ),

            const SizedBox(height: 15),

            buildButton(
              context: context,
              icon: Icons.photo_library,
              title: "Upload from Gallery",
              color: Colors.blue,
              onTap: () {
                _pickImage(context, false);
              },
            ),

            const SizedBox(height: 15),

            buildButton(
              context: context,
              icon: Icons.history,
              title: "History",
              color: Colors.orange,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.history);
              },
            ),

            const SizedBox(height: 15),

            buildButton(
              context: context,
              icon: Icons.settings,
              title: "Settings",
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.settings);
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}