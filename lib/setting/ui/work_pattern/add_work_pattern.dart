import 'package:demo_ems_app/core/color_string.dart';
import 'package:demo_ems_app/setting/ui/work_pattern/work_pattern.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWorkPatternScreen extends StatefulWidget {
  @override
  _AddWorkPatternScreenState createState() => _AddWorkPatternScreenState();
}

class _AddWorkPatternScreenState extends State<AddWorkPatternScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _clockInControllerMonday = TextEditingController();
  final TextEditingController _clockOutControllerMonday = TextEditingController();
  final TextEditingController _breakControllerMonday = TextEditingController();
  final TextEditingController _afterBreakControllerMonday = TextEditingController();
  final TextEditingController _maxBreakMinutesControllerMonday = TextEditingController();

  final TextEditingController _clockInControllerTuesday = TextEditingController();
  final TextEditingController _clockOutControllerTuesday = TextEditingController();
  final TextEditingController _breakControllerTuesday = TextEditingController();
  final TextEditingController _afterBreakControllerTuesday = TextEditingController();
  final TextEditingController _maxBreakMinutesControllerTuesday = TextEditingController();

  final TextEditingController _clockInControllerWednesday = TextEditingController();
  final TextEditingController _clockOutControllerWednesday = TextEditingController();
  final TextEditingController _breakControllerWednesday = TextEditingController();
  final TextEditingController _afterBreakControllerWednesday = TextEditingController();
  final TextEditingController _maxBreakMinutesControllerWednesday = TextEditingController();

  final TextEditingController _clockInControllerThursday = TextEditingController();
  final TextEditingController _clockOutControllerThursday = TextEditingController();
  final TextEditingController _breakControllerThursday = TextEditingController();
  final TextEditingController _afterBreakControllerThursday = TextEditingController();
  final TextEditingController _maxBreakMinutesControllerThursday = TextEditingController();

  final TextEditingController _clockInControllerFriday = TextEditingController();
  final TextEditingController _clockOutControllerFriday = TextEditingController();
  final TextEditingController _breakControllerFriday = TextEditingController();
  final TextEditingController _afterBreakControllerFriday = TextEditingController();
  final TextEditingController _maxBreakMinutesControllerFriday = TextEditingController();

  final TextEditingController _clockInControllerSaturday = TextEditingController();
  final TextEditingController _clockOutControllerSaturday = TextEditingController();
  final TextEditingController _breakControllerSaturday = TextEditingController();
  final TextEditingController _afterBreakControllerSaturday = TextEditingController();
  final TextEditingController _maxBreakMinutesControllerSaturday = TextEditingController();

  final TextEditingController _clockInControllerSunday = TextEditingController();
  final TextEditingController _clockOutControllerSunday = TextEditingController();
  final TextEditingController _breakControllerSunday = TextEditingController();
  final TextEditingController _afterBreakControllerSunday = TextEditingController();
  final TextEditingController _maxBreakMinutesControllerSunday = TextEditingController();

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  Widget _buildDaySection(
      String day,
      TextEditingController clockInController,
      TextEditingController clockOutController,
      TextEditingController breakController,
      TextEditingController afterBreakController,
      TextEditingController maxBreakMinutesController,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),

        // Work Pattern
        Text(
          "Work Pattern",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "Urbanist"),
        ),
        SizedBox(height: 8.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: "Select Work Pattern",
              border: InputBorder.none,
            ),
            items: [
              DropdownMenuItem(
                child: Text('Pattern 1'),
                value: 'pattern1',
              ),
              DropdownMenuItem(
                child: Text('Pattern 2'),
                value: 'pattern2',
              ),
              // Add more patterns if needed
            ],
            onChanged: (value) {
              // Handle work pattern change
            },
          ),
        ),
        SizedBox(height: 16.0),

        // Clock In and Clock Out
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Clock In",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, fontFamily: "Urbanist"),
            ),
            Text(
              "Clock Out",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, fontFamily: "Urbanist"),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: clockInController,
                  readOnly: true,
                  onTap: () => _selectTime(context, clockInController),
                  decoration: InputDecoration(
                    hintText: 'Clock in',
                    suffixIcon: Icon(Icons.access_time, size: 16,),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: clockOutController,
                  readOnly: true,
                  onTap: () => _selectTime(context, clockOutController),
                  decoration: InputDecoration(
                    hintText: 'Clock out',
                    suffixIcon: Icon(Icons.access_time, size: 16,),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),

        // Break and After Break
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Break",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, fontFamily: "Urbanist"),
            ),
            Text(
              "After Break",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, fontFamily: "Urbanist"),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: breakController,
                  readOnly: true,
                  onTap: () => _selectTime(context, breakController),
                  decoration: InputDecoration(
                    hintText: 'Break',
                    suffixIcon: Icon(Icons.access_time, size: 16,),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: afterBreakController,
                  readOnly: true,
                  onTap: () => _selectTime(context, afterBreakController),
                  decoration: InputDecoration(
                    hintText: 'After break',
                    suffixIcon: Icon(Icons.access_time, size: 16,),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),

        // Max Break Minutes
        Text(
          "Max. Break Minutes",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Urbanist'),
        ),
        SizedBox(height: 8.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: maxBreakMinutesController,
            decoration: InputDecoration(
              hintText: 'Max break minutes',
              suffixIcon: Icon(Icons.access_time, size: 16,),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Work Pattern', style: TextStyle(fontFamily: 'Urbanist', fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildDaySection(
                "Monday",
                _clockInControllerMonday,
                _clockOutControllerMonday,
                _breakControllerMonday,
                _afterBreakControllerMonday,
                _maxBreakMinutesControllerMonday,
              ),
              _buildDaySection(
                "Tuesday",
                _clockInControllerTuesday,
                _clockOutControllerTuesday,
                _breakControllerTuesday,
                _afterBreakControllerTuesday,
                _maxBreakMinutesControllerTuesday,
              ),
              _buildDaySection(
                "Wednesday",
                _clockInControllerWednesday,
                _clockOutControllerWednesday,
                _breakControllerWednesday,
                _afterBreakControllerWednesday,
                _maxBreakMinutesControllerWednesday,
              ),
              _buildDaySection(
                "Thursday",
                _clockInControllerThursday,
                _clockOutControllerThursday,
                _breakControllerThursday,
                _afterBreakControllerThursday,
                _maxBreakMinutesControllerThursday,
              ),
              _buildDaySection(
                "Friday",
                _clockInControllerFriday,
                _clockOutControllerFriday,
                _breakControllerFriday,
                _afterBreakControllerFriday,
                _maxBreakMinutesControllerFriday,
              ),
              _buildDaySection(
                "Saturday",
                _clockInControllerSaturday,
                _clockOutControllerSaturday,
                _breakControllerSaturday,
                _afterBreakControllerSaturday,
                _maxBreakMinutesControllerSaturday,
              ),
              _buildDaySection(
                "Sunday",
                _clockInControllerSunday,
                _clockOutControllerSunday,
                _breakControllerSunday,
                _afterBreakControllerSunday,
                _maxBreakMinutesControllerSunday,
              ),
              SizedBox(height: 24.0),
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Cancel action
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
                          MaterialPageRoute(
                              builder: (context) => WorkPattern()),
                        );                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorString.buttonBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Save',
                          style: GoogleFonts.lato(
                            color: ColorString.buttonText,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),            ],
          ),
        ),
      ),
    );
  }
}
