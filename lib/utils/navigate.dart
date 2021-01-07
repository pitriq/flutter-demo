import 'package:flutter/material.dart';

Future<void> navigate(BuildContext context, Widget screen) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => screen),
  );
}

Future<T> push<T>(BuildContext context, Widget screen) async {
  return await Navigator.of(context).push<T>(
    MaterialPageRoute(builder: (_) => screen),
  );
}