import 'package:flutter/material.dart';

import 'package:demo/utils/palette.dart';

class TodoCheckbox extends StatelessWidget {
  /// Determines both height & width for the checkbox.
  final double size;
  
  /// Whether the checkbox is checked (`true`) or not (`false`).
  final bool checked;
  
  final double radius;

  const TodoCheckbox({
    Key key,
    this.checked = false,
    this.size= 24,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              value: checked,
              onChanged: (_){},
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
