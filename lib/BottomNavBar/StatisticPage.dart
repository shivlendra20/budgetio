import 'package:flutter/material.dart';
import 'package:budgetio/main.dart';

class StatisticPage extends StatefulWidget {


  @override
  _State createState() => _State();
}

class _State extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Statistic',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),)
          ],

        ),
      ),
    );
  }
}

