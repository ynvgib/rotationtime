import 'package:flutter/material.dart';
//import 'package:finallyicanlearn/lists.dart';

// /about
// /indicatorNoLogic
class RotateHexagramTable extends StatefulWidget {
  const RotateHexagramTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateHexagramTableState();
  }
}

class _RotateHexagramTableState extends State<RotateHexagramTable> {
  // visibility of planets init
  bool isFirstLeftVisible = true;
  bool isFirstCenterLeftVisible = true;
  bool isFirstCenterRightVisible = true;
  bool isFirstRightVisible = true;
  bool isSecondLeftVisible = true;
  bool isSecondCenterLeftVisible = true;
  bool isSecondCenterRightVisible = true;
  bool isSecondRightVisible = true;
  bool isThirdLeftVisible = true;
  bool isThirdCenterLeftVisible = true;
  bool isThirdCenterRightVisible = true;
  bool isThirdRightVisible = true;
  bool isFourthLeftVisible = true;
  bool isFourthCenterLeftVisible = true;
  bool isFourthCenterRightVisible = true;
  bool isFourthRightVisible = true;
  bool isFifthLeftVisible = true;
  bool isFifthCenterLeftVisible = true;
  bool isFifthCenterRightVisible = true;
  bool isFifthRightVisible = true;

  double fontSizeGate = 25.0;

  final List<bool> _isFirstLeftLeftTopSelected =
      List<bool>.filled(4, false, growable: false);
  final List<bool> _isFirstLeftLeftBottomSelected =
      List<bool>.filled(4, false, growable: false);
  final List<bool> _isFirstCenterLeftTopSelected =
      List<bool>.filled(4, false, growable: false);
  final List<bool> _isFirstCenterLeftBottomSelected =
      List<bool>.filled(4, false, growable: false);
  final List<bool> _isFirstCenterRightTopSelected =
      List<bool>.filled(4, false, growable: false);
  final List<bool> _isFirstCenterRightBottomSelected =
      List<bool>.filled(4, false, growable: false);
  final List<bool> _isFirstRightRightTopSelected =
      List<bool>.filled(4, false, growable: false);
  final List<bool> _isFirstRightRightBottomSelected =
      List<bool>.filled(4, false, growable: false);

  final List<bool> _isSecondLeftLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isSecondLeftLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isSecondCenterLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isSecondCenterLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isSecondCenterRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isSecondCenterRightBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isSecondRightRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isSecondRightRightBottomSelected =
  List<bool>.filled(4, false, growable: false);

  final List<bool> _isThirdLeftLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isThirdLeftLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isThirdCenterLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isThirdCenterLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isThirdCenterRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isThirdCenterRightBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isThirdRightRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isThirdRightRightBottomSelected =
  List<bool>.filled(4, false, growable: false);

  final List<bool> _isFourthLeftLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFourthLeftLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFourthCenterLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFourthCenterLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFourthCenterRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFourthCenterRightBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFourthRightRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFourthRightRightBottomSelected =
  List<bool>.filled(4, false, growable: false);

