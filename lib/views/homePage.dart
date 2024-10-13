import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';
import 'package:hacktoberxmlsa_app/views/noteCard.dart';
import 'package:hacktoberxmlsa_app/views/notePage.dart';
import 'package:hacktoberxmlsa_app/views/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String searchQuery = "";

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'NoteMind',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return ProfilePage();}));
                },
                child: CircleAvatar(
                  foregroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnDNmpgYnTP4ELmIob69uKE1O0Rbrotna00g&s'),
                  radius: screenWidth*0.05,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*0.02,),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25), 
                      borderSide: BorderSide(width: 2, color: purple),
                    ),
                    hintText: 'Search your notes here',
                    hintStyle: TextStyle(color: Colors.white60, fontWeight: FontWeight.normal)
                  ),
                ),
                SizedBox(height: screenHeight*0.02,),
                Text(
                  'Saved Notes',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: screenHeight*0.006,),
                Container(
                  height: screenWidth/2.8,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NoteCard(
                          noteTitle: 'Note ${index + 1}',
                          noteContent: 'This is the content of note ${index + 1}',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage(
                              title: 'Note ${index +1}',
                              content: 'This is the content of note ${index+1}',
                            )));
                          }
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Quick Notes',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Expanded(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      crossAxisSpacing: 10, 
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return NoteCard(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage(
                              title: 'Note ${index +1}',
                              content: 'This is the content of note ${index+1}',
                            )));
                        },
                        noteTitle: 'Quick Note ${index + 1}',
                        noteContent:
                            'This is a quick note. Content preview for note ${index + 1}.',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight*0.02,
            left: screenWidth*0.05,
            child: FloatingActionButton(
              onPressed: () {
            
              },
              child: ImageIcon(AssetImage('assets/images/mind-map-icon.png')),
              backgroundColor: purple,
              shape: CircleBorder(),
            ),
          ),
          Positioned(
            bottom: screenHeight*0.02,
            right: screenWidth*0.05,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage()));
              },
              child: Icon(Icons.add),
              backgroundColor: purple,
              shape: CircleBorder(),
            )
          ),
        ],
      ),
    );
  }
}
