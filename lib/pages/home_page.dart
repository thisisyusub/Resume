import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/responsive_widget.dart';
import 'package:resume/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        smallScreen: _buildSmallHomePage(context),
        largeScreen: _buildLargeHomePage(context),
      ),
    );
  }

  Widget _buildSmallHomePage(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: index,
          onDestinationSelected: (int selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          leading: Center(
            child: Text(
              'YK',
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 5,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.info),
              selectedIcon: Icon(
                Icons.info,
                color: Colors.pink,
              ),
              label: SizedBox.shrink(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.power),
              selectedIcon: Icon(
                Icons.power,
                color: Colors.pink,
              ),
              label: SizedBox.shrink(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.work),
              selectedIcon: Icon(
                Icons.work,
                color: Colors.pink,
              ),
              label: SizedBox.shrink(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.contact_phone),
              selectedIcon: Icon(
                Icons.contact_phone,
                color: Colors.pink,
              ),
              label: SizedBox.shrink(),
            ),
          ],
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0.0,
          minWidth: 56,
        ),
      ],
    );
  }

  Widget _buildLargeHomePage(BuildContext context) {
    return Row(
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    selectedIndex: index,
                    onDestinationSelected: (int selectedIndex) {
                      setState(() {
                        index = selectedIndex;
                      });
                    },
                    leading: Center(
                      child: Text(
                        'YK',
                        style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier * 2.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    destinations: [
                      NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text("About"),
                          ),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text("Skills"),
                          ),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text("Portfolio"),
                          ),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: SizedBox.shrink(),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text("Contacts"),
                          ),
                        ),
                      ),
                    ],
                    labelType: NavigationRailLabelType.all,
                    groupAlignment: 0.0,
                    minWidth: 56,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
