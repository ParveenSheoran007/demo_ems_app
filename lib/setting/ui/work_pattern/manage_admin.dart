import 'package:flutter/material.dart';

class ManageAdminScreen extends StatelessWidget {
  final List<Admin> admins = [
    Admin(
      name: "Google LLC",
      role: "Super Admin (You)",
      imageUrl: "https://via.placeholder.com/150",  // Replace with the actual image URL
      isSuperAdmin: true,
    ),
    Admin(
      name: "Emma Brown",
      role: "Admin",
      imageUrl: "https://via.placeholder.com/150",  // Replace with the actual image URL
    ),
    Admin(
      name: "Mia Rodriguez",
      role: "Admin",
      imageUrl: "https://via.placeholder.com/150",  // Replace with the actual image URL
    ),
    Admin(
      name: "Oliver Green",
      role: "Admin",
      imageUrl: "https://via.placeholder.com/150",  // Replace with the actual image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Admin"),
      ),
      body: ListView.builder(
        itemCount: admins.length,
        itemBuilder: (context, index) {
          final admin = admins[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(admin.imageUrl),
            ),
            title: Text(admin.name),
            subtitle: Text(admin.role),
            trailing: admin.isSuperAdmin
                ? null
                : IconButton(
              icon: Icon(Icons.edit, color: Colors.grey),
              onPressed: () {
                // Handle edit action
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add new admin action
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class Admin {
  final String name;
  final String role;
  final String imageUrl;
  final bool isSuperAdmin;

  Admin({required this.name, required this.role, required this.imageUrl, this.isSuperAdmin = false});
}

