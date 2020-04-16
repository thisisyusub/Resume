import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/responsive_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _words = [
    'Kanan Yusubov',
    'Flutter Developer',
    'Founder of Azerbaijan Flutter Users Community',
  ];
  String _currentWord = '';
  int _index = 0;
  int _listIndex = 0;
  Stream<String> _currentWordStream;

  @override
  void initState() {
    /// initialization of periodic Stream
    _currentWordStream =
        Stream<String>.periodic(Duration(milliseconds: 100), (_) {
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

      return _currentWord;
    }).asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            )
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Container(
              color: Colors.black54,
              height: mediaQuery.size.height,
              width: mediaQuery.size.width,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'About',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Theme.of(context).highlightColor,
                                decorationStyle: TextDecorationStyle.double),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'Skills',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Theme.of(context).highlightColor,
                                decorationStyle: TextDecorationStyle.double),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'Portfolio',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Theme.of(context).highlightColor,
                                decorationStyle: TextDecorationStyle.double),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'Contacts',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Theme.of(context).highlightColor,
                                decorationStyle: TextDecorationStyle.double),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: SafeArea(
        child: ResponsiveWidget(
          largeScreen: _buildHomePage(context),
          mediumScreen: _buildHomePage(context),
          smallScreen: _buildHomePage(context),
        ),
      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          _animatedTitleWidget(mediaQuery),
          Spacer(),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: mediaQuery.size.height * 0.6,
                  height: mediaQuery.size.height * 0.6,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: AssetImage('assets/profile.jpg'),
                          fit: BoxFit.fill)),
                ),
                Visibility(
                  visible: !ResponsiveWidget.isSmallScreen(context),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                Visibility(
                  visible: !ResponsiveWidget.isSmallScreen(context),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'About',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).highlightColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'Skills',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).highlightColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'Portfolio',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).highlightColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'Contacts',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).highlightColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _animatedTitleWidget(MediaQueryData mediaQueryData) {
    return StreamBuilder<String>(
      stream: _currentWordStream,
      builder: (context, snapshot) => Text(
        snapshot.data == null ? '' : snapshot.data,
        style: TextStyle(
            fontSize: mediaQueryData.size.width *
                0.04 *
                mediaQueryData.textScaleFactor),
        textAlign: TextAlign.center,
      ),
    );
  }

//  Widget _buildSmallAndMediumWidget(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.symmetric(
//        horizontal: 10,
//        vertical: 10,
//      ),
//      padding: EdgeInsets.all(16),
//      color: Colors.black38,
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Text(
//            'Kanan Yusubov',
//            style: TextStyle(
//              fontSize: 30,
//            ),
//          ),
//          SizedBox(height: 10),
//          Text(
//            'Flutter Developer & Founder of Azerbaijan Flutter Users Community',
//            style: TextStyle(
//              fontSize: 16,
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//          SizedBox(height: 20),
//          Image.asset(
//            'assets/profile.jpg',
//            width: double.infinity,
//            height: 500,
//            fit: BoxFit.fill,
//          ),
//          SizedBox(
//            height: 20,
//          ),
//          _infoItem('Adress', 'Binagadi district'),
//          Divider(),
//          _infoItem('Phone', '+994 77 536-19-99'),
//          Divider(),
//          _infoItem('Email', 'kanan.yusubov@yandex.com'),
//          SizedBox(
//            height: 20,
//          ),
//          Text(
//            '''Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.
//Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.
//Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.
//          ''',
//            textAlign: TextAlign.justify,
//            softWrap: true,
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          Container(
//            width: double.infinity,
//            height: 40,
//            child: RaisedButton(
//              hoverColor: Colors.pinkAccent,
//              color: Colors.pink,
//              onPressed: () {},
//              child: Text(
//                'Contact Me',
//                style: TextStyle(
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }

//  Widget _infoItem(String title, String description) {
//    return Row(
//      children: <Widget>[
//        _pinkContainer(title),
//        SizedBox(
//          width: 10,
//        ),
//        Spacer(),
//        Expanded(
//          child: Text(
//            description,
//            overflow: TextOverflow.clip,
//          ),
//        ),
//      ],
//    );
//  }
//
//  Widget _pinkContainer(String title) {
//    return Container(
//      padding: EdgeInsets.all(8),
//      decoration: BoxDecoration(
//        color: Colors.pink,
//        borderRadius: BorderRadius.circular(4),
//      ),
//      child: Text(
//        title,
//        style: TextStyle(
//          color: Colors.white,
//        ),
//      ),
//    );
//  }
}
