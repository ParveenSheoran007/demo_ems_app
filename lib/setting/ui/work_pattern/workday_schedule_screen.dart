import 'package:demo_ems_app/core/color_string.dart';
import 'package:flutter/material.dart';

import 'edit_workday_screen.dart';

class WorkdayScheduleScreen extends StatefulWidget {
  const WorkdayScheduleScreen({Key? key}) : super(key: key);

  @override
  State<WorkdayScheduleScreen> createState() => _WorkdayScheduleScreenState();
}

class _WorkdayScheduleScreenState extends State<WorkdayScheduleScreen> {
  final List<Map<String, String>> payrollData = [
    // Product
    {'name': 'Jenny Wilson', 'position': 'Product Manager', 'work': 'Normal Work'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'work': 'Normal Work'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'work': 'Shift Work'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'work': 'Remote Work'},

    // Engineering
    {'name': 'Jane Smith', 'position': 'Developer', 'work': 'Normal Work'},
    {'name': 'Sam Brown', 'position': 'Designer', 'work': 'Normal Work'},
    {'name': 'Chris Green', 'position': 'Tester', 'work': 'Normal Work'},

    // Human Resources
    {'name': 'Pat White', 'position': 'HR Manager', 'work': 'Normal Work'},
    {'name': 'Dana Johnson', 'position': 'Recruiter', 'work': 'Normal Work'},

    // Finance
    {'name': 'Michael Black', 'position': 'Finance Manager', 'work': 'Normal Work'},
    {'name': 'Rachel Blue', 'position': 'Accountant', 'work': 'Normal Work'},

    // Marketing
    {'name': 'Linda Yellow', 'position': 'Marketing Manager', 'work': 'Normal Work'},
    {'name': 'Tom Orange', 'position': 'Content Creator', 'work': 'Normal Work'},

    // Sales
    {'name': 'Gary Red', 'position': 'Sales Executive', 'work': 'Normal Work'},
    {'name': 'Pink', 'position': 'Sales Manager', 'work': 'Normal Work'},
  ];

  List<Map<String, String>> get productData => payrollData
      .where((item) => item['position']!.contains('Product'))
      .toList();

  List<Map<String, String>> get engineeringData => payrollData
      .where((item) =>
  item['position']!.contains('Developer') ||
      item['position']!.contains('Designer') ||
      item['position']!.contains('Tester'))
      .toList();

  List<Map<String, String>> get humanResourcesData => payrollData
      .where((item) =>
  item['position']!.contains('HR') ||
      item['position']!.contains('Recruiter'))
      .toList();

  List<Map<String, String>> get financeData => payrollData
      .where((item) =>
  item['position']!.contains('Finance') ||
      item['position']!.contains('Accountant'))
      .toList();

  List<Map<String, String>> get marketingData => payrollData
      .where((item) =>
  item['position']!.contains('Marketing') ||
      item['position']!.contains('Content'))
      .toList();

  List<Map<String, String>> get salesData =>
      payrollData.where((item) => item['position']!.contains('Sales')).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Workday Schedule',
            style: TextStyle(
                color: ColorString.textPrimary, fontWeight: FontWeight.bold)),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildCategorySection('Product', productData),
                _buildCategorySection('Engineering', engineeringData),
                _buildCategorySection('Human Resources', humanResourcesData),
                _buildCategorySection('Finance', financeData),
                _buildCategorySection('Marketing', marketingData),
                _buildCategorySection('Sales', salesData),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
      String category, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(category,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildPayrollItem(context, data[index]);
          },
        ),
      ],
    );
  }

  Widget _buildPayrollItem(
      BuildContext context, Map<String, String> payrollItem) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 28,
        backgroundImage: AssetImage(
            'assets/avatar_${payrollData.indexOf(payrollItem) % 5 + 1}.png'),
      ),
      title: Text(
        payrollItem['name']!,
        style: TextStyle(
            color: ColorString.textPrimary, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        payrollItem['position']!,
        style: TextStyle(color: ColorString.textSecondary),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            payrollItem['work']!,
            style: TextStyle(color: ColorString.textPrimary, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => EditWorkdayScheduleScreen(
                  avatarUrl: 'assets/avatar_${payrollData.indexOf(payrollItem) % 5 + 1}.png',
                  name: payrollItem['name']!,
                  position: payrollItem['position']!,
                  workPattern: payrollItem['work']!,
                ),
              );
            },
            child: Icon(Icons.edit, color: ColorString.textSecondary),
          ),
        ],
      ),


    );
  }

}
