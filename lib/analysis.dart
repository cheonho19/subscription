import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'home.dart';
import 'inputForm.dart';

class Analysis extends StatefulWidget {
  @override
  _MyAnalysis createState() => _MyAnalysis();
}

class _AnalysisData {
  String name;
  String payment;
  DateTime date = DateTime.now();
}

class _MyAnalysis extends State<Analysis> {
  final GlobalKey<FormState> _analysisKey = GlobalKey<FormState>();
  final _AnalysisData _data = _AnalysisData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Netflix'),
          ],
        ),
      ),
    );
  }
}


/*
class Analysis extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis"), // <- (※2)
      ),
      body: Center(child: Text("Analysis") // <- (※3)
      ),
    );
  }
}

 */