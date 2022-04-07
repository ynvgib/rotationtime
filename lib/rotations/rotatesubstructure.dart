import 'dart:async';
import 'package:finallyicanlearn/lists.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';

class RotateJson extends StatefulWidget {
  const RotateJson({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateJsonState();
  }
}

class _RotateJsonState extends State<RotateJson> {
  late Future<List> data;

  @override
  void initState() {
    super.initState();
    data = AstrologyServices.getAstrology();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Rotate Just Now'),
        ),
        body: FutureBuilder(
            future: data,
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? Column(
                        children: [
                          Text('Body Calcuation Wrong'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Text(snapshot.data![22])),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![11]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![12]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![13]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![14]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![15]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![16]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![17]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![18]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![19]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![20]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![21]),
                                  ),

                                ],
                              ),
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
                                    child: Text(snapshot.data![0]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![1]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![2]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![3]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![4]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![5]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![6]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![7]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![8]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![9]),
                                  ),
                                  Card(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(snapshot.data![10]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )));
  }
}
