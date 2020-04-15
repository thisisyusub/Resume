import 'package:flutter/material.dart';
import 'package:resume/responsive_widget.dart';
import 'package:resume/widgets/about.dart';
import 'package:resume/widgets/skills.dart';



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[],
          ),
        )
            : null,
        body: ListView(
          children: <Widget>[
            About(MediaQuery.of(context).size.width),
            Skills(),
          ],
        ),
      ),
    );
  }
}