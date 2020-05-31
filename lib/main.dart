import 'package:flutter/material.dart';
import 'package:resume/pages/home_page.dart';
import 'package:resume/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation, context);
            return HomePage();
          });
        },
      ),
    );
  }
}
