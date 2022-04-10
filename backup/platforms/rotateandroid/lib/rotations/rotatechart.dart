import 'package:flutter/material.dart';

class RotateChart extends StatefulWidget {
  const RotateChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateChartState();
  }
}

class _RotateChartState extends State<RotateChart> {
  bool isHeadVisible = true,
   isAjnaVisible = true,
   isThroatVisible = true,
   isGVisible = true,
   isSacralVisible = true,
   isRootVisible = true,
   isSpleenVisible = true,
   isSolarVisible = true,
   isHeartVisible = true,
   isIntegrationVisible = true;

  double fontSizeGate = 18.0;

  final List<bool> _isHeadList = List<bool>.filled(3, false, growable: false),
   _isAjnaTopList =
      List<bool>.filled(3, false, growable: false),
   _isAjnaBottomList =
      List<bool>.filled(3, false, growable: false),
   _isThroatFirstBottomList =
      List<bool>.filled(2, false, growable: false),

   _isThroatSecondBottomList =
      List<bool>.filled(1, false, growable: false),
   _isThroatThirdTopList =
      List<bool>.filled(3, false, growable: false),
   _isThroatThirdBottomList =
      List<bool>.filled(3, false, growable: false),

   _isThroatFourthBottomList =
      List<bool>.filled(1, false, growable: false),

   _isThroatFifthBottomList =
      List<bool>.filled(2, false, growable: false),

   _isGTopSelectedList =
      List<bool>.filled(3, false, growable: false),
   _isGBottomSelectedList =
      List<bool>.filled(5, false, growable: false),
   _isSacralTopSelectedList =
      List<bool>.filled(5, false, growable: false),
   _isSacralBottomSelectedList =
      List<bool>.filled(5, false, growable: false),

   _isRootFirstList =
      List<bool>.filled(2, false, growable: false),
   _isRootSecondList =
      List<bool>.filled(1, false, growable: false),
   _isRootThirdList =
      List<bool>.filled(3, false, growable: false),
   _isRootFourthList =
      List<bool>.filled(1, false, growable: false),
   _isRootFifthList =
      List<bool>.filled(2, false, growable: false),

   _isHeartFirstTopList =
      List<bool>.filled(1, false, growable: false),
   _isHeartFirstBottomList =
      List<bool>.filled(1, false, growable: false),

   _isHeartSecondBottomList =
      List<bool>.filled(1, false, growable: false),
   _isHeartThirdTopList =
      List<bool>.filled(1, false, growable: false),
   _isHeartThirdBottomList =
      List<bool>.filled(1, false, growable: false),

   _isSolarFirstBottomList =
      List<bool>.filled(1, false, growable: false),
   _isSolarSecondTopList =
      List<bool>.filled(1, false, growable: false),
   _isSolarSecondBottomList =
      List<bool>.filled(1, false, growable: false),
   _isSolarThirdTopList =
      List<bool>.filled(2, false, growable: false),
   _isSolarThirdBottomList =
      List<bool>.filled(2, false, growable: false),

   _isSpleenFirstTopList =
      List<bool>.filled(2, false, growable: false),
   _isSpleenFirstBottomList =
      List<bool>.filled(2, false, growable: false),
   _isSpleenSecondTopList =
      List<bool>.filled(1, false, growable: false),
   _isSpleenSecondBottomList =
      List<bool>.filled(1, false, growable: false),
   _isSpleenThirdTopList =
      List<bool>.filled(1, false, growable: false),
   _isSpleenThirdBottomList =
      List<bool>.filled(1, false, growable: false),

   _isIntegrationBottomSelectedList =
      List<bool>.filled(1, false, growable: false),

