import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF001F3F)),
      onPressed: onPressed,
      child: const Text('Simpan & Lanjut ke Profile'),
    );
  }
}
