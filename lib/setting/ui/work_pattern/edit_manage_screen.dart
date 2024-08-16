import 'package:demo_ems_app/core/color_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditManageScreen extends StatefulWidget {
  final String avatarUrl;
  final String name;
  final String position;
  final String initialSalaryPattern;

  EditManageScreen({
    required this.avatarUrl,
    required this.name,
    required this.position,
    required this.initialSalaryPattern,
    required this.onSave,
  });

  final void Function(String) onSave;

  @override
  _EditManageScreenState createState() => _EditManageScreenState();
}

class _EditManageScreenState extends State<EditManageScreen> {
  late TextEditingController _salaryController;

  @override
  void initState() {
    super.initState();
    _salaryController = TextEditingController(text: widget.initialSalaryPattern);
  }

  @override
  void dispose() {
    _salaryController.dispose();
    super.dispose();
  }

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
                'Edit Salary Rates',
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
                backgroundImage: AssetImage(widget.avatarUrl),
              ),
              title: Text(
                widget.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: "Urbainst"),
              ),
              subtitle: Text(
                widget.position,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Urbainst",
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Salary Input
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Salary Rates (per hour)',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Urbainst",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _salaryController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
              ),
              keyboardType: TextInputType.number,
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
                      Navigator.pop(context);
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
                      widget.onSave(_salaryController.text);
                      Navigator.pop(context);
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
