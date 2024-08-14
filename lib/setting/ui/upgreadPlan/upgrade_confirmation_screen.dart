import 'package:demo_ems_app/core/color_string.dart';
import 'package:flutter/material.dart';

class UpgradeConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.close,
            size: 28,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  "assets/images/Illustration=Dot Confetti, Component=Successful Illustrations (1).png"),
              SizedBox(height: 20.0),
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'You\'ve successfully upgraded to Talento Pro',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              _buildBenefitItem('All Talento Basic features'),
              _buildBenefitItem('Expanded document storage capacity'),
              _buildBenefitItem('Priority HR support'),
              _buildBenefitItem('Weekly product updates'),
              _buildBenefitItem('Advanced reporting and analytics'),
              SizedBox(height: 30.0),
              Text(
                'If you have any questions or need assistance, feel free to reach out to our support team. Thanks for choosing Talento!',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Handle OK button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorString.buttonBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String benefit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: ColorString.buttonBackground,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              benefit,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
