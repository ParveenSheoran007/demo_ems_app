import 'package:auth_demo/core/color_string.dart';
import 'package:auth_demo/setting/ui/upgreadPlan/payment_option.dart';
import 'package:auth_demo/setting/ui/upgreadPlan/review_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  @override
  _SelectPaymentMethodScreenState createState() => _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
  String? selectedPaymentMethod;

  void _onPaymentMethodSelected(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  void _onContinue() {
    if (selectedPaymentMethod != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ReviewSummaryScreen(paymentMethod: selectedPaymentMethod!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorString.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            'Select Payment Method',
            style: GoogleFonts.urbanist(
              fontSize: 20,
              color: ColorString.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: ColorString.textPrimary),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PaymentOption(
              icon: Image.asset('assets/images/Type=Default, Component=Avatar (7).png'),
              label: 'PayPal',
              selected: selectedPaymentMethod == 'PayPal',
              onTap: () => _onPaymentMethodSelected('PayPal'),
            ),
            PaymentOption(
              icon: Image.asset('assets/images/Type=Default, Component=Avatar (8).png'),
              label: 'Google Pay',
              selected: selectedPaymentMethod == 'Google Pay',
              onTap: () => _onPaymentMethodSelected('Google Pay'),
            ),
            PaymentOption(
              icon: Image.asset('assets/images/Type=Default, Component=Avatar (9).png'),
              label: 'Apple Pay',
              selected: selectedPaymentMethod == 'Apple Pay',
              onTap: () => _onPaymentMethodSelected('Apple Pay'),
            ),
            PaymentOption(
              icon: Image.asset('assets/images/Type=Default, Component=Avatar (10).png'),
              label: '.... .... .... 4679',
              selected: selectedPaymentMethod == '**** **** **** 4679',
              onTap: () => _onPaymentMethodSelected('**** **** **** 4679'),
            ),
            PaymentOption(
              icon: Image.asset('assets/images/Type=Default, Component=Avatar (11).png'),
              label: '.... .... .... 5567',
              selected: selectedPaymentMethod == '**** **** **** 5567',
              onTap: () => _onPaymentMethodSelected('**** **** **** 5567'),
            ),
            PaymentOption(
              icon: Image.asset('assets/images/Ellipse (5).png'),
              label: '.... .... .... 8456',
              selected: selectedPaymentMethod == '**** **** **** 8456',
              onTap: () => _onPaymentMethodSelected('**** **** **** 8456'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorString.buttonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: Text(
                  'Continue',
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorString.buttonText,
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