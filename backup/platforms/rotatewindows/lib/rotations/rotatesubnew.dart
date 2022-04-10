import 'dart:async';
import 'package:finallyicanlearn/lists.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//class RotateSubNew extends StatelessWidget {
class RotateSubNew extends StatelessWidget {
  const RotateSubNew({Key? key}) : super(key: key);

  final String title = 'Future Test';

  @override
  Widget build(BuildContext context) {
    final StreamController<String> counterController = StreamController<String>();
    String? value;
    return WillPopScope(
        onWillPop: () async {
          counterController.close();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                StreamBuilder<String>(
                  stream: counterController.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<String> snapshot) {
                    value = snapshot.data;
                    return value != null
                        ? _buildContent(context, value!)
                        : _buildContent(context, 'No Time');
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //DateTime _now = DateTime.now();
              DateTime _userDateTime = DateTime.now();

              //String _formattedDate = DateFormat('yyyy-MM-dd').format(_userDateTime);
              String _formattedTime = DateFormat.Hms().format(_userDateTime);

              counterController.add(_formattedTime);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        )
    );
  }

  Widget _buildContent(BuildContext context, String counter) {
    return Text(
      '$counter',
      style: Theme
          .of(context)
          .textTheme
          .headline4,
    );
  }

}