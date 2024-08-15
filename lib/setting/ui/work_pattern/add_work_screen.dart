import 'package:flutter/material.dart';

class AddWorkScreen extends StatefulWidget {
  const AddWorkScreen({super.key});

  @override
  State<AddWorkScreen> createState() => _AddWorkScreenState();
}

class _AddWorkScreenState extends State<AddWorkScreen> {
  final List<String> workPatterns = [
    'Normal Work',
    'Shift Work',
    'Remote Work',
    'Part-Time',
    'Flexible Working',
    'Job Sharing',
    'Compressed Workweek',
    'Internship',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Work Pattern',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: workPatterns.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              workPatterns[index],
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: PopupMenuButton<int>(
              color: Colors.white12,
              icon: Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 1) {
                  // Handle edit action
                } else if (value == 2) {
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.black),
                      SizedBox(width: 8),
                      Text("Edit Work Pattern"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        "Remove Work Pattern",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Color(0xFF6C60FF),
        child: Icon(Icons.add),
      ),
    );
  }
}
