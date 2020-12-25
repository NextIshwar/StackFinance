import 'dart:io';

import 'package:SFinance/ui/quizotica.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text("Welcome to Flutter Quizotica"),
            ),
          ),
          body: QuizWidget()),
    );
  }
}

class QuizWidget extends StatefulWidget {
  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  bool isInternetOn = true;
  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (isInternetOn)
        ? Container(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Quizotica()));
              },
              child: Text("Go to Quiz section"),
            ),
          )
        : Container(
            child: AlertDialog(
              actions: [
                GestureDetector(
                  onTap: () {
                    exit(0);
                  },
                  child: Card(child: Text("No internet. Press to exit")),
                )
              ],
            ),
          );
  }
}

class QuizWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => Quizotica()));
        },
        child: Text("Go to Quiz section"),
      ),
    );
  }
}
