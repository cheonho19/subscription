import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'main.dart';
import 'analysis.dart';

class InputForm extends StatefulWidget {

  InputForm(this.document);
  final DocumentSnapshot document;
  @override
  _MyInputFormState createState() => _MyInputFormState();
}

class _FormData {
  String name;
  String payment;
  DateTime date = DateTime.now();
}

class _MyInputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _FormData _data = _FormData();

  Future <DateTime> _selectTime(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: _data.date,
        firstDate: DateTime(_data.date.year - 1),
        lastDate: DateTime(_data.date.year + 5)
    );
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference _mainReference;
    _mainReference = Firestore.instance.collection('subscription').document();
    bool deleteFlg = false;
    if(widget.document != null) { //データベース上のデータに値が入っていて
      if(_data.name == null && _data.payment == null){ //現在の_dataの中がからだったら
        _data.name = widget.document['name'];
        _data.payment = widget.document['payment'].toString();
        _data.date = widget.document['date'].toDate();
      }
      _mainReference = Firestore.instance.collection('subscription').
      document(widget.document.documentID);
      deleteFlg = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print("保存ボタンを押しました");
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _mainReference.setData(
                      {
                        'name': _data.name,
                        'payment': _data.payment,
                        'date': _data.date
                      }
                  );
                  Navigator.pop(context);
                }
              }
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: !deleteFlg ? null : () {
              print("削除ボタンを押しました");
              _mainReference.delete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              TextFormField(
                decoration:  const InputDecoration(
                  labelText: 'サービス名',
                ),
                onSaved: (String value) {
                  _data.name = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'サービス名は必須入力項目です';
                  }
                },
                initialValue: _data.name,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '¥500',
                  labelText: '料金',
                ),
                onSaved: (String value) {
                  _data.payment = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return '料金は必須項目です';
                  }
                },
                initialValue: _data.payment,
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text("支払日：${_data.date.toString().substring(0,10)}"),
              ),
              RaisedButton(
                child: const Text("締め切り日変更"),
                onPressed: (){
                  print("締め切り日変更をタッチしました");
                  _selectTime(context).then((time){
                    if(time != null && time != _data.date){
                      setState(() {
                        _data.date = time;
                      });
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


