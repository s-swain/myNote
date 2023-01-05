import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteTitle extends StatelessWidget {
  final TextEditingController controller;

  const NoteTitle({super.key, required this.controller});

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
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Note Title',
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            contentPadding: EdgeInsets.only(left: 10.0)),
      ),
    );
  }
}
