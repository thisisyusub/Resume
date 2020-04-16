import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/responsive_widget.dart';

class Skill {
  final String title;
  final double level;

  Skill({this.title, this.level});
}

class Skills extends StatelessWidget {
  final List<Skill> _professionalSkills = [
    Skill(
      title: 'Flutter',
      level: 0.9,
    ),
    Skill(
      title: 'Dart',
      level: 0.9,
    ),
    Skill(
      title: 'BLoC (State Management)',
      level: 0.7,
    ),
    Skill(
      title: 'Provider (State Management)',
      level: 0.8,
    ),
    Skill(
      title: 'BloC Architecture',
      level: 0.9,
    ),
    Skill(
      title: 'Provider V3 Architecture',
      level: 0.78,
    ),
    Skill(
      title: 'Java SE',
      level: 0.70,
    ),
    Skill(
      title: 'Algorithms',
      level: 0.50,
    ),
    Skill(
      title: 'Data Structures',
      level: 0.50,
    ),
  ];

  final List<Skill> _personalSkills = [
    Skill(
      title: 'Communication',
      level: 0.9,
    ),
    Skill(
      title: 'Team Work',
      level: 0.85,
    ),
    Skill(
      title: 'Communication',
      level: 0.9,
    ),
    Skill(
      title: 'English',
      level: 0.76,
    ),
    Skill(
      title: 'Communication',
      level: 0.9,
    ),
    Skill(
      title: 'Leadership',
      level: 0.65,
    ),
    Skill(
      title: 'PlaceHolder',
      level: 0.0,
    ),
    Skill(
      title: 'PlaceHolder',
      level: 0.0,
    ),
    Skill(
      title: 'PlaceHolder',
      level: 0.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: ResponsiveWidget.isLargeScreen(context) ? 50 : 10,
        right: ResponsiveWidget.isLargeScreen(context) ? 50 : 10,
        bottom: 30,
      ),
      child: ResponsiveWidget(
        largeScreen: _buildLargeSkillsWidget(context),
        mediumScreen: _buildMediumAndSmallWidget(),
        smallScreen: _buildMediumAndSmallWidget(),
      ),
    );
  }

  Widget _buildMediumAndSmallWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Skills'),
        SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: _skillWidget(
            'Professional',
          ),
        ),
        SizedBox(
          height: 30,
        ),
        _skillWidget(
          'Personal',
          true,
        ),
      ],
    );
  }

  Widget _buildLargeSkillsWidget(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Skills'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: _skillWidget(
                  'Professional',
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: _skillWidget(
                  'Personal',
                  true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillWidget(String title, [bool isPersonal = false]) {
    return Container(
      color: Colors.black38,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title),
          SizedBox(
            height: 20,
          ),
          ...(isPersonal ? _personalSkills : _professionalSkills)
              .map(
                (skill) => Opacity(
                  opacity: skill.title == 'PlaceHolder' ? 0.0 : 1.0,
                  child: _skillIndicator(
                    skill.title,
                    skill.level,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget _skillIndicator(String title, double level) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          SizedBox(
            height: 5,
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.white,
            value: level,
            valueColor: const AlwaysStoppedAnimation(
              Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
