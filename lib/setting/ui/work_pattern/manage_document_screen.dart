import 'package:flutter/material.dart';

class ManageDocumentsScreen extends StatelessWidget {
  final List<Document> documents = [
    Document(name: "Offer Letter Template.docx", lastUpdated: "Dec 10, 2023", size: "250 KB"),
    Document(name: "Employment Contract Template.docx", lastUpdated: "Nov 23, 2023", size: "325 KB"),
    Document(name: "Nondisclosure Agreement (NDA).docx", lastUpdated: "Nov 17, 2023", size: "287 KB"),
    Document(name: "Performance Review Template.docx", lastUpdated: "Dec 08, 2023", size: "402 KB"),
    Document(name: "Resignation Letter Template.docx", lastUpdated: "Oct 14, 2023", size: "349 KB"),
    Document(name: "Timesheet Template.docx", lastUpdated: "Dec 17, 2023", size: "582 KB"),
    Document(name: "Expense Report Template.docx", lastUpdated: "Dec 07, 2023", size: "466 KB"),
    Document(name: "Leave Request Form Template.docx", lastUpdated: "Oct 12, 2023", size: "275 KB"),
    Document(name: "Termination Letter Template.docx", lastUpdated: "Dec 06, 2023", size: "530 KB"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Documents"),
      ),
      body: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.insert_drive_file, color: Colors.blue),
            ),
            title: Text(document.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Urbainst"), overflow: TextOverflow.ellipsis),
            subtitle: Text("${document.size} • Last updated ${document.lastUpdated}",style: TextStyle(fontSize: 12,fontFamily: 'Urbainst',fontWeight: FontWeight.normal),),
            trailing: IconButton(
              icon: Icon(Icons.download_rounded),
              onPressed: () {
                // Handle download action
              },
            ),

          );
        },
      ),

    );
  }
}

class Document {
  final String name;
  final String lastUpdated;
  final String size;

  Document({required this.name, required this.lastUpdated, required this.size});
}

void main() {
  runApp(MaterialApp(
    home: ManageDocumentsScreen(),
  ));
}
