import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auth_demo/setting/ui/upgreadPlan/feature_list_tile.dart';
import 'package:auth_demo/setting/ui/upgreadPlan/upgrade_confirmation_screen.dart'; // Import the UpgradeConfirmationScreen

class ReviewSummaryScreen extends StatelessWidget {
  final String paymentMethod;

  const ReviewSummaryScreen({Key? key, required this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Review Summary',
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
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
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Talento Pro',
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      '\$19.99 / month',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Divider(color: Colors.grey[300]),
                  SizedBox(height: 16.0),
                  FeatureListTile(title: 'All Talento Basic features.'),
                  FeatureListTile(title: 'Expanded document storage capacity.'),
                  FeatureListTile(title: 'Priority HR support.'),
                  FeatureListTile(title: 'Weekly product updates.'),
                  FeatureListTile(title: 'Advanced reporting and analytics.'),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Selected Payment Method',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/${paymentMethod.replaceAll(' ', '_').toLowerCase()}_logo.png',
                    height: 32,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, color: Colors.red);
                    },
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      paymentMethod,
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6200EE), // Adjust button color
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                // Show loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );

                // Simulate a delay for the payment processing
                Future.delayed(Duration(seconds: 3), () {
                  // Close the dialog
                  Navigator.of(context).pop();

                  // Navigate to the UpgradeConfirmationScreen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpgradeConfirmationScreen(),
                    ),
                  );
                });
              },
              child: Text(
                'Confirm Payment - \$19.99',
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
