import 'package:auth_demo/setting/ui/upgreadPlan/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpgradePlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Upgrade Plan',
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PlanCard(
                title: 'Talento Free',
                price: 'Free',
                duration: '',
                features: [
                  'Basic access to Talento features.',
                  'Limited storage for documents and files.',
                  'Access to essential HR tools.',
                  'Standard customer support.',
                ],
                additionalText: 'Your current plan', buttonText: '',
              ),

              PlanCard(
                title: 'Talento Basic',
                price: '\$9.99',
                duration: '/ month',
                features: [
                  'Full access to all Talento features.',
                  'Increased document storage capacity.',
                  'Standard HR support.',
                  'Monthly product updates.',
                ],
                buttonText: 'Select Plan',
              ),
              PlanCard(
                title: 'Talento Pro',
                price: '\$19.99',
                duration: '/ month',
                features: [
                  'All Talento Basic features.',
                  'Expanded document storage capacity.',
                  'Priority HR support.',
                  'Weekly product updates.',
                  'Advanced reporting and analytics.',
                ],
                buttonText: 'Select Plan',
                isMostPopular: true, // Show "Most Popular" label
              ),
              PlanCard(
                title: 'Talento Premium',
                price: '\$29.99',
                duration: '/ month',
                features: [
                  'All Talento Pro features.',
                  'Extensive document storage capacity.',
                  'Priority HR support with 24/7 assistance.',
                  'Daily product updates.',
                  'Advanced reporting, analytics, and customization options.',
                ],
                buttonText: 'Select Plan',
              ),
              PlanCard(
                title: 'Talento Enterprise',
                price: 'Custom',
                duration: '',
                features: [
                  'Tailored to meet the unique needs of large organizations.',
                  'Unlimited document storage capacity.',
                  'Priority HR support with a dedicated account manager.',
                  'Real-time product updates.',
                  'Advanced reporting, analytics, customization, and integration options.',
                ],
                buttonText: 'Contact Sales',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
