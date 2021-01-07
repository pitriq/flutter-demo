import 'package:flutter/material.dart';

import 'package:demo/utils/palette.dart';
import 'package:demo/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(bool) onToggled;

  TodoItem({this.todo, this.onToggled});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        _buildCheckbox(context),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              todo.text,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyText1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(BuildContext context) {
    final size = 24.0;
    final radius = 8.0;
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          color: Palette.grey,
          child: Theme(
            data: ThemeData(
              disabledColor: Colors.transparent,
              unselectedWidgetColor: Colors.transparent,
            ),
            child: Checkbox(
              value: todo.completed,
              onChanged: onToggled,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              activeColor: Colors.transparent,
              checkColor: Palette.primaryPurple,
            ),
          ),
        ),
      ),
    );
  }
}
