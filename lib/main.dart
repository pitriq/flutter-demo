import 'package:demo/providers/todos_api_provider.dart';
import 'package:demo/repositories/todos_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import 'package:demo/utils/palette.dart';
import 'package:demo/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(.5),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) {
        final httpClient = http.Client();
        final todosApiProvider = TodosApiProvider(httpClient);
        return TodosRepository(todosApiProvider);
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Palette.primaryPurple,
        accentColor: Palette.primaryPurple,
        primaryColorLight: Palette.secondaryPurple,
        dividerColor: Palette.secondaryPurple,
        textSelectionTheme: _getTextSelectionTheme(),
        textTheme: _getTextTheme(),
      ),
    );
  }

  TextTheme _getTextTheme() {
    return TextTheme(
      headline1: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Palette.primaryPurple,
      ),
      headline2: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Palette.primaryPurple,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        color: Palette.secondaryPurple,
      ),
    );
  }

  TextSelectionThemeData _getTextSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: Palette.primaryPurple,
      selectionHandleColor: Palette.primaryPurple,
      selectionColor: Palette.grey,
    );
  }
}
