import 'package:demo_ems_app/core/color_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_payment_method_screen.dart'; // Import your screen here

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String duration;
  final List<String> features;
  final String buttonText;
  final String? additionalText;
  final bool showAdditionalContainer;
  final bool isMostPopular;

  const PlanCard({
    required this.title,
    required this.price,
    required this.duration,
    required this.features,
    required this.buttonText,
    this.additionalText,
    this.showAdditionalContainer = false,
    this.isMostPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isMostPopular)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: ColorString.buttonBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Most Popular',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    price,
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    duration,
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: features
                  .map(
                    (feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          feature,
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            if (buttonText != null && buttonText!.isNotEmpty)
              Center(
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 52, right: 52, top: 4, bottom: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      backgroundColor: ColorString
                          .buttonBackground, // Button background color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectPaymentMethodScreen(),
                        ),
                      );
                    },
                    child: Text(
                      buttonText!,
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Button text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (additionalText != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text(
                    additionalText!,
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
