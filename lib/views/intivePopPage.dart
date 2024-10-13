import 'package:flutter/material.dart';

void showInvitePopup(BuildContext context) {
  List<String> emailIds = [
    'collab1@example.com',
    'collab2@example.com',
    'collab3@example.com',
    'collab4@example.com',
    'collab5@example.com',
  ];

  TextEditingController searchController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {

      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      return AlertDialog(
        title: Text('Invite Collaborators'),
        content: Container(
          height: screenHeight/3, 
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Type email address...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {

                },
              ),
              SizedBox(height: screenHeight*0.002),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: emailIds
                        .where((email) =>
                            searchController.text.isEmpty ||
                            email.toLowerCase().contains(searchController.text.toLowerCase()))
                        .map((email) {
                      return ListTile(
                        leading: Icon(Icons.email),
                        title: Text(email),
                        trailing: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
