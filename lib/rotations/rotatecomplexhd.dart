import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
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

  final String _title = tempsubtitles[0];

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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
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
                  "Center Set",
                ),
              ),

              const Divider (thickness: 5, color: Colors.green),

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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
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

                ],
              ),
              //ajna gates
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 17, height: 20,),

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
              )

            ]),
      ),
    );
  }
}

class HeadPainter extends CustomPainter {
  bool centerstate = true;

  HeadPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.yellow;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.yellow : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x / 2, 0)
      ..lineTo(0, y)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class AjnaPainter extends CustomPainter {
  bool centerstate = true;

  AjnaPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.green;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.green : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x / 2, y)
      ..lineTo(0, 0)
      ..lineTo(x, 0)
      ..close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ThroatPainter extends CustomPainter {
  bool centerstate = true;

  ThroatPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  Path getRectePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..moveTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class GPainter extends CustomPainter {
  bool centerstate = true;

  GPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.green;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //var angle = (math.pi * 2) / 4;

    centerstate ? centercolor = Colors.yellow : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getDiamondPath(size.width, size.height), paint);
  }

  Path getDiamondPath(double x, double y) {
    var path = Path();
    var angle = (math.pi * 2) / 4;
    var radius = x / 2;
    var sides = 4;

    Offset center = Offset(x / 2, y / 2);

// startPoint => (100.0, 0.0)
    Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SacralPainter extends CustomPainter {
  bool centerstate = true;

  SacralPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    Color centercolor = Colors.red;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.red : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  Path getRectePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..moveTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RootPainter extends CustomPainter {
  bool centerstate = true;

  RootPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  Path getRectePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..moveTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SpleenPainter extends CustomPainter {
  bool centerstate = true;

  SpleenPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x, y / 2)
      ..lineTo(0, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SolarPainter extends CustomPainter {
  bool centerstate = true;

  SolarPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y / 2)
      ..lineTo(x, 0)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HeartPainter extends CustomPainter {
  bool centerstate = true;

  HeartPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.red;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.red : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x / 2 - 5, 0)
      ..lineTo(0, y)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VerticalGatePainter extends CustomPainter {
  int gatestate = 0;
  // gate type
  // 0 - undefined , 1 - personality, 2 - design, 3 - both, 4 - transit
  VerticalGatePainter({required this.gatestate});

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset(0, 0);
    final p2 = Offset(0, size.height);

    Color gatecolor1 = Colors.white;
    Color gatecolor2 = Colors.white;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    switch (gatestate) {
      case 0:
        gatecolor1 = Colors.white;
        gatecolor2 = Colors.white;
        break;
      case 1:
        gatecolor1 = Colors.black;
        gatecolor2 = Colors.black;
        break;
      case 2:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.red;
        break;
      case 3:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.black;
        break;
      case 4:
        gatecolor1 = Color.alphaBlend(Colors.red, Colors.black);
        gatecolor2 = Colors.blue;
        break;
      default:
        gatecolor1 = Colors.pink;
        gatecolor2 = Colors.pink;
        break;
    }

    Paint paint = Paint()
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
          const Offset(0, 4), // center
          const Offset(1, 4), // radius
          [gatecolor1, gatecolor2],
          [0.5, 0.5],
          TileMode.clamp);

    canvas.drawLine(p1, p2, paint);
    //canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HorizontalGatePainter extends CustomPainter {
  int gatestate = 0;
  // gate type
  // 0 - undefined , 1 - personality, 2 - design, 3 - both, 4 - transit
  HorizontalGatePainter({required this.gatestate});

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset(0, 5);
    final p2 = Offset(size.width, 5);

    Color gatecolor1 = Colors.white;
    Color gatecolor2 = Colors.white;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    switch (gatestate) {
      case 0:
        gatecolor1 = Colors.white;
        gatecolor2 = Colors.white;
        break;
      case 1:
        gatecolor1 = Colors.black;
        gatecolor2 = Colors.black;
        break;
      case 2:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.red;
        break;
      case 3:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.black;
        break;
      case 4:
        gatecolor1 = Color.alphaBlend(Colors.red, Colors.black);
        gatecolor2 = Colors.blue;
        break;
      default:
        gatecolor1 = Colors.pink;
        gatecolor2 = Colors.pink;
        break;
    }

    Paint paint = Paint()
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
          const Offset(0, 4), // center
          const Offset(1, 4), // radius
          [gatecolor1, gatecolor2],
          [0.5, 0.5],
          TileMode.clamp);

    canvas.drawLine(p1, p2, paint);
    //canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


