
import 'package:demo_ems_app/core/color_string.dart';
import 'package:demo_ems_app/setting/ui/work_pattern/edit_manage_salary_rates.dart';
import 'package:flutter/material.dart';

import 'edit_manage_screen.dart';


class ManageSalaryRatesScreen extends StatefulWidget {
  const ManageSalaryRatesScreen({Key? key}) : super(key: key);

  @override
  State<ManageSalaryRatesScreen> createState() => _ManageSalaryRatesScreenState();
}

class _ManageSalaryRatesScreenState extends State<ManageSalaryRatesScreen> {
  final List<Map<String, String>> payrollData = [
    // Product
    {'name': 'Jenny Wilson', 'position': 'Product Manager', 'rates': '1500'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'rates': '1500'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'rates': '1500'},
    {'name': 'Anna Taylor', 'position': 'Product Owner', 'rates': '1500 '},

    // Engineering
    {'name': 'Jane Smith', 'position': 'Developer', 'rates': '1500'},
    {'name': 'Sam Brown', 'position': 'Designer', 'rates': '1500'},
    {'name': 'Chris Green', 'position': 'Tester', 'rates': '1500'},

    // Human Resources
    {'name': 'Pat White', 'position': 'HR Manager', 'rates': '1500'},
    {'name': 'Dana Johnson', 'position': 'Recruiter', 'rates': '1500'},

    // Finance
    {'name': 'Michael Black', 'position': 'Finance Manager', 'rates': '1500'},
    {'name': 'Rachel Blue', 'position': 'Accountant', 'rates': '1500'},

    // Marketing
    {'name': 'Linda Yellow', 'position': 'Marketing Manager', 'rates': '1500'},
    {'name': 'Tom Orange', 'position': 'Content Creator', 'rates': '1500'},

    // Sales
    {'name': 'Gary Red', 'position': 'Sales Executive', 'rates': '1500'},
    {'name': 'Pink', 'position': 'Sales Manager', 'rates': '1500'},
  ];

  void _updaterates(String name, String newrates) {
    setState(() {
      for (var item in payrollData) {
        if (item['name'] == name) {
          item['rates'] = newrates;
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
        title: Text('Manage rates Rates',
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
            '\%${payrollItem['rates']!}',
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
        ],
      ),
      trailing: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) =>
                EditManageSalaryRatesScreen(
                  avatarUrl: 'assets/avatar_${payrollData.indexOf(
                      payrollItem) % 5 + 1}.png',
                  name: payrollItem['name']!,
                  position: payrollItem['position']!,
                  initialratesPattern: payrollItem['rates']!,
                  onSave: (newrates) {
                    _updaterates(payrollItem['name']!, newrates);
                  }, initialSalaryPattern: '',
                ),
          );
        },
        child: Icon(Icons.edit, color: ColorString.textSecondary),
      ),
    );
  }

}
