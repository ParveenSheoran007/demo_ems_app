import 'package:demo_ems_app/core/color_string.dart';
import 'package:demo_ems_app/setting/ui/work_pattern/work_pattern.dart';
import 'package:demo_ems_app/setting/ui/work_pattern/workday_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditWorkdayScheduleScreen extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String position;
  final String workPattern;

  EditWorkdayScheduleScreen({
    required this.avatarUrl,
    required this.name,
    required this.position,
    required this.workPattern,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.0,
          right: 16.0,
          top: 16.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Edit Workday Schedule',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Urbainst",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Divider(),

            // Profile Section
            ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(avatarUrl),
              ),
              title: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: "Urbainst"),
              ),
              subtitle: Text(
                position,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Urbainst",
                  color: Colors.grey[600],
                ),
              ),
            ),

            SizedBox(height: 16.0),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Work Pattern',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Urbainst",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: workPattern,
              items: [
                DropdownMenuItem(
                  value: 'Normal Work',
                  child: Text(
                    'Normal Work',
                    style: TextStyle(
                        fontFamily: "Urbainst",
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                DropdownMenuItem(
                    value: 'Shift Work',
                    child: Text(
                      'Shift Work',
                      style: TextStyle(
                          fontFamily: "Urbainst",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                DropdownMenuItem(
                    value: 'Remote Work',
                    child: Text(
                      'Remote Work',
                      style: TextStyle(
                          fontFamily: "Urbainst",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                border: InputBorder.none,
              ),
            ),

            SizedBox(height: 16.0),

            Divider(),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                          color: ColorString.buttonBackground, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.urbanist(
                          color: ColorString.buttonBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WorkdayScheduleScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorString.buttonBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Save',
                        style: GoogleFonts.urbanist(
                          color: ColorString.buttonText,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }
}
