import 'package:flutter/material.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {

  String newTodoText;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _onFabPressed,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Text(
                  'New TODO',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    newTodoText = value;
                  },
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  void _onFabPressed() {
    Navigator.of(context).pop(newTodoText);
  }
}