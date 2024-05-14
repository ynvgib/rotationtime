import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/rotatewidgets.dart';
import 'package:flutter/material.dart';

class RotateComplexHD extends StatefulWidget {
  const RotateComplexHD({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateComplexHDState();
  }
}

class _RotateComplexHDState extends State<RotateComplexHD> {
  Color headcolor = Colors.yellow, ajnacolor = Colors.green;
  bool headstate = true,
      ajnastate = true,
      throatstate = true,
      gstate = true,
      sacralstate = true,
      rootstate = true,
      heartstate = true,
      spleenstate = true,
      solarstate = true;
  // gate state
  // 0-undefined, 1-personality, 2-design, 3-both, 4 - transit

  List<int> gatestatelist = List.filled(65, 0, growable: false);

  final String _title = 'הגדרה גבוהה של עיצוב אנושי';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title:
          AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(color: Colors.blue),
              // head
              SizedBox(
                height: 50,
                width: 50,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CustomPaint(
                        foregroundPainter: HeadPainter(centerstate: headstate),
                        willChange: true,
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '64',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            '61',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            '63',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // head gates
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 17,
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[64]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[61]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[63]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              //ajna gates
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[47]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[24]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[4]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              // ajna
              CustomPaint(
                foregroundPainter: AjnaPainter(centerstate: ajnastate),
                willChange: true,
                child: const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ),
              //throat gates
              //ajna gates
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[17]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[43]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[11]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[62]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[23]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[56]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              // throat
              CustomPaint(
                foregroundPainter: ThroatPainter(centerstate: throatstate),
                willChange: true,
                child: const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ),
              // throat gates
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[31]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[8]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[33]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              // g gates
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[7]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[1]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[13]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              // g center
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CustomPaint(
                        foregroundPainter: GPainter(centerstate: gstate),
                        willChange: true,
                        child: const SizedBox(
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0,
                            left: 100.0),                      child: CustomPaint(
                          foregroundPainter: HeartPainter(centerstate: heartstate),
                          willChange: true,
                          child: const SizedBox(
                            height: 30,
                            width: 50,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 17),
                        CustomPaint(
                          foregroundPainter:
                          VerticalGatePainter(gatestate: gatestatelist[15]),
                          willChange: true,
                          child: const SizedBox(
                            height: 10,
                            width: 50 / 3,
                          ),
                        ),
                        CustomPaint(
                          foregroundPainter:
                          VerticalGatePainter(gatestate: gatestatelist[2]),
                          willChange: true,
                          child: const SizedBox(
                            height: 10,
                            width: 50 / 3,
                          ),
                        ),
                        CustomPaint(
                          foregroundPainter:
                          VerticalGatePainter(gatestate: gatestatelist[46]),
                          willChange: true,
                          child: const SizedBox(
                            height: 10,
                            width: 50 / 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // g to sacral gates

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[5]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[14]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[29]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //spleen
                  CustomPaint(
                    foregroundPainter: SpleenPainter(centerstate: spleenstate),
                    willChange: true,
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  // spleen to sacral gates
                  CustomPaint(
                    foregroundPainter:
                    HorizontalGatePainter(gatestate: gatestatelist[50]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    HorizontalGatePainter(gatestate: gatestatelist[27]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                  ),
                  // sacral
                  CustomPaint(
                    foregroundPainter: SacralPainter(centerstate: sacralstate),
                    willChange: true,
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  // solar to sacral gates
                  CustomPaint(
                    foregroundPainter:
                    HorizontalGatePainter(gatestate: gatestatelist[59]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    HorizontalGatePainter(gatestate: gatestatelist[6]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                  ),
                  // solar
                  CustomPaint(
                    foregroundPainter: SolarPainter(centerstate: solarstate),
                    willChange: true,
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              // sacral to root gates
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[42]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[3]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[9]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[53]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[60]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    VerticalGatePainter(gatestate: gatestatelist[52]),
                    willChange: true,
                    child: const SizedBox(
                      height: 10,
                      width: 50 / 3,
                    ),
                  ),
                ],
              ),
              // root
              CustomPaint(
                foregroundPainter: RootPainter(centerstate: rootstate),
                willChange: true,
                child: const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    headstate = !headstate;
                    ajnastate = !ajnastate;
                    throatstate = !throatstate;
                    gstate = !gstate;
                    sacralstate = !sacralstate;
                    rootstate = !rootstate;
                    spleenstate = !spleenstate;
                    solarstate = !solarstate;
                    heartstate = !heartstate;

                    gatestatelist[64]++;
                    gatestatelist[61] + 1;
                    gatestatelist[63]++;

                    gatestatelist[47];
                    gatestatelist[24]++;
                    gatestatelist[4]++;


                  });
                },
                child: const Text(
                  "למלא ולרוקן",
                ),
              ),

              const Divider (thickness: 5, color: Colors.green),

            ]),
      ),
    );
  }
}



