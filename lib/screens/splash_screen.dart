import 'package:flutter/material.dart';

import 'package:demo/utils/navigate.dart';
import 'package:demo/screens/basic_screen.dart';
import 'package:demo/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  void _goToHomeScreen(BuildContext context) {
    final delay = Duration(seconds: 3);
    Future.delayed(
      delay,
      () => navigate(context, HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _goToHomeScreen(context);

    final theme = Theme.of(context);

    return BasicScreen(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DEMO',
              style: theme.textTheme.headline1,
            ),
            Divider(thickness: 2),
            Text(
              'An app to write your TODOs',
              style: theme.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
