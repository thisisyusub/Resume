import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume/responsive_widget.dart';

class About extends StatefulWidget {
  final double screenWidth;

  About(this.screenWidth) : assert(screenWidth != null);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  final List<String> _words = [
    'Kanan Yusubov',
    'Flutter Developer',
    'Founder of Azerbaijan Flutter Users Community',
  ];
  String _currentWord = '';
  int _index = 0;
  int _listIndex = 0;
  Timer _timer;
  double _opacity = 0.4;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      lowerBound: 0.0,
      upperBound: widget.screenWidth * 0.2,
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() {
        if (_listIndex >= _words.length) {
          _listIndex = 0;
        }

        if (_index > _words[_listIndex].length) {
          /// if word is completed go to next
          _listIndex++;
          _index = 0;
        } else {
          /// continue to word letters
          _currentWord = _words[_listIndex].substring(0, _index);
          _index++;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: _buildLargeAboutWidget(context),
      mediumScreen: _buildSmallAndMediumWidget(context),
      smallScreen: _buildSmallAndMediumWidget(context),
    );
  }

  Widget _buildLargeAboutWidget(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      margin: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Text(
            _currentWord,
            style: TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Transform.translate(
            offset: Offset(-_animationController.value, 0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text(
                  'Hover!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Opacity(
                  opacity: _opacity,
                  child: GestureDetector(
                    onTap: () => _animationController.forward(),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile.jpg',
                        width: screenSize.width * 0.3,
                        height: screenSize.width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildSmallAndMediumWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      padding: EdgeInsets.all(16),
      color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Kanan Yusubov',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Flutter Developer & Founder of Azerbaijan Flutter Users Community',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/profile.jpg',
            width: double.infinity,
            height: 500,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          _infoItem('Adress', 'Binagadi district'),
          Divider(),
          _infoItem('Phone', '+994 77 536-19-99'),
          Divider(),
          _infoItem('Email', 'kanan.yusubov@yandex.com'),
          SizedBox(
            height: 20,
          ),
          Text(
            '''Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.
Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.
          ''',
            textAlign: TextAlign.justify,
            softWrap: true,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              hoverColor: Colors.pinkAccent,
              color: Colors.pink,
              onPressed: () {},
              child: Text(
                'Contact Me',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String title, String description) {
    return Row(
      children: <Widget>[
        _pinkContainer(title),
        SizedBox(
          width: 10,
        ),
        Spacer(),
        Expanded(
          child: Text(
            description,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }

  Widget _pinkContainer(String title) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }
}
