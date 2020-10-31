import 'package:flutter/material.dart';
import 'package:demo/models/todo.dart';

class TodoItem extends StatelessWidget {

  final Todo todo;
  final Function(bool) onChanged;

  TodoItem({this.todo, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: todo.completed,
          onChanged: onChanged,
        ),
        Text(
          todo.text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900],
          ),
        ),
      ],
    );
  }
}
