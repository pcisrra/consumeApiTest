import 'package:flutter/material.dart';
import 'package:consume_api_test/ui/screen1.dart';

PageOne _pageOne = new PageOne();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _pageOne.build(context),
    );
  }
}