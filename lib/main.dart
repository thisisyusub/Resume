import 'package:flutter/material.dart';
import 'package:resume/pages/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.black12,
        buttonColor: Colors.black12,
        highlightColor: Colors.pink,
      ),
      home: ProfilePage(),
    );
  }
}