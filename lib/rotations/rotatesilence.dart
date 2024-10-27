import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';

class RotateSilence extends StatefulWidget {
  const RotateSilence({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSilenceState();
  }
}

class _RotateSilenceState extends State<RotateSilence> {
  final String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(coins4lst[3]),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mainwoofgooflst[1]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(newminmaxcoins[1]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(minmaximglst[0]),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(kitheimglst[0]),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Transform.scale(
                      scaleX: -1,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplantspos[0]),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scaleX: -1,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplantsneg[0]),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(titlesicon[1]),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const Divider(thickness: 5, indent: 20, endIndent: 10,color: Colors.red),                const SizedBox(height: 10),
                const AutoSizeText(' @',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'iChing',
                        fontSize: 80,
                        color: Colors.red,
                        fontWeight: FontWeight.normal)),
                const Divider(thickness: 5, indent: 20, endIndent: 10,color: Colors.red),                const SizedBox(height: 10),
              ]),
        ),
      ),
    );
  }
}
