import 'package:demo_ems_app/setting/ui/work_pattern/add_work_screen.dart';
import 'package:flutter/material.dart';

class WorkPattern extends StatefulWidget {
  const WorkPattern({super.key});

  @override
  State<WorkPattern> createState() => _WorkPatternState();
}

class _WorkPatternState extends State<WorkPattern> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Normal Work',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.more_vert),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddWorkScreen()),
          );
        },
        backgroundColor: Color(0xFF5C6AC4),
        child: Icon(Icons.add),
      ),
    );
  }
}
