import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'home.dart';
import 'analysis.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Subscription",
      home: Home(),
    );
  }
}

class AppState extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AppState> {
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final _pageWidgets = [
      List(),
      Analysis(),
    ];
  }
}


class Footer extends StatefulWidget{
  @override
  _MyFooter createState() => _MyFooter();
}

class _MyFooter extends State<Footer> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setteing')
        ),
      ],
    );
  }
}

