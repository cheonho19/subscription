import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('subscription').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (!snapshot.hasData) return const Text('Loading...');
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('月合計　：　　' + _SumPayment(context, snapshot, 1)),
                  Text('年合計　：　　' + _SumPayment(context, snapshot, 12)),
                ],
              );
            }
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('月合計'),
          ],
        ),
      ),
    );
  }

  Widget _SumPayment(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot, int month){
    var monthSum;
    var sum;
    for(int i=0; i<snapshot.data.documents.length; i++) {
      monthSum = monthSum + snapshot.data.documents[i].['payment'];
    }
    sum = monthSum * month;

    return const Text('¥ ' + sum);
  }


}
