import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

class Analysis extends StatefulWidget {
  @override
  _MyAnalysis createState() => _MyAnalysis();
}

class _AnalysisData {
  String name;
  String payment;
  DateTime date = DateTime.now();
}

class _MyAnalysis extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _AnalysisData _data = _AnalysisData();

  @override
  Widget build(BuildContext context) {
  }
}