   _isCenterList = List<bool>.filled(9, true, growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate Human Design Chart'),
        backgroundColor: Colors.blueGrey,
        actions: [
          ToggleButtons(
            borderWidth: 10.0,
            hoverColor: Colors.blue,
            fillColor: Colors.white,
            textStyle: const TextStyle(fontSize: 15),
            children: const [
              Text('Head'),
              Text('Ajna'),
              Text('Throat'),
              Text('G'),
              Text('Heart'),
              Text('Spleen'),
              Text('Sacral'),
              Text('Solar'),
              Text('Root'),
            ],
            isSelected: _isCenterList,
            onPressed: (int index) {
              setState(() {
                _isCenterList[index] = !_isCenterList[index];
                switch (index) {
                  case 0:
                    isHeadVisible = !isHeadVisible;
                    break;
                  case 1:
                    isAjnaVisible = !isAjnaVisible;
                    break;
                  case 2:
                    isThroatVisible = !isThroatVisible;
                    break;
                  case 3:
                    isGVisible = !isGVisible;
                    break;
                  case 4:
                    isHeartVisible = !isHeartVisible;
                    break;
                  case 5:
                    isSpleenVisible = !isSpleenVisible;
                    break;
                  case 6:
                    isSacralVisible = !isSacralVisible;
                    break;
                  case 7:
                    isSolarVisible = !isSolarVisible;
                    break;
                  case 8:
                    isRootVisible = !isRootVisible;
                    break;
                  default:
                    isHeadVisible = !isHeadVisible;
                }
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isHeadVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.blue),
                        child: Column(
                          children: [
                            Container(
                                width: 500,
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(3.0),
                                color: Colors.black),
                            Expanded(
                              child: ToggleButtons(
                                borderWidth: 10.0,
                                hoverColor: Colors.grey,
                                //borderRadius: BorderRadius.circular(20),
                                fillColor: Colors.white,
                                children: [
                                  Text(
                                    '64',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                  Text(
                                    '61',
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
                                ],
                                isSelected: _isHeadList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isHeadList[index] = !_isHeadList[index];
                                  });
                                },
                              ),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isAjnaVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.green,
                        ),
                        child: Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '47',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '24',
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
                              isSelected: _isAjnaTopList,
                              onPressed: (int index) {
                                setState(() {
                                  _isAjnaTopList[index] =
                                      !_isAjnaTopList[index];
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
                                  '17',
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
                                  '11',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isAjnaBottomList,
                              onPressed: (int index) {
                                setState(() {
                                  _isAjnaBottomList[index] =
                                      !_isAjnaBottomList[index];
                                });
                              },
                            ),
                          )
                        ]))),
              ],
            ),
          ),
          Visibility(
            visible: isThroatVisible,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.purple,
                          ),
                          child: Column(children: [
                            Container(height: 40),
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
                                ],
                                isSelected: _isThroatSecondBottomList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isThroatSecondBottomList[index] =
                                        !_isThroatSecondBottomList[index];

                                    _isThroatFourthBottomList[index] =
                                        !_isThroatFourthBottomList[index];
                                  });
                                },
                              ),
                            )
                          ])),
                      Container(width: 160),
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.purple,
                          ),
                          child: Column(children: [
                            Expanded(
                              child: ToggleButtons(
                                borderWidth: 10.0,
                                hoverColor: Colors.grey,
                                //borderRadius: BorderRadius.circular(20),
                                fillColor: Colors.white,
                                children: [
                                  Text(
                                    '62',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                  Text(
                                    '23',
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
                                isSelected: _isThroatThirdTopList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isThroatThirdTopList[index] =
                                        !_isThroatThirdTopList[index];
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
                                    '31',
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
                                  Text(
                                    '33',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                ],
                                isSelected: _isThroatThirdBottomList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isThroatThirdBottomList[index] =
                                        !_isThroatThirdBottomList[index];
                                  });
                                },
                              ),
                            )
                          ])),
                      Container(width: 160),
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.purple,
                          ),
                          child: Column(children: [
                            Container(height: 40),
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
                                ],
                                isSelected: _isThroatFourthBottomList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isThroatFourthBottomList[index] =
                                        !_isThroatFourthBottomList[index];

                                    _isThroatSecondBottomList[index] =
                                        !_isThroatSecondBottomList[index];
                                  });
                                },
                              ),
                            )
                          ]))
                    ]),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isThroatVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.purple,
                        ),
                        child: Column(children: [
                          Container(height: 40),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '16',
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
                              isSelected: _isThroatFirstBottomList,
                              onPressed: (int index) {
                                setState(() {
                                  switch (index) {
                                    case 0:
                                      _isThroatFirstBottomList[index] =
                                          !_isThroatFirstBottomList[index];
                                      break;
                                    case 1:
                                      _isThroatFirstBottomList[index] =
                                          !_isThroatFirstBottomList[index];
                                      _isIntegrationBottomSelectedList[0] =
                                          !_isIntegrationBottomSelectedList[0];
                                      break;
                                    default:
                                      _isThroatFirstBottomList[index] =
                                          !_isThroatFirstBottomList[index];
                                      break;
                                  }
                                });
                              },
                            ),
                          )
                        ]))),
                Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    color: Colors.black),
                Visibility(
                    visible: isHeartVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.pink,
                        ),
                        child: Column(children: [
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
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isHeartFirstTopList,
                              onPressed: (int index) {
                                setState(() {
                                  _isHeartFirstTopList[index] =
                                      !_isHeartFirstTopList[index];
                                  _isHeartThirdTopList[index] =
                                      !_isHeartThirdTopList[index];
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
                                  '26',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isHeartFirstBottomList,
                              onPressed: (int index) {
                                setState(() {
                                  _isHeartFirstBottomList[index] =
                                      !_isHeartFirstBottomList[index];
                                });
                              },
                            ),
                          )
                        ]))),
                Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    color: Colors.black),
                Visibility(
                    visible: isThroatVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple),
                          color: Colors.purple,
                        ),
                        child: Column(children: [
                          Container(height: 40),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '20',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isIntegrationBottomSelectedList,
                              onPressed: (int index) {
                                setState(() {
                                  _isIntegrationBottomSelectedList[index] =
                                      !_isIntegrationBottomSelectedList[index];
                                  _isThroatFirstBottomList[1] =
                                      !_isThroatFirstBottomList[1];
                                });
                              },
                            ),
                          )
                        ]))),
                Visibility(
                    visible: isGVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.grey,
                        ),
                        child: Column(children: [
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '7',
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
                                  '13',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isGTopSelectedList,
                              onPressed: (int index) {
                                setState(() {
                                  _isGTopSelectedList[index] =
                                      !_isGTopSelectedList[index];
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
                                  '10',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '15',
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
                                  '46',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '25',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isGBottomSelectedList,
                              onPressed: (int index) {
                                setState(() {
                                  _isGBottomSelectedList[index] =
                                      !_isGBottomSelectedList[index];
                                });
                              },
                            ),
                          )
                        ]))),
                Visibility(
                    visible: isHeartVisible,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.pink,
                      ),
                      child: Row(children: [
                        Column(children: [
                          Container(height: 40),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '51',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isHeartSecondBottomList,
                              onPressed: (int index) {
                                setState(() {
                                  _isHeartSecondBottomList[index] =
                                      !_isHeartSecondBottomList[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    color: Colors.transparent),
                Visibility(
                    visible: isHeartVisible,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.pink,
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
                                  '21',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isHeartThirdTopList,
                              onPressed: (int index) {
                                setState(() {
                                  _isHeartFirstTopList[index] =
                                      !_isHeartFirstTopList[index];
                                  _isHeartThirdTopList[index] =
                                      !_isHeartThirdTopList[index];
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
                                  '40',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isHeartThirdBottomList,
                              onPressed: (int index) {
                                setState(() {
                                  _isHeartThirdBottomList[index] =
                                      !_isHeartThirdBottomList[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    color: Colors.black),
                Visibility(
                    visible: isThroatVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.purple,
                        ),
                        child: Column(children: [
                          Container(height: 40),
                          Expanded(
                            child: ToggleButtons(
                              borderWidth: 10.0,
                              hoverColor: Colors.grey,
                              //borderRadius: BorderRadius.circular(20),
                              fillColor: Colors.white,
                              children: [
                                Text(
                                  '12',
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
                              ],
                              isSelected: _isThroatFifthBottomList,
                              onPressed: (int index) {
                                setState(() {
                                  _isThroatFifthBottomList[index] =
                                      !_isThroatFifthBottomList[index];
                                });
                              },
                            ),
                          )
                        ]))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isSpleenVisible,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.yellow[300],
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
                                    '48',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                  Text(
                                    '57',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                ],
                                isSelected: _isSpleenFirstTopList,
                                onPressed: (int index) {
                                  setState(() {
                                    switch (index) {
                                      case 0:
                                        _isSpleenFirstTopList[index] =
                                            !_isSpleenFirstTopList[index];
                                        break;
                                      case 1:
                                        _isSpleenFirstTopList[index] =
                                            !_isSpleenFirstTopList[index];
                                        _isSpleenThirdTopList[0] =
                                            !_isSpleenThirdTopList[0];
                                        break;
                                      default:
                                        _isThroatFirstBottomList[index] =
                                            !_isThroatFirstBottomList[index];
                                        break;
                                    }
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
                                    '18',
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
                                isSelected: _isSpleenFirstBottomList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isSpleenFirstBottomList[index] =
                                        !_isSpleenFirstBottomList[index];
                                  });
                                },
                              ),
                            )
                          ]),
                        ]),
                      ),
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          color: Colors.transparent),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.yellow[300],
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
                                    '44',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                ],
                                isSelected: _isSpleenSecondTopList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isSpleenSecondTopList[index] =
                                        !_isSpleenSecondTopList[index];
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
                                    '32',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                ],
                                isSelected: _isSpleenSecondBottomList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isSpleenSecondBottomList[index] =
                                        !_isSpleenSecondBottomList[index];
                                  });
                                },
                              ),
                            )
                          ]),
                        ]),
                      ),
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          color: Colors.transparent),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.yellow[300],
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
                                        color: Colors.blueGrey,
                                        fontSize: fontSizeGate),
                                  ),
                                ],
                                isSelected: _isSpleenThirdTopList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isSpleenThirdTopList[index] =
                                        !_isSpleenThirdTopList[index];

                                    _isSpleenFirstTopList[1] =
                                        !_isSpleenFirstTopList[1];
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
                                    '50',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeGate),
                                  ),
                                ],
                                isSelected: _isSpleenThirdBottomList,
                                onPressed: (int index) {
                                  setState(() {
                                    _isSpleenThirdBottomList[index] =
                                        !_isSpleenThirdBottomList[index];
                                  });
                                },
                              ),
                            )
                          ]),
                        ]),
                      ),
                    ]),
                  ),
                ),
                Visibility(
                    visible: isSacralVisible,
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
                                  '34',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '5',
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
                                  '29',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                              ],
                              isSelected: _isSacralTopSelectedList,
                              onPressed: (int index) {
                                setState(() {
                                  _isSacralTopSelectedList[index] =
                                      !_isSacralTopSelectedList[index];
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
                                  '27',
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
                                  '3',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeGate),
                                ),
                                Text(
                                  '9',
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
                              ],
                              isSelected: _isSacralBottomSelectedList,
                              onPressed: (int index) {
                                setState(() {
                                  _isSacralBottomSelectedList[index] =
                                      !_isSacralBottomSelectedList[index];
                                });
                              },
                            ),
                          )
                        ]),
                      ]),
                    )),
                Visibility(
                  visible: isSolarVisible,
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.yellow[900],
                          ),
                          child: Row(children: [
                            Column(children: [
                              Container(height: 40),
                              Expanded(
                                child: ToggleButtons(
                                  borderWidth: 10.0,
                                  hoverColor: Colors.grey,
                                  //borderRadius: BorderRadius.circular(20),
                                  fillColor: Colors.white,
                                  children: [
                                    Text(
                                      '6',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeGate),
                                    ),
                                  ],
                                  isSelected: _isSolarFirstBottomList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isSolarFirstBottomList[index] =
                                          !_isSolarFirstBottomList[index];
                                    });
                                  },
                                ),
                              )
                            ]),
                          ]),
                        ),
                        Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(3.0),
                            color: Colors.transparent),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.yellow[900],
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
                                      '37',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeGate),
                                    ),
                                  ],
                                  isSelected: _isSolarSecondTopList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isSolarSecondTopList[index] =
                                          !_isSolarSecondTopList[index];
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
                                      '49',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeGate),
                                    ),
                                  ],
                                  isSelected: _isSolarSecondBottomList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isSolarSecondBottomList[index] =
                                          !_isSolarSecondBottomList[index];
                                    });
                                  },
                                ),
                              )
                            ]),
                          ]),
                        ),
                        Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(3.0),
                            color: Colors.transparent),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.yellow[900],
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
                                      '22',
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
                                  isSelected: _isSolarThirdTopList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isSolarThirdTopList[index] =
                                          !_isSolarThirdTopList[index];
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
                                      '39',
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
                                  ],
                                  isSelected: _isSolarThirdBottomList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isSolarThirdBottomList[index] =
                                          !_isSolarThirdBottomList[index];
                                    });
                                  },
                                ),
                              )
                            ]),
                          ]),
                        ),
                      ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isRootVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.red),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(children: [
                                ToggleButtons(
                                  borderWidth: 10.0,
                                  hoverColor: Colors.grey,
                                  //borderRadius: BorderRadius.circular(20),
                                  fillColor: Colors.white,
                                  children: [
                                    Text(
                                      '58',
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
                                  ],
                                  isSelected: _isRootFirstList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isRootFirstList[index] =
                                          !_isRootFirstList[index];
                                    });
                                  },
                                ),
                                Container(width: 35),
                                ToggleButtons(
                                  borderWidth: 10.0,
                                  hoverColor: Colors.grey,
                                  //borderRadius: BorderRadius.circular(20),
                                  fillColor: Colors.white,
                                  children: [
                                    Text(
                                      '54',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeGate),
                                    ),
                                  ],
                                  isSelected: _isRootSecondList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isRootSecondList[index] =
                                          !_isRootSecondList[index];
                                    });
                                  },
                                ),
                                Container(
                                  width: 180,
                                ),
                                ToggleButtons(
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
                                      '60',
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
                                  isSelected: _isRootThirdList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isRootThirdList[index] =
                                          !_isRootThirdList[index];
                                    });
                                  },
                                ),
                                Container(
                                  width: 180,
                                ),
                                ToggleButtons(
                                  borderWidth: 10.0,
                                  hoverColor: Colors.grey,
                                  //borderRadius: BorderRadius.circular(20),
                                  fillColor: Colors.white,
                                  children: [
                                    Text(
                                      '19',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeGate),
                                    ),
                                  ],
                                  isSelected: _isRootFourthList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isRootFourthList[index] =
                                          !_isRootFourthList[index];
                                    });
                                  },
                                ),
                                Container(width: 35),
                                ToggleButtons(
                                  borderWidth: 10.0,
                                  hoverColor: Colors.grey,
                                  //borderRadius: BorderRadius.circular(20),
                                  fillColor: Colors.white,
                                  children: [
                                    Text(
                                      '55',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeGate),
                                    ),
                                    Text(
                                      '41',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: fontSizeGate),
                                    ),
                                  ],
                                  isSelected: _isRootFifthList,
                                  onPressed: (int index) {
                                    setState(() {
                                      _isRootFifthList[index] =
                                          !_isRootFifthList[index];
                                    });
                                  },
                                ),
                              ]),
                            ),
                            Row(children: [
                              Container(
                                  width: 250,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  color: Colors.black),
                              Container(
                                  width: 250,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  color: Colors.black),
                            ])
                          ],
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
