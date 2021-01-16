import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  final Widget fab;
  final Widget child;

  const BasicScreen({
    Key key,
    this.fab,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
