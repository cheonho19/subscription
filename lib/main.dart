import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'home.dart';
import 'analysis.dart';
import 'inputForm.dart';
import 'root.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Subscription",
      home: RootWidget(),
    );
  }
}