  final List<bool> _isFifthLeftLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFifthLeftLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFifthCenterLeftTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFifthCenterLeftBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFifthCenterRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFifthCenterRightBottomSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFifthRightRightTopSelected =
  List<bool>.filled(4, false, growable: false);
  final List<bool> _isFifthRightRightBottomSelected =
  List<bool>.filled(4, false, growable: false);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate Hexagram Table'),
          backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          // 1st row
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isFirstLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstLeftLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstLeftLeftTopSelected[index] =
                                      !_isFirstLeftLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '8',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstLeftLeftBottomSelected ,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstLeftLeftBottomSelected[index] =
                                      !_isFirstLeftLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFirstCenterLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '9',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '11',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstCenterLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstCenterLeftTopSelected [index] =
                                      !_isFirstCenterLeftTopSelected [index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '13',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '14',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '15',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '16',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstCenterLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstCenterLeftBottomSelected[index] =
                                      !_isFirstCenterLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFirstCenterRightVisible  ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '17',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '18',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '19',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '20',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstCenterRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstCenterRightTopSelected[index] =
                                      !_isFirstCenterRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '21',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,
                                  ),
                                ),
                                Text(
                                  '22',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,
                                      ),
                                ),
                                Text(
                                  '23',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,
                                      ),
                                ),
                                Text(
                                  '24',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstCenterRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstCenterRightBottomSelected[index] =
                                      !_isFirstCenterRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFirstRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '25',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '26',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '27',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '28',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstRightRightTopSelected ,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstRightRightTopSelected[index] =
                                      !_isFirstRightRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '29',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '30',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '31',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '32',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isFirstRightRightBottomSelected ,
                              onPressed: (int index) {
                                setState(() {
                                  _isFirstRightRightBottomSelected[index] =
                                      !_isFirstRightRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isSecondLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.green[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '33',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '34',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '35',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '36',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondLeftLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondLeftLeftTopSelected[index] =
                                      !_isSecondLeftLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '37',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '38',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '39',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '40',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondLeftLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondLeftLeftBottomSelected[index] =
                                      !_isSecondLeftLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isSecondCenterLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.green[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '41',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '42',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '43',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '44',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondCenterLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondCenterLeftTopSelected[index] =
                                      !_isSecondCenterLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '45',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '46',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '47',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '48',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondCenterLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondCenterLeftBottomSelected[index] =
                                      !_isSecondCenterLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isSecondCenterRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.green[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '49',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '50',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '51',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '52',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondCenterRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondCenterRightTopSelected[index] =
                                      !_isSecondCenterRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '53',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '54',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '55',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '56',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondCenterRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondCenterRightBottomSelected[index] =
                                      !_isSecondCenterRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isSecondRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.green[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '57',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '58',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '59',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '60',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondRightRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondRightRightTopSelected[index] =
                                      !_isSecondRightRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '61',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '62',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '63',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '64',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSecondRightRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isSecondRightRightBottomSelected[index] =
                                      !_isSecondRightRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isThirdLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.grey[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdLeftLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdLeftLeftTopSelected[index] =
                                      !_isThirdLeftLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdLeftLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdLeftLeftBottomSelected[index] =
                                      !_isThirdLeftLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isThirdCenterLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.grey[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdCenterLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdCenterLeftTopSelected[index] =
                                      !_isThirdCenterLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdCenterLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdCenterLeftBottomSelected[index] =
                                      !_isThirdCenterLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isThirdCenterRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.grey[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdCenterRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdCenterRightTopSelected[index] =
                                      !_isThirdCenterRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdCenterRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdCenterRightBottomSelected[index] =
                                      !_isThirdCenterRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isThirdRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.grey[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdRightRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdRightRightTopSelected[index] =
                                      !_isThirdRightRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isThirdRightRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isThirdRightRightBottomSelected[index] =
                                      !_isThirdRightRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isFourthLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.yellow[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'a',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,
                                      fontFamily: 'iChing',
                                  ),
                                ),
                                Text(
                                  'b',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,
                                    fontFamily: 'iChing'
                                  ),
                                ),
                                Text(
                                  'c',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'd',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthLeftLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthLeftLeftTopSelected[index] =
                                      !_isFourthLeftLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'e',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'f',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'g',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'h',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthLeftLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthLeftLeftBottomSelected[index] =
                                      !_isFourthLeftLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFourthCenterLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.yellow[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'i',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'j',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'k',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'l',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthCenterLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthCenterLeftTopSelected[index] =
                                      !_isFourthCenterLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'm',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'n',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'o',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'p',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthCenterLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthCenterLeftBottomSelected[index] =
                                      !_isFourthCenterLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFourthCenterRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.yellow[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'q',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'r',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  's',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  't',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthCenterRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthCenterRightTopSelected[index] =
                                      !_isFourthCenterRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'u',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'v',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'w',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'x',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthCenterRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthCenterRightBottomSelected[index] =
                                      !_isFourthCenterRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFourthRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.yellow[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'y',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'z',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'A',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'B',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthRightRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthRightRightTopSelected[index] =
                                      !_isFourthRightRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'C',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'D',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'E',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'F',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFourthRightRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFourthRightRightBottomSelected[index] =
                                      !_isFourthRightRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isFifthLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.red[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'G',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'H',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'I',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'J',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthLeftLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthLeftLeftTopSelected[index] =
                                      !_isFifthLeftLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'K',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'L',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'M',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'N',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthLeftLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthLeftLeftBottomSelected[index] =
                                      !_isFifthLeftLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFifthCenterLeftVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.red[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'O',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'P',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'Q',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'R',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthCenterLeftTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthCenterLeftTopSelected[index] =
                                      !_isFifthCenterLeftTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'S',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'T',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'U',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'V',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthCenterLeftBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthCenterLeftBottomSelected[index] =
                                      !_isFifthCenterLeftBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFifthCenterRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.red[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  'W',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'X',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'Y',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  'Z',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthCenterRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthCenterRightTopSelected[index] =
                                      !_isFifthCenterRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthCenterRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthCenterRightBottomSelected[index] =
                                      !_isFifthCenterRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                    visible: isFifthRightVisible ,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.red[600],
                      ),
                      child: Row(children: [
                        Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '8',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthRightRightTopSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthRightRightTopSelected[index] =
                                      !_isFifthRightRightTopSelected[index];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '9',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '!',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                                Text(
                                  '@',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate,fontFamily: 'iChing',),
                                ),
                              ],
                              isSelected: _isFifthRightRightBottomSelected,
                              onPressed: (int index) {
                                setState(() {
                                  _isFifthRightRightBottomSelected[index] =
                                      !_isFifthRightRightBottomSelected[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
