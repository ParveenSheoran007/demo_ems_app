import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureListTile extends StatelessWidget {
  final String title;

  const FeatureListTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.black),
          SizedBox(width: 12.0),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
