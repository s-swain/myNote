import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const DescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: TextField(
        controller: controller,
        style: GoogleFonts.getFont(
          'Inter',
          color: Colors.black,
        ),
        maxLines: 2,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Write the description here',
          hintStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
