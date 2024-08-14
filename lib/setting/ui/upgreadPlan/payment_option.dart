import 'package:demo_ems_app/core/color_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentOption extends StatelessWidget {
  final Widget icon; // Widget to support both Icon and Image
  final String label;
  final bool selected;
  final VoidCallback onTap; // Updated to use VoidCallback

  PaymentOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap, // Added onTap parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle the tap
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: selected ? ColorString.primary : ColorString.border,
            width: selected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.urbanist(
                  fontSize: 18.0,
                  color: ColorString.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (selected)
              Icon(
                Icons.check,
                color: ColorString.primary,
              ),
          ],
        ),
      ),
    );
  }
}
