
import 'package:demo_ems_app/core/color_string.dart';
import 'package:flutter/material.dart';

import 'edit_manage_screen.dart';


class ManageSalaryScreen extends StatefulWidget {
  const ManageSalaryScreen({Key? key}) : super(key: key);

  @override
  State<ManageSalaryScreen> createState() => _ManageSalaryScreenState();
}

class _ManageSalaryScreenState extends State<ManageSalaryScreen> {
  final List<Map<String, String>> payrollData = [
    // Product
    {'name': 'Jenny Wilson', 'position': 'Product Manager', 'salary': '1500'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'salary': '1500'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'salary': '1500'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'salary': '1500 '},

    // Engineering
    {'name': 'Jane Smith', 'position': 'Developer', 'salary': '1500'},
    {'name': 'Sam Brown', 'position': 'Designer', 'salary': '1500'},
    {'name': 'Chris Green', 'position': 'Tester', 'salary': '1500'},

    // Human Resources
    {'name': 'Pat White', 'position': 'HR Manager', 'salary': '1500'},
    {'name': 'Dana Johnson', 'position': 'Recruiter', 'salary': '1500'},

    // Finance
    {'name': 'Michael Black', 'position': 'Finance Manager', 'salary': '1500'},
    {'name': 'Rachel Blue', 'position': 'Accountant', 'salary': '1500'},

    // Marketing
    {'name': 'Linda Yellow', 'position': 'Marketing Manager', 'salary': '1500'},
    {'name': 'Tom Orange', 'position': 'Content Creator', 'salary': '1500'},

    // Sales
    {'name': 'Gary Red', 'position': 'Sales Executive', 'salary': '1500'},
    {'name': 'Pink', 'position': 'Sales Manager', 'salary': '1500'},
  ];

  void _updateSalary(String name, String newSalary) {
    setState(() {
      for (var item in payrollData) {
        if (item['name'] == name) {
          item['salary'] = newSalary;
        }
      }
    });
  }
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
        title: Text('Manage Salary Rates',
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              payrollItem['name']!,
              style: TextStyle(
                  color: ColorString.textPrimary, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '\$${payrollItem['salary']!}',
            style: TextStyle(
                color: ColorString.textPrimary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            payrollItem['position']!,
            style: TextStyle(color: ColorString.textSecondary),
          ),
          Text(
          "/hr",
            style: TextStyle(color: ColorString.textSecondary),
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) =>
                EditManageScreen(
                  avatarUrl: 'assets/avatar_${payrollData.indexOf(
                      payrollItem) % 5 + 1}.png',
                  name: payrollItem['name']!,
                  position: payrollItem['position']!,
                  initialSalaryPattern: payrollItem['salary']!,
                  onSave: (newSalary) {
                    _updateSalary(payrollItem['name']!, newSalary);
                  },
                ),
          );
        },
        child: Icon(Icons.edit, color: ColorString.textSecondary),
      ),
    );
  }

}
