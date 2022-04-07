import 'dart:async';
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
  late Future<List<int>> data;

  final TextEditingController _controllerhextext = TextEditingController();

  @override
  void initState() {
    super.initState();

    data = AstrologyServices.getAstrology();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Planets Parsin (Under Development)'), backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[100],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              child: const Text(
                'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'iChing',
                ),
              ),
              alignment: Alignment.center,
            )),
            Center(
              child: FutureBuilder (
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  } else if (snapshot.hasError) {
                    return const Text('Error!');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            SizedBox(
                child: TextField(
              decoration: const InputDecoration.collapsed(
                  hintText: '1', hintStyle: TextStyle(color: Colors.grey)),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
              controller: _controllerhextext,
              readOnly: false,
            )),
            Expanded(
                child: Container(
              child: const Text(
                'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'iChing',
                ),
              ),
              alignment: Alignment.center,
            )),
          ]),
    );
  }
}

