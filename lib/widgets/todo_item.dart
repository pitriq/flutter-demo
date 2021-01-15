import 'package:flutter/material.dart';

import 'package:demo/models/todo.dart';
import 'package:demo/widgets/todo_checkbox.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onPressed;

  TodoItem({this.todo, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            child: TodoCheckbox(
              checked: todo.completed,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                todo.text,
                style: theme.textTheme.bodyText1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
