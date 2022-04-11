import 'dart:async';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RotateSubStructure extends StatelessWidget {
  RotateSubStructure({Key? key}) : super(key: key);
  DateTime _datetimenow = DateTime.now();
  final StreamController<List> streamController = StreamController<List>();
  List? value;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        streamController.close();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('Rotate Just Now'),
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    DateTime _userDateTime = DateTime.now();
                    //String _formattedDate = DateFormat('yyyy-MM-dd').format(_userDateTime);
                    String _formattedTime = DateFormat.Hms().format(_userDateTime);
                    //counterController.add(_formattedTime);
                  },
                  child: const Text('Now'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  StreamBuilder(
                      stream: streamController.stream,
                      builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) {
                        value = snapshot.data;
                        return value != null
                              ? _buildContent(context, value!)
                              : _buildContentError(context, 'No Data');
                      },),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildContentError(BuildContext context, String err) {
    return Text('$err',
      style: Theme
          .of(context)
          .textTheme
          .headline4,
    );
  }

  Widget _buildContent(BuildContext context, List planetsList) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: Text(planetsList[0])),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[0])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[1])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[2])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[3])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[4])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[5])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[6])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[7])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[8])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[9])),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                      width: 20,
                      height: 20,
                      image:
                      AssetImage(planetspartialList[10])),
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[0]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[1]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[2]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[3]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[4]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[5]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[6]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[7]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[8]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[9]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsNamesList[10]),
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[1]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[2]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[3]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[4]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[5]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[6]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[7]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[8]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[9]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[10]),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Text(planetsList[11]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }


}
