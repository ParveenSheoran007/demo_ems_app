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
            trailing: Icon(Icons.more_vert),
            onTap: () {
              // Handle list item tap
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB action
        },
        backgroundColor: Color(0xFF5C6AC4), // Matches the color from the previous design
        child: Icon(Icons.add),
      ),
    );
  }
}
