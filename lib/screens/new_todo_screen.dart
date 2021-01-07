import 'package:flutter/material.dart';

import 'package:demo/screens/basic_screen.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  String newTodoText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BasicScreen(
        fab: _buildFab(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Text(
                'New TODO',
                style: theme.textTheme.headline2,
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  newTodoText = value;
                },
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'What do you have TODO?',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(30)
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildFab() {
    return FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: _onFabPressed,
    );
  }

  void _onFabPressed() {
    Navigator.of(context).pop(newTodoText);
  }
}
