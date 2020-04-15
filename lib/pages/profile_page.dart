import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:resume/responsive_widget.dart';
import 'package:resume/widgets/about.dart';
import 'package:resume/widgets/skills.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
        body: Scrollbar(
          child: ListView(
            controller: _controller,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              About(
                (index) => _controller.animateTo(height * index,
                    duration: Duration(seconds: 1), curve: Curves.linearToEaseOut),
              ),
              Skills(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
