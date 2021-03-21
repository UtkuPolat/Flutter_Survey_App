import 'package:akserapp/Pages/signIn.dart';
import 'package:flutter/material.dart';
import './shop.dart';
import './surveys.dart';
import './profile.dart';
import './home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);
  @override
  _NavigationState createState() => _NavigationState();
}

class _MyColor {
  const _MyColor(this.color, this.name);
  final Color color;
  final String name;
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final tabs = [Home(), Shop(), Survey(), Profile()];
  String _textHolder;
  Color _textColor = Colors.blue;

  static const List<_MyColor> myBgColors = const <_MyColor>[
    const _MyColor(Colors.blue, 'Blue'),
    const _MyColor(Colors.red, 'Red'),
    const _MyColor(Colors.green, 'Green'),
    const _MyColor(Colors.orange, 'Orange'),
  ];

  void changeText(String _text) {
    setState(() {
      _textHolder = _text;
    });
  }

  void changeColor(int index) {
    setState(() {
      _textColor = myBgColors[index].color;
    });
  }

  @override
  void initState() {
    _textHolder = 'Home';

    //String userID = userId.uid.toString();
    //print(userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$_textHolder',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
        ),
        backgroundColor: _textColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ));
            },
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedFontSize: 25,
            unselectedFontSize: 20,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                title: Text('Shop'),
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note),
                title: Text('Surveys'),
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                title: Text('Profile'),
                backgroundColor: Colors.orange,
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (_currentIndex == 0) {
                changeText('Home');
              }
              if (_currentIndex == 1) {
                changeText('Shop');
              }
              if (_currentIndex == 2) {
                changeText('Survey');
              }
              if (_currentIndex == 3) {
                changeText('Profile');
              }
              changeColor(_currentIndex);
            },
          ),
        ),
      ),
    );
  }
}
