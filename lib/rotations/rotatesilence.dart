import 'package:flutter/material.dart';

class RotateSilence extends StatefulWidget {
  const RotateSilence({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSilenceState();
  }
}

class _RotateSilenceState extends State<RotateSilence> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(''),
          leading: TextButton(
            child: const Text(
              '<<',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[100],
      body: const SizedBox ()
    );
  }
}
