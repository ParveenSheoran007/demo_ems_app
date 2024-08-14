
import 'package:demo_ems_app/core/color_string.dart';
import 'package:demo_ems_app/setting/ui/CompanyProfile/company_profile_screen.dart';
import 'package:demo_ems_app/setting/ui/upgreadPlan/upgrade_plan_screen.dart';
import 'package:demo_ems_app/setting/ui/work_pattern/work_pattern_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  Widget buildListTile(String title, String imagePath,
      {Color iconColor = Colors.black,
      Color textColor = Colors.black,
      VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        imagePath,
        color: iconColor,
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.urbanist(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/Type=Logo Default, Component=Logo.png',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpgradePlanScreen()),
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.only(top: 20.0, bottom: 20, left: 2, right: 2),
                  decoration: BoxDecoration(
                    color: ColorString.buttonBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Illustration=Dot Confetti, Component=Successful Illustrations.png',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Upgrade Plan to Unlock More!',
                                style: GoogleFonts.urbanist(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Enjoy all the benefits and explore more possibilities',
                                style: GoogleFonts.urbanist(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Icon(Icons.chevron_right, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildListTile('Company Profile', 'assets/images/Work.png',
                  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyProfileScreen()),
                );
              }),
              buildListTile('Work Pattern', 'assets/images/Group.png',
                  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkPatternScreen()),
                );
              }),
              buildListTile(
                  'Workday Schedule', 'assets/images/Time Circle.png'),
              buildListTile(
                  'Manage Salary Rates', 'assets/images/Group(1).png'),
              buildListTile('Manage Tax Rates', 'assets/images/Document.png'),
              buildListTile('Manage Admin', 'assets/images/2 User.png'),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 10),
              buildListTile('Notification',
                  'assets/images/notification-icon-1837x2048-zgg2xntn.png'),
              buildListTile('Account & Security', 'assets/images/Group(3).png'),
              buildListTile(
                  'Billing & Subscriptions', 'assets/images/Star.png'),
              buildListTile('Payment Methods', 'assets/images/Card.png'),
              buildListTile('Linked Accounts', 'assets/images/Swap.png'),
              buildListTile('App Appearance', 'assets/images/Show.png'),
              buildListTile('Data & Analytics', 'assets/images/Group(4).png'),
              buildListTile('Help & Support', 'assets/images/Paper.png'),
              SizedBox(height: 10),
              buildListTile('Logout', 'assets/images/Group(6).png',
                  iconColor: Colors.red, textColor: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
