import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/views/homePage.dart';

class NotePage extends StatefulWidget {

  final String? title;
  final String? content;

  const NotePage({this.title, this.content, Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  late TextEditingController titleController;
  late TextEditingController contentController;

  FocusNode noteFocus = FocusNode();

   @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title ?? '');
    contentController = TextEditingController(text: widget.content ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none
                ),
              ),
              Expanded(
                child: TextField(
                  controller: contentController,
                  focusNode: noteFocus,
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                  decoration: const InputDecoration(
                    hintText: "Note",
                    border: InputBorder.none
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}