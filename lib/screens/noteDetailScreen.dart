import 'package:flutter/material.dart';
import 'package:my_notes/utilities/utils.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.keyboard_backspace_outlined,
                  size: 30.0,
                ),
              ),
              Center(
                  child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueAccent,
                  ),
                ),
                child: Text(
                  "Note Details",
                  style: safeGoogleFont(
                    'Rowdies',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    height: 1.3333333333,
                    letterSpacing: -0.24,
                    color: Colors.white,
                  ),
                ),
              )),
              const SizedBox(height: 50.0),
              Text(
                title,
                style: safeGoogleFont(
                  'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 1.3333333333,
                  letterSpacing: -0.24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50.0),
              Text(
                description,
                style: safeGoogleFont(
                  'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1.3333333333,
                  letterSpacing: -0.24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
