import 'dart:io';

import 'package:SFinance/main.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final int score;
  ResultCard(this.score);
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(true);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text("NO"),
                ),
                SizedBox(height: 16),
                new GestureDetector(
                  onTap: () => exit(0),
                  child: Text("YES"),
                ),
              ],
            ),
          ) ??
          true;
    }

    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Score",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              Text(
                "${score.toString()}/4",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: (score < 0) ? Colors.red : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
