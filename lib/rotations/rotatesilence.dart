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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 40,
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(coins4lst[3]),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 25,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red.withOpacity(0.5)),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText('.',
                    textAlign: TextAlign.center,
                    minFontSize: 90,
                    maxFontSize: 100,
                    style: const TextStyle(color: Colors.red)),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/camog/zbredog2.png',
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 5, indent: 20, endIndent: 10,color: Colors.red),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(mplantspos[0]),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Transform.scale(
                      scaleX: -1,
                      scaleY: -1,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        width: MediaQuery.of(context).size.width / 2.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplantsneg[0]),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 5, indent: 20, endIndent: 10,color: Colors.red),
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/gen/vaggenplexlp.gif'),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                const Divider(thickness: 5, indent: 20, endIndent: 10,color: Colors.red),
                const AutoSizeText(' @',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'iChing',
                        fontSize: 80,
                        color: Colors.red,
                        fontWeight: FontWeight.normal)),
                const SizedBox(height: 10),
              ]),
        ),
      ),
    );
  }
}
