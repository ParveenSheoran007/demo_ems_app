import 'package:flutter/material.dart';
import 'package:demo_ems_app/setting/ui/work_pattern/add_work_screen.dart';

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
              trailing: PopupMenuButton<int>(
                icon: Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 1) {
                    // Edit Work Pattern
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddWorkScreen()),
                    );
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddWorkScreen()),
          );
        },
        backgroundColor: Color(0xFF5C6AC4),
        child: Icon(Icons.add),
      ),
    );
  }
}
