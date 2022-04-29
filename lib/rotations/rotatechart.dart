import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
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

  double fontSizeGate = 16.0;

  final List<bool> _isHeadList = List<bool>.filled(3, false, growable: false),
      _isAjnaTopList = List<bool>.filled(3, false, growable: false),
      _isAjnaBottomList = List<bool>.filled(3, false, growable: false),
      _isThroatFirstBottomList = List<bool>.filled(2, false, growable: false),
      _isThroatSecondBottomList = List<bool>.filled(1, false, growable: false),
      _isThroatThirdTopList = List<bool>.filled(3, false, growable: false),
      _isThroatThirdBottomList = List<bool>.filled(3, false, growable: false),
      _isThroatFourthBottomList = List<bool>.filled(1, false, growable: false),
      _isThroatFifthBottomList = List<bool>.filled(2, false, growable: false),
      _isGTopSelectedList = List<bool>.filled(3, false, growable: false),
      _isGBottomSelectedList = List<bool>.filled(5, false, growable: false),
      _isSacralTopSelectedList = List<bool>.filled(5, false, growable: false),
      _isSacralBottomSelectedList =
          List<bool>.filled(5, false, growable: false),
      _isRootFirstList = List<bool>.filled(2, false, growable: false),
      _isRootSecondList = List<bool>.filled(1, false, growable: false),
      _isRootThirdList = List<bool>.filled(3, false, growable: false),
      _isRootFourthList = List<bool>.filled(1, false, growable: false),
      _isRootFifthList = List<bool>.filled(2, false, growable: false),
      _isHeartFirstTopList = List<bool>.filled(1, false, growable: false),
      _isHeartFirstBottomList = List<bool>.filled(1, false, growable: false),
      _isHeartSecondBottomList = List<bool>.filled(1, false, growable: false),
      _isHeartThirdTopList = List<bool>.filled(1, false, growable: false),
      _isHeartThirdBottomList = List<bool>.filled(1, false, growable: false),
      _isSolarFirstBottomList = List<bool>.filled(1, false, growable: false),
      _isSolarSecondTopList = List<bool>.filled(1, false, growable: false),
      _isSolarSecondBottomList = List<bool>.filled(1, false, growable: false),
      _isSolarThirdTopList = List<bool>.filled(2, false, growable: false),
      _isSolarThirdBottomList = List<bool>.filled(2, false, growable: false),
      _isSpleenFirstTopList = List<bool>.filled(2, false, growable: false),
      _isSpleenFirstBottomList = List<bool>.filled(2, false, growable: false),
      _isSpleenSecondTopList = List<bool>.filled(1, false, growable: false),
      _isSpleenSecondBottomList = List<bool>.filled(1, false, growable: false),
      _isSpleenThirdTopList = List<bool>.filled(1, false, growable: false),
      _isSpleenThirdBottomList = List<bool>.filled(1, false, growable: false),
      _isIntegrationBottomSelectedList =
          List<bool>.filled(1, false, growable: false),
      _isCenterList = List<bool>.filled(9, true, growable: false);

  DateTime _now = DateTime.now();
  List<Hexagram> _planetsList = [];
  Hexagram _sunhex = Hexagram(),
      _earthhex = Hexagram(),
      _northnodehex = Hexagram(),
      _southnodehex = Hexagram(),
      _moonhex = Hexagram(),
      _mercuryhex = Hexagram(),
      _venushex = Hexagram(),
      _marshex = Hexagram(),
      _jupiterhex = Hexagram(),
      _saturnhex = Hexagram(),
      _uranushex = Hexagram(),
      _neptunehex = Hexagram(),
      _plutohex = Hexagram();

  List<int> _gatesList = [];
  List<int> _finalgatelist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate HD Chart'),
        backgroundColor: Colors.blueGrey,
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  for (var i = 0; i < hexagramslist.length; i++) {
                    switch (hexagramslist[i]) {
                      case 64:
                        _isHeadList[0] = !_isHeadList[0];
                        break;
                      case 61:
                        _isHeadList[1] = !_isHeadList[1];
                        break;
                      case 63:
                        _isHeadList[2] = !_isHeadList[2];
                        break;
                      case 47:
                        _isAjnaTopList[0] = !_isAjnaTopList[0];
                        break;
                      case 24:
                        _isAjnaTopList[1] = !_isAjnaTopList[1];
                        break;
                      case 4:
                        _isAjnaTopList[2] = !_isAjnaTopList[2];
                        break;
                      case 17:
                        _isAjnaBottomList[0] = !_isAjnaBottomList[0];
                        break;
                      case 43:
                        _isAjnaBottomList[1] = !_isAjnaBottomList[1];
                        break;
                      case 11:
                        _isAjnaBottomList[2] = !_isAjnaBottomList[2];
                        break;
                      case 62:
                        _isThroatThirdTopList[0] = !_isThroatThirdTopList[0];
                        break;
                      case 23:
                        _isThroatThirdTopList[1] = !_isThroatThirdTopList[1];
                        break;
                      case 56:
                        _isThroatThirdTopList[2] = !_isThroatThirdTopList[2];
                        break;
                      case 31:
                        _isThroatThirdBottomList[0] =
                        !_isThroatThirdBottomList[0];
                        break;
                      case 8:
                        _isThroatThirdBottomList[1] =
                        !_isThroatThirdBottomList[1];
                        break;
                      case 33:
                        _isThroatThirdBottomList[2] =
                        !_isThroatThirdBottomList[2];
                        break;
                      case 16:
                        _isThroatFirstBottomList[0] =
                        !_isThroatFirstBottomList[0];
                        break;
                      case 20:
                        _isThroatFirstBottomList[1] =
                        !_isThroatFirstBottomList[1];
                        _isIntegrationBottomSelectedList[0] =
                        !_isIntegrationBottomSelectedList[0];
                        break;
                      case 45:
                        _isThroatSecondBottomList[0] =
                        !_isThroatSecondBottomList[0];
                        _isThroatFourthBottomList[0] =
                        !_isThroatFourthBottomList[0];
                        break;
                      case 12:
                        _isThroatFifthBottomList[0] =
                        !_isThroatFifthBottomList[0];
                        break;
                      case 35:
                        _isThroatFifthBottomList[1] =
                        !_isThroatFifthBottomList[1];
                        break;
                      case 21:
                        _isHeartFirstTopList[0] = !_isHeartFirstTopList[0];
                        _isHeartThirdTopList[0] = !_isHeartThirdTopList[0];
                        break;
                      case 26:
                        _isHeartFirstBottomList[0] =
                        !_isHeartFirstBottomList[0];
                        break;
                      case 51:
                        _isHeartSecondBottomList[0] =
                        !_isHeartSecondBottomList[0];
                        break;
                      case 40:
                        _isHeartThirdBottomList[0] =
                        !_isHeartThirdBottomList[0];
                        break;
                      case 7:
                        _isGTopSelectedList[0] = !_isGTopSelectedList[0];
                        break;
                      case 1:
                        _isGTopSelectedList[1] = !_isGTopSelectedList[1];
                        break;
                      case 13:
                        _isGTopSelectedList[2] = !_isGTopSelectedList[2];
                        break;
                      case 10:
                        _isGBottomSelectedList[0] = !_isGBottomSelectedList[0];
                        break;
                      case 15:
                        _isGBottomSelectedList[1] = !_isGBottomSelectedList[1];
                        break;
                      case 2:
                        _isGBottomSelectedList[2] = !_isGBottomSelectedList[2];
                        break;
                      case 46:
                        _isGBottomSelectedList[3] = !_isGBottomSelectedList[3];
                        break;
                      case 25:
                        _isGBottomSelectedList[4] = !_isGBottomSelectedList[4];
                        break;
                      case 48:
                        _isSpleenFirstTopList[0] = !_isSpleenFirstTopList[0];
                        break;
                      case 57:
                        _isSpleenFirstTopList[1] = !_isSpleenFirstTopList[1];
                        _isSpleenThirdTopList[0] = !_isSpleenThirdTopList[0];
                        break;
                      case 18:
                        _isSpleenFirstBottomList[0] =
                        !_isSpleenFirstBottomList[0];
                        break;
                      case 28:
                        _isSpleenFirstBottomList[1] =
                        !_isSpleenFirstBottomList[1];
                        break;
                      case 44:
                        _isSpleenSecondTopList[0] = !_isSpleenSecondTopList[0];
                        break;
                      case 32:
                        _isSpleenSecondBottomList[0] =
                        !_isSpleenSecondBottomList[0];
                        break;
                      case 50:
                        _isSpleenThirdBottomList[0] =
                        !_isSpleenThirdBottomList[0];
                        break;
                      case 34:
                        _isSacralTopSelectedList[0] =
                        !_isSacralTopSelectedList[0];
                        break;
                      case 5:
                        _isSacralTopSelectedList[1] =
                        !_isSacralTopSelectedList[1];
                        break;
                      case 14:
                        _isSacralTopSelectedList[2] =
                        !_isSacralTopSelectedList[2];
                        break;
                      case 29:
                        _isSacralTopSelectedList[3] =
                        !_isSacralTopSelectedList[3];
                        break;
                      case 27:
                        _isSacralBottomSelectedList[0] =
                        !_isSacralBottomSelectedList[0];
                        break;
                      case 42:
                        _isSacralBottomSelectedList[1] =
                        !_isSacralBottomSelectedList[1];
                        break;
                      case 3:
                        _isSacralBottomSelectedList[2] =
                        !_isSacralBottomSelectedList[2];
                        break;
                      case 9:
                        _isSacralBottomSelectedList[3] =
                        !_isSacralBottomSelectedList[3];
                        break;
                      case 59:
                        _isSacralBottomSelectedList[4] =
                        !_isSacralBottomSelectedList[4];
                        break;
                      case 6:
                        _isSolarFirstBottomList[0] = !_isSolarFirstBottomList[0];
                        break;
                      case 37:
                        _isSolarSecondTopList[0] = !_isSolarSecondTopList[0];
                        break;
                      case 49:
                        _isSolarSecondBottomList[0] = !_isSolarSecondBottomList[0];
                        break;
                      case 22:
                        _isSolarThirdTopList[0] = !_isSolarThirdTopList[0];
                        break;
                      case 36:
                        _isSolarThirdTopList[1] = !_isSolarThirdTopList[1];
                        break;
                      case 39:
                        _isSolarThirdBottomList[0] = !_isSolarThirdBottomList[0];
                        break;
                      case 30:
                        _isSolarThirdBottomList[1] = !_isSolarThirdBottomList[1];
                        break;
                      case 58:
                        _isRootFirstList[0] = !_isRootFirstList[0];
                        break;
                      case 38:
                        _isRootFirstList[1] = !_isRootFirstList[1];
                        break;
                      case 54:
                        _isRootSecondList[0] = !_isRootSecondList[0];
                        break;
                      case 53:
                        _isRootThirdList[0] = !_isRootThirdList[0];
                        break;
                      case 60:
                        _isRootThirdList[1] = !_isRootThirdList[1];
                        break;
                      case 52:
                        _isRootThirdList[2] = !_isRootThirdList[2];
                        break;
                      case 19:
                        _isRootFourthList[0] = !_isRootFourthList[0];
                        break;
                      case 55:
                        _isRootFifthList[0] = !_isRootFifthList[0];
                        break;
                      case 41:
                        _isRootFifthList[1] = !_isRootFifthList[1];
                        break;
                      default:
                        Exception('Gate not in List');
                    }
                  }
                });
              },
              child: const Text('Select All')),
          ElevatedButton(
              onPressed: () async {
                _now = DateTime.now();
                //_planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
                _planetsList = await AstrologyServices.getCurrentData(_now);
                _sunhex = _planetsList[0];
                _earthhex = _planetsList[1];
                _northnodehex = _planetsList[2];
                _southnodehex = _planetsList[3];
                _moonhex = _planetsList[4];
                _mercuryhex = _planetsList[5];
                _venushex = _planetsList[6];
                _marshex = _planetsList[7];
                _jupiterhex = _planetsList[8];
                _saturnhex = _planetsList[9];
                _uranushex = _planetsList[10];
                _neptunehex = _planetsList[11];
                _plutohex = _planetsList[12];

                _gatesList = [
                  _sunhex.gate!,
                  _earthhex.gate!,
                  _northnodehex.gate!,
                  _southnodehex.gate!,
                  _moonhex.gate!,
                  _mercuryhex.gate!,
                  _venushex.gate!,
                  _marshex.gate!,
                  _jupiterhex.gate!,
                  _saturnhex.gate!,
                  _uranushex.gate!,
                  _neptunehex.gate!,
                  _plutohex.gate!,
                ];

                var seen = <int>{};
                _finalgatelist = _gatesList
                    .where((_gatetoadd) => seen.add(_gatetoadd))
                    .toList();

                setState(() {
                  for (var i = 0; i < _finalgatelist.length; i++) {
                    switch (_finalgatelist[i]) {
                      case 64:
                        _isHeadList[0] = !_isHeadList[0];
                        break;
                      case 61:
                        _isHeadList[1] = !_isHeadList[1];
                        break;
                      case 63:
                        _isHeadList[2] = !_isHeadList[2];
                        break;
                      case 47:
                        _isAjnaTopList[0] = !_isAjnaTopList[0];
                        break;
                      case 24:
                        _isAjnaTopList[1] = !_isAjnaTopList[1];
                        break;
                      case 4:
                        _isAjnaTopList[2] = !_isAjnaTopList[2];
                        break;
                      case 17:
                        _isAjnaBottomList[0] = !_isAjnaBottomList[0];
                        break;
                      case 43:
                        _isAjnaBottomList[1] = !_isAjnaBottomList[1];
                        break;
                      case 11:
                        _isAjnaBottomList[2] = !_isAjnaBottomList[2];
                        break;
                      case 62:
                        _isThroatThirdTopList[0] = !_isThroatThirdTopList[0];
                        break;
                      case 23:
                        _isThroatThirdTopList[1] = !_isThroatThirdTopList[1];
                        break;
                      case 56:
                        _isThroatThirdTopList[2] = !_isThroatThirdTopList[2];
                        break;
                      case 31:
                        _isThroatThirdBottomList[0] =
                            !_isThroatThirdBottomList[0];
                        break;
                      case 8:
                        _isThroatThirdBottomList[1] =
                            !_isThroatThirdBottomList[1];
                        break;
                      case 33:
                        _isThroatThirdBottomList[2] =
                            !_isThroatThirdBottomList[2];
                        break;
                      case 16:
                        _isThroatFirstBottomList[0] =
                            !_isThroatFirstBottomList[0];
                        break;
                      case 20:
                        _isThroatFirstBottomList[1] =
                            !_isThroatFirstBottomList[1];
                        _isIntegrationBottomSelectedList[0] =
                            !_isIntegrationBottomSelectedList[0];
                        break;
                      case 45:
                        _isThroatSecondBottomList[0] =
                            !_isThroatSecondBottomList[0];
                        _isThroatFourthBottomList[0] =
                        !_isThroatFourthBottomList[0];
                        break;
                      case 12:
                        _isThroatFifthBottomList[0] =
                            !_isThroatFifthBottomList[0];
                        break;
                      case 35:
                        _isThroatFifthBottomList[1] =
                            !_isThroatFifthBottomList[1];
                        break;
                      case 21:
                        _isHeartFirstTopList[0] = !_isHeartFirstTopList[0];
                        _isHeartThirdTopList[0] = !_isHeartThirdTopList[0];
                        break;
                      case 26:
                        _isHeartFirstBottomList[0] =
                            !_isHeartFirstBottomList[0];
                        break;
                      case 51:
                        _isHeartSecondBottomList[0] =
                            !_isHeartSecondBottomList[0];
                        break;
                      case 40:
                        _isHeartThirdBottomList[0] =
                            !_isHeartThirdBottomList[0];
                        break;
                      case 7:
                        _isGTopSelectedList[0] = !_isGTopSelectedList[0];
                        break;
                      case 1:
                        _isGTopSelectedList[1] = !_isGTopSelectedList[1];
                        break;
                      case 13:
                        _isGTopSelectedList[2] = !_isGTopSelectedList[2];
                        break;
                      case 10:
                        _isGBottomSelectedList[0] = !_isGBottomSelectedList[0];
                        break;
                      case 15:
                        _isGBottomSelectedList[1] = !_isGBottomSelectedList[1];
                        break;
                      case 2:
                        _isGBottomSelectedList[2] = !_isGBottomSelectedList[2];
                        break;
                      case 46:
                        _isGBottomSelectedList[3] = !_isGBottomSelectedList[3];
                        break;
                      case 25:
                        _isGBottomSelectedList[4] = !_isGBottomSelectedList[4];
                        break;
                      case 48:
                        _isSpleenFirstTopList[0] = !_isSpleenFirstTopList[0];
                        break;
                      case 57:
                        _isSpleenFirstTopList[1] = !_isSpleenFirstTopList[1];
                        _isSpleenThirdTopList[0] = !_isSpleenThirdTopList[0];
                        break;
                      case 18:
                        _isSpleenFirstBottomList[0] =
                            !_isSpleenFirstBottomList[0];
                        break;
                      case 28:
                        _isSpleenFirstBottomList[1] =
                            !_isSpleenFirstBottomList[1];
                        break;
                      case 44:
                        _isSpleenSecondTopList[0] = !_isSpleenSecondTopList[0];
                        break;
                      case 32:
                        _isSpleenSecondBottomList[0] =
                            !_isSpleenSecondBottomList[0];
                        break;
                      case 50:
                        _isSpleenThirdBottomList[0] =
                            !_isSpleenThirdBottomList[0];
                        break;
                      case 34:
                        _isSacralTopSelectedList[0] =
                        !_isSacralTopSelectedList[0];
                        break;
                      case 5:
                        _isSacralTopSelectedList[1] =
                        !_isSacralTopSelectedList[1];
                        break;
                      case 14:
                        _isSacralTopSelectedList[2] =
                        !_isSacralTopSelectedList[2];
                        break;
                      case 29:
                        _isSacralTopSelectedList[3] =
                        !_isSacralTopSelectedList[3];
                        break;
                        case 27:
                        _isSacralBottomSelectedList[0] =
                            !_isSacralBottomSelectedList[0];
                        break;
                      case 42:
                        _isSacralBottomSelectedList[1] =
                        !_isSacralBottomSelectedList[1];
                        break;
                      case 3:
                        _isSacralBottomSelectedList[2] =
                        !_isSacralBottomSelectedList[2];
                        break;
                      case 9:
                        _isSacralBottomSelectedList[3] =
                        !_isSacralBottomSelectedList[3];
                        break;
                      case 59:
                        _isSacralBottomSelectedList[4] =
                        !_isSacralBottomSelectedList[4];
                        break;
                      case 6:
                        _isSolarFirstBottomList[0] = !_isSolarFirstBottomList[0];
                        break;
                      case 37:
                        _isSolarSecondTopList[0] = !_isSolarSecondTopList[0];
                        break;
                      case 49:
                        _isSolarSecondBottomList[0] = !_isSolarSecondBottomList[0];
                        break;
                      case 22:
                        _isSolarThirdTopList[0] = !_isSolarThirdTopList[0];
                        break;
                      case 36:
                        _isSolarThirdTopList[1] = !_isSolarThirdTopList[1];
                        break;
                      case 39:
                        _isSolarThirdBottomList[0] = !_isSolarThirdBottomList[0];
                        break;
                      case 30:
                        _isSolarThirdBottomList[1] = !_isSolarThirdBottomList[1];
                        break;
                      case 58:
                        _isRootFirstList[0] = !_isRootFirstList[0];
                        break;
                      case 38:
                        _isRootFirstList[1] = !_isRootFirstList[1];
                        break;
                      case 54:
                        _isRootSecondList[0] = !_isRootSecondList[0];
                        break;
                      case 53:
                        _isRootThirdList[0] = !_isRootThirdList[0];
                        break;
                      case 60:
                        _isRootThirdList[1] = !_isRootThirdList[1];
                        break;
                      case 52:
                        _isRootThirdList[2] = !_isRootThirdList[2];
                        break;
                      case 19:
                        _isRootFourthList[0] = !_isRootFourthList[0];
                        break;
                        case 55:
                        _isRootFifthList[0] = !_isRootFifthList[0];
                        break;
                      case 41:
                        _isRootFifthList[1] = !_isRootFifthList[1];
                        break;
                      default:
                        Exception('Gate not in List');
                    }
                  }
                });
              },
              child: const Text('Planets Now')),
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10,),
                const CircleAvatar(
              minRadius: 15.0,
              maxRadius: 15.0,
              backgroundColor: Colors.blue,
              foregroundImage: AssetImage('assets/planets/sun.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/earth.png')),
            const CircleAvatar(
              minRadius: 15.0,
              maxRadius: 15.0,
              backgroundColor: Colors.blue,
              foregroundImage: AssetImage('assets/planets/northnode.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/southnode.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/moon.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/mercury.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/venus.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/mars.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/jupiter.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/saturn.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/uranus.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/sun.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/neptune.png')),
            const CircleAvatar(
                minRadius: 15.0,
                maxRadius: 15.0,
                backgroundColor: Colors.blue,
                foregroundImage: AssetImage('assets/planets/pluto.png')),
                SizedBox(width: 10,),
          ]),
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
                                      color: Colors.red,
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
                                      color: Colors.red,
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
                                        color: Colors.red,
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
                                      color: Colors.red,
                                      fontSize: fontSizeGate,),
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
                                      '55',
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
                                      '39',
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
