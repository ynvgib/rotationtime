import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:fibonacci/fibonacci.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:finallyicanlearn/services/rotatewidgets.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class RotateSimple extends StatefulWidget {
  const RotateSimple({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleState();
  }
}

//class _RotateSimpleState extends State<RotateSimple> {
class _RotateSimpleState extends State<RotateSimple>
    with SingleTickerProviderStateMixin {
  // added tree

  double _progress = 0.01;
  late Animation<double> animation;
  late AnimationController controller;
  // end tree

  final CarouselSliderController _controllerone = CarouselSliderController(),
      _controllerplant = CarouselSliderController(),
      _controllerimages = CarouselSliderController(),
      _controllernew = CarouselSliderController();

  final rtScrollController = ScrollController();

  final TextEditingController _controllertoptext = TextEditingController(),
      _controllerbottomtext = TextEditingController(),
      _controllerichingtext = TextEditingController(),
      _controllerlettext = TextEditingController(),
      _controllernumtext = TextEditingController(),
      _controllercointext = TextEditingController(),
      _controllercoinnumber = TextEditingController(),
      _controllerfibo = TextEditingController();

  //final String _title = subtitles[3];
  //final String _title = subtitles_heb[3];
  final String _title = 'פשוט';

  int _currenttop = 0,
      _currentmid = 0,
      _currentbot = 0,
      _chosenhex = 1,
      _textHexValueChange = 1,
      _fontindex = 0,
      _fonthexconverted = 0,
      gatcolorstate = 0,
      _currentevolution = 0;
  //_hexagramVal = 0;

  Color cardcolor = Colors.black,
      codoncolor = Colors.white,
      pickedcolor = Colors.white,
      currentcolor = Colors.green,
      headcolor = Colors.green,
      ajnacolor = Colors.green,
      throatcolor = Colors.green,
      gcolor = Colors.green,
      heartcolor = Colors.green,
      spleencolor = Colors.green,
      sacralcolor = Colors.green,
      solarcolor = Colors.green,
      rootcolor = Colors.green,
      maintextcolor = Colors.green,
      controlbottxtcolor = Colors.green;

  List<Color> simplewgscolor = reversedtopcoincolor;

  void changeColor(Color color) => setState(() => currentcolor = color);

  final CarouselSliderController _controllertop = CarouselSliderController(),
      _controllermid = CarouselSliderController(),
      _controllerbot = CarouselSliderController(),
      _controlEvolutionContainerSlider = CarouselSliderController(),
      _controllercamel = CarouselSliderController(),
      _controllerdog = CarouselSliderController(),
      _controlleroctopus = CarouselSliderController(),
      _controlleroctopussy = CarouselSliderController(),
      _controllerbitch = CarouselSliderController(),
      _controllerpussycat = CarouselSliderController();

  var _dropdownvalue = hexagramslist[1],
      //_dropdowichingvalue = fontHexOrderList[0],
      _dropdowichingvalue = fontWheelHexOrderList[0],
      _dropdowichingordervalue = orderHexagramsWheel[0];

  List<int> _hexalignedList = [0, 0, 0];

  List<int> gatestatelist = List.filled(65, 0, growable: false);
  final List<bool> _isBoldList = List<bool>.filled(65, false, growable: false);

  int headstate = 3,
      ajnastate = 3,
      throatstate = 3,
      gstate = 3,
      sacralstate = 3,
      rootstate = 3,
      heartstate = 3,
      spleenstate = 3,
      solarstate = 3,
      wallet = 1;

  double screenwidth = 1,
      screenheight = 1,
      opacityLevel = 1.0,
      opacityLevelFigures = 1.0;
  Offset _offset = Offset.zero;

  //String mainText = ';זה לא אני תמנונירוק', chartText = 'מפה רואים בחוץ ובפנים';
  String mainText = ';פשוט', chartText = 'מפה רואים בחוץ ובפנים';
  bool isMainText = true, isChartText = true;

  @override
  void dispose() {
    // Dispose of all controllers specific to this screen
    // Example: _controllerone.dispose(); _controllertoptext.dispose(); etc.
    _controllertoptext.dispose();
    _controllerbottomtext.dispose();
    _controllerichingtext.dispose();
    _controllerlettext.dispose();
    _controllernumtext.dispose();
    _controllercointext.dispose();
    _controllercoinnumber.dispose();
    _controllerfibo.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            toolbarHeight: 40,
            //elevation: 100,
            title: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage(coins4lst[1]),
                ),
              ],
            ),
            leading: IconButton(
              iconSize: 25,
              icon: const Icon(Icons.close, color: Colors.green),
              onPressed: () => Navigator.of(context).pop(),
            ),
            //backgroundColor: Colors.green.withValues(alpha:0.3)
            backgroundColor: Colors.transparent),
        //backgroundColor: Colors.green),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/camog/zbgreenoctopus.png',
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                InkWell(
                  child: AutoSizeText(
                    mainText,
                    textAlign: TextAlign.center,
                    minFontSize: 55,
                    maxFontSize: 65,
                    style: TextStyle(color: maintextcolor),
                  ),
                  onTap: () {
                    isMainText = !isMainText;
                    setState(() {
                      isMainText == true
                          ? mainText = "חרדה חדרה"
                          : mainText = "men tall";
                    });
                  },
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 70.0,
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerone,
                    options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indextop, reason) {
                          setState(() {
                            _currenttop = indextop;
                            //_controllertoptext.text = bimboxlist[indextop];
                            //_controllerbottomtext.text = hexNamesList[indextop];
                            _controllerbottomtext.text =
                                sacralnamelist[indextop];
                            mainText = coinsHebMark4lst[indextop];
                            maintextcolor = coincolors4lst[indextop];
                            controlbottxtcolor = coincolors4lst[indextop];
                          });
                        }),
                  ),
                ),
                SizedBox(
                    width: screenwidth / 0.8,
                    child: AutoSizeTextField(
                      minLines: 1,
                      maxLines: 2,
                      minFontSize: 45,
                      fullwidth: false,
                      decoration: InputDecoration.collapsed(
                          hintText: sacralnamelist[1],
                          //hintText: hexNamesList[1],
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: controlbottxtcolor,
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllerbottomtext,
                      readOnly: false,
                    )),
                const SizedBox(height: 20),

                const SizedBox(height: 30),
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton(
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
                        value: _dropdowichingordervalue,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black),
                        items: orderHexagramsWheelList,
                        onChanged: (int? dropdowichingordervalueChange) {
                          setState(() {
                            _dropdowichingordervalue =
                                dropdowichingordervalueChange!;

                            _chosenhex = _dropdowichingordervalue;
                            _hexalignedList = hexagramAlignment(_chosenhex);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);

                            _controllercoinnumber.text = _chosenhex.toString();
                            wallet = _chosenhex;
                          });
                        },
                      ),
                      DropdownButton(
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
                        value: _dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black),
                        items: hexDropDownNumbersList,
                        onChanged: (int? dropdownvalueChange) {
                          setState(() {
                            _dropdownvalue = dropdownvalueChange!;

                            _chosenhex = _dropdownvalue;
                            _hexalignedList = hexagramAlignment(_chosenhex);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);

                            _controllercoinnumber.text = _chosenhex.toString();
                            wallet = _chosenhex;
                          });
                        },
                      ),
                      DropdownButton(
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
                        value: _dropdowichingvalue,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black),
                        items: fontHexList,
                        onChanged: (String? dropdowichingvalueChange) {
                          setState(() {
                            _dropdowichingvalue = dropdowichingvalueChange!;
                            _fontindex = fontHexOrderList.indexWhere(
                                (element) => element == _dropdowichingvalue);
                            _fonthexconverted = fontHexNumbersList[_fontindex];

                            _chosenhex = _fonthexconverted;
                            _hexalignedList = hexagramAlignment(_chosenhex);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);

                            _controllercoinnumber.text = _chosenhex.toString();
                            wallet = _chosenhex;
                          });
                        },
                      ),
                      Container(
                        width: 30,
                        alignment: Alignment.center,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (String? textHexValueChange) {
                            setState(() {
                              _textHexValueChange =
                                  int.parse(textHexValueChange!);

                              _chosenhex = _textHexValueChange;
                              _hexalignedList = hexagramAlignment(_chosenhex);
                              _controllertop.jumpToPage(_hexalignedList[0]);
                              _controllermid.jumpToPage(_hexalignedList[1]);
                              _controllerbot.jumpToPage(_hexalignedList[2]);

                              _controllercoinnumber.text =
                                  _chosenhex.toString();
                              wallet = _chosenhex;
                            });
                          },
                        ),
                      ),
                    ]),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        foregroundImage: AssetImage(
                          'assets/camog/greendog.png',
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildWalletPopUp(context, wallet),
                        );
                      },
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: AutoSizeTextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey),
                          //contentPadding: EdgeInsets.only(left: 30),
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'iChing',
                        ),
                        controller: _controllercoinnumber,
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight * 0.2,
                    maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: mainSlider,
                    carouselController: _controllertop,
                    options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indextop, reason) {
                          setState(() {
                            _currenttop = indextop;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight * 0.2,
                    maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: mainSlider,
                    carouselController: _controllermid,
                    options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexmid, reason) {
                          setState(() {
                            _currentmid = indexmid;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight * 0.2,
                    maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: mainSlider,
                    carouselController: _controllerbot,
                    options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexbot, reason) {
                          setState(() {
                            _currentbot = indexbot;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight / 7.5,
                    //maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: sixSlider,
                    carouselController: _controllercamel,
                    options: CarouselOptions(
                        initialPage: 5,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 3,
                        onPageChanged: (indextop, reason) {
                          setState(() {
                            _currenttop = indextop;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight / 7.5,
                    //maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: sixSlider,
                    carouselController: _controllerdog,
                    options: CarouselOptions(
                        initialPage: 4,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 3,
                        onPageChanged: (indexmid, reason) {
                          setState(() {
                            _currentmid = indexmid;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight / 7.5,
                    //maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: sixSlider,
                    carouselController: _controlleroctopus,
                    options: CarouselOptions(
                        initialPage: 3,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 3,
                        onPageChanged: (indexbot, reason) {
                          setState(() {
                            _currentbot = indexbot;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight / 7.5,
                    //maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: sixSlider,
                    carouselController: _controlleroctopussy,
                    options: CarouselOptions(
                        initialPage: 8,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 3,
                        onPageChanged: (indextop, reason) {
                          setState(() {
                            _currenttop = indextop;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight / 7.5,
                    //maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: sixSlider,
                    carouselController: _controllerbitch,
                    options: CarouselOptions(
                        initialPage: 7,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 3,
                        onPageChanged: (indexmid, reason) {
                          setState(() {
                            _currentmid = indexmid;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight / 7.5,
                    //maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: sixSlider,
                    carouselController: _controllerpussycat,
                    options: CarouselOptions(
                        initialPage: 6,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 3,
                        onPageChanged: (indexbot, reason) {
                          setState(() {
                            _currentbot = indexbot;
                          });
                        }),
                  ),
                ),

                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                build4PopUp(context),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        child: const Text('4',
                            style: TextStyle(color: Colors.white))),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                build36PopUp(context),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        child: const Text('36',
                            style: TextStyle(color: Colors.white))),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                build64PopUp(context),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        child: const Text('64',
                            style: TextStyle(color: Colors.white))),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                build384PopUp(context),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        child: const Text('384',
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                // HD CHART
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Slider(
                        value: opacityLevel,
                        min: 0,
                        max: 1,
                        //divisions: values.length - 1,
                        //label: opacityLevel.toString(),
                        activeColor: Colors.green,
                        inactiveColor: Colors.yellow,
                        onChanged: (double value) {
                          setState(() {
                            opacityLevel = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Slider(
                        value: opacityLevelFigures,
                        min: 0,
                        max: 1,
                        //divisions: values.length - 1,
                        //label: opacityLevel.toString(),
                        activeColor: Colors.green,
                        inactiveColor: Colors.yellow,
                        onChanged: (double value) {
                          setState(() {
                            opacityLevelFigures = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      cardcolor = cardcolor == Colors.black
                          ? Colors.black.withValues(alpha: 0.2)
                          : Colors.black;

                      //timecolor = timecolor == Colors.white ?
                      //Colors.black :
                      //Colors.white;
                    });
                  },
                  child: Container(
                    width: 350,
                    height: 608,
                    decoration: BoxDecoration(
                      color: cardcolor,
                      border: Border.all(
                        color: Colors.blue,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Opacity(
                      opacity: opacityLevel,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 100, top: 80),
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(90 / 360),
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[10]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 85,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 100, bottom: 135),
                              child: Transform.rotate(
                                angle: -0.60,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[34]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 140,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(left: 35, top: 168),
                              child: Transform.rotate(
                                angle: -1.81,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[26]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 110,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 166, top: 217),
                              child: Transform.rotate(
                                angle: -1.81,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[44]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 110,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 115, top: 192),
                              child: Transform.rotate(
                                angle: 0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[16]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 123,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 243, top: 295),
                              child: Transform.rotate(
                                angle: 0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[48]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 125,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(left: 78, top: 87),
                              child: Transform.rotate(
                                angle: -0.8,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[25]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 20,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 105, top: 113),
                              child: Transform.rotate(
                                angle: -0.8,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[51]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 20,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 234, top: 215),
                              child: Transform.rotate(
                                angle: -0.64,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[37]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 25,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 208, top: 180),
                              child: Transform.rotate(
                                angle: -0.64,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[40]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 25,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 82, bottom: 50),
                              child: Transform.rotate(
                                angle: -0.42,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[45]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 65,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(left: 122, top: 40),
                              child: Transform.rotate(
                                angle: -0.42,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[21]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 50,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 120, top: 224),
                              child: Transform.rotate(
                                angle: 0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[20]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 123,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 242, top: 328),
                              child: Transform.rotate(
                                angle: 0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[57]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 115,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 121, top: 188),
                              child: Transform.rotate(
                                angle: -0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[35]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 123,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 246, top: 290),
                              child: Transform.rotate(
                                angle: -0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[36]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 123,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 121, top: 215),
                              child: Transform.rotate(
                                angle: -0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[12]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 123,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 239, top: 315),
                              child: Transform.rotate(
                                angle: -0.55,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[22]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 115,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 208, bottom: 98),
                              child: Transform.rotate(
                                angle: -1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[32]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 70,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 211, bottom: 84),
                              child: Transform.rotate(
                                angle: -1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[28]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 70,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 229, bottom: 69),
                              child: Transform.rotate(
                                angle: -1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[18]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 80,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 100, bottom: 62),
                              child: Transform.rotate(
                                angle: -1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[54]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 80,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 100, bottom: 47),
                              child: Transform.rotate(
                                angle: -1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[38]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 80,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 100, bottom: 32),
                              child: Transform.rotate(
                                angle: -1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[58]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 80,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 104, bottom: 59),
                              child: Transform.rotate(
                                angle: 1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[19]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 75,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 104, bottom: 44),
                              child: Transform.rotate(
                                angle: 1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[39]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 75,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 104, bottom: 29),
                              child: Transform.rotate(
                                angle: 1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[41]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 75,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 235, bottom: 94),
                              child: Transform.rotate(
                                angle: 1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[49]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 80,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 235, bottom: 79),
                              child: Transform.rotate(
                                angle: 1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[55]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 80,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 235, bottom: 64),
                              child: Transform.rotate(
                                angle: 1.05,
                                child: CustomPaint(
                                  foregroundPainter: VerticalGatePainter(
                                      gatestate: gatestatelist[30]),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 80,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Transform.rotate(
                                  angle: 0.1,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 110.0, left: 155.0),
                                    child: InkWell(
                                        child: CustomPaint(
                                          foregroundPainter: HeartPainter(
                                              centerstate: heartstate,
                                              pickcolor: heartcolor),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 50,
                                            width: 72,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            heartcolor = pickedcolor;
                                            if (heartstate != 7) {
                                              heartstate = 7;
                                            } else {
                                              heartstate = 3;
                                            }
                                          });
                                        }),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 137, top: 105),
                                  child: Text(
                                    '21',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[21]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[21]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 103, top: 152),
                                  child: Text(
                                    '26',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[26]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[26]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 124, top: 130),
                                  child: Text(
                                    '51',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[51]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[51]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 170, top: 158),
                                  child: Text(
                                    '40',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[40]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[40]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // solar

                          Flex(
                            direction: Axis.vertical,
                            children: [
                              const SizedBox(height: 10),
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                      height: 70,
                                      width: 80,
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            child: CustomPaint(
                                              foregroundPainter: HeadPainter(
                                                  centerstate: headstate,
                                                  pickcolor: headcolor),
                                              //centercolorstate: headcolorstate),
                                              willChange: true,
                                              child: const SizedBox(
                                                height: 70,
                                                width: 80,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                headcolor = pickedcolor;
                                                //if (headstate < 7) {
                                                if (headstate != 7) {
                                                  headstate = 7;
                                                } else {
                                                  headstate = 3;
                                                }
                                              });
                                            },
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              width: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    '64',
                                                    style: TextStyle(
                                                        backgroundColor:
                                                            _isBoldList[64]
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent,
                                                        fontSize:
                                                            11, // gatefont
                                                        fontWeight:
                                                            _isBoldList[64]
                                                                ? FontWeight
                                                                    .bold
                                                                : FontWeight
                                                                    .normal),
                                                  ),
                                                  Text(
                                                    '61',
                                                    style: TextStyle(
                                                        backgroundColor:
                                                            _isBoldList[61]
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent,
                                                        fontSize:
                                                            11, // gatefont
                                                        fontWeight:
                                                            _isBoldList[61]
                                                                ? FontWeight
                                                                    .bold
                                                                : FontWeight
                                                                    .normal),
                                                  ),
                                                  Text(
                                                    '63',
                                                    style: TextStyle(
                                                        backgroundColor:
                                                            _isBoldList[63]
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent,
                                                        fontSize:
                                                            11, // gatefont
                                                        fontWeight:
                                                            _isBoldList[63]
                                                                ? FontWeight
                                                                    .bold
                                                                : FontWeight
                                                                    .normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PositionedDirectional(
                                    start: 40,
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/coins/camel.png',
                                            ),
                                            opacity: 1.0),
                                      ),
                                    ),
                                  ),
                                  PositionedDirectional(
                                    start: 270,
                                    child: IconButton(
                                      icon: CircleAvatar(
                                          //minRadius: 5,
                                          maxRadius: 20,
                                          foregroundImage:
                                              AssetImage(coins4lst[1])),
                                      tooltip: 'פשוט',
                                      onPressed: () {
                                        setState(() {
                                          _resetgatesState();
                                          _resetcentersState();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              // head gates
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[64]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[61]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[63]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                ],
                              ),
                              //ajna gates
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[47]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[24]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[4]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                ],
                              ),
                              // ajna
                              SizedBox(
                                height: 80,
                                child: Stack(
                                  children: [
                                    //ajna gates
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CustomPaint(
                                            foregroundPainter:
                                                VerticalGatePainter(
                                                    gatestate:
                                                        gatestatelist[17]),
                                            willChange: true,
                                            child: const SizedBox(
                                              height: 60,
                                              width: 5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          CustomPaint(
                                            foregroundPainter:
                                                VerticalGatePainter(
                                                    gatestate:
                                                        gatestatelist[43]),
                                            willChange: true,
                                            child: const SizedBox(
                                              height: 60,
                                              width: 5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          CustomPaint(
                                            foregroundPainter:
                                                VerticalGatePainter(
                                                    gatestate:
                                                        gatestatelist[11]),
                                            willChange: true,
                                            child: const SizedBox(
                                              height: 60,
                                              width: 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: InkWell(
                                        child: CustomPaint(
                                          foregroundPainter: AjnaPainter(
                                              centerstate: ajnastate,
                                              pickcolor: ajnacolor),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 70,
                                            width: 80,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            ajnacolor = pickedcolor;
                                            //if (ajnastate < 7) {
                                            if (ajnastate < 7) {
                                              ajnastate = 7;
                                            } else {
                                              ajnastate = 3;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    PositionedDirectional(
                                      start: 50,
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/camog/dog.png',
                                              ),
                                              opacity: 1.0),
                                        ),
                                      ),
                                    ),

                                    PositionedDirectional(
                                      start: 270,
                                      child: IconButton(
                                        icon: CircleAvatar(
                                            //minRadius: 5,
                                            maxRadius: 20,
                                            foregroundImage:
                                                AssetImage(coins4lst[2])),
                                        tooltip: 'נשימה',
                                        onPressed: () {
                                          setState(() {
                                            setBreathChart();
                                          });
                                        },
                                      ),
                                    ),

                                    Center(
                                      child: SizedBox(
                                        width: 50,
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                '47',
                                                style: TextStyle(
                                                    backgroundColor:
                                                        _isBoldList[47]
                                                            ? Colors.white
                                                            : Colors
                                                                .transparent,
                                                    fontSize: 11, // gatefont
                                                    fontWeight: _isBoldList[47]
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4),
                                                child: Text(
                                                  '24',
                                                  style: TextStyle(
                                                      backgroundColor:
                                                          _isBoldList[24]
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                      fontSize: 11, // gatefont
                                                      fontWeight:
                                                          _isBoldList[24]
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 2.0),
                                                child: Text(
                                                  '4',
                                                  style: TextStyle(
                                                      backgroundColor:
                                                          _isBoldList[4]
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                      fontSize: 11, // gatefont
                                                      fontWeight: _isBoldList[4]
                                                          ? FontWeight.bold
                                                          : FontWeight.normal),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: 90,
                                        margin: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '17',
                                              style: TextStyle(
                                                  backgroundColor:
                                                      _isBoldList[17]
                                                          ? Colors.white
                                                          : Colors.transparent,
                                                  fontSize: 11, // gatefont
                                                  fontWeight: _isBoldList[17]
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            ),
                                            Text(
                                              '11',
                                              style: TextStyle(
                                                  backgroundColor:
                                                      _isBoldList[11]
                                                          ? Colors.white
                                                          : Colors.transparent,
                                                  fontSize: 11, // gatefont
                                                  fontWeight: _isBoldList[11]
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: 90,
                                        margin: const EdgeInsets.fromLTRB(
                                            80, 0, 2, 20),
                                        child: Text(
                                          '43',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[43]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[43]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //throat gates
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[62]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 15,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[23]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 15,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[56]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 15,
                                      width: 5,
                                    ),
                                  ),
                                ],
                              ),
                              // throat
                              Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.center,
                                    child: InkWell(
                                        child: CustomPaint(
                                          foregroundPainter: ThroatPainter(
                                              centerstate: throatstate,
                                              pickcolor: throatcolor),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 72,
                                            width: 72,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            throatcolor = pickedcolor;
                                            //if (throatstate < 7) {
                                            if (throatstate != 7) {
                                              throatstate = 7;
                                            } else {
                                              throatstate = 3;
                                            }
                                          });
                                        }),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                      width: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '62',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[62]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[62]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                          Text(
                                            '23',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[23]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[23]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                          Text(
                                            '56',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[56]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[56]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 63,
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 12, 1, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '16',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[16]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[16]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                          Text(
                                            '35',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[35]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[35]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 63,
                                      //margin: const EdgeInsets.only(top: 30),
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 28, 1, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '20',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[20]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[20]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                          Text(
                                            '12',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[12]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[12]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 45,
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 55, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '31',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[31]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[31]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                          Text(
                                            '8',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[8]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[8]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                          Text(
                                            '33',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[33]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[33]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 20,
                                      margin: const EdgeInsets.only(
                                          top: 43, left: 56),
                                      child: Text(
                                        '45',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[45]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[45]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // throat gates
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[31]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 20,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[8]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 20,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[33]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 20,
                                      width: 5,
                                    ),
                                  ),
                                ],
                              ),
                              // g gates

                              SizedBox(
                                height: 100,
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomPaint(
                                          foregroundPainter:
                                              VerticalGatePainter(
                                                  gatestate: gatestatelist[7]),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 40,
                                            width: 5,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        CustomPaint(
                                          foregroundPainter:
                                              VerticalGatePainter(
                                                  gatestate: gatestatelist[1]),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 40,
                                            width: 5,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        CustomPaint(
                                          foregroundPainter:
                                              VerticalGatePainter(
                                                  gatestate: gatestatelist[13]),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 40,
                                            width: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: 40,
                                            margin:
                                                const EdgeInsets.only(top: 70),
                                            child: CustomPaint(
                                              foregroundPainter:
                                                  VerticalGatePainter(
                                                      gatestate:
                                                          gatestatelist[15]),
                                              willChange: true,
                                              child: const SizedBox(
                                                height: 40,
                                                width: 5,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: 30,
                                            margin:
                                                const EdgeInsets.only(top: 80),
                                            child: CustomPaint(
                                              foregroundPainter:
                                                  VerticalGatePainter(
                                                      gatestate:
                                                          gatestatelist[2]),
                                              willChange: true,
                                              child: const SizedBox(
                                                height: 30,
                                                width: 5,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: 40,
                                            margin:
                                                const EdgeInsets.only(top: 70),
                                            child: CustomPaint(
                                              foregroundPainter:
                                                  VerticalGatePainter(
                                                      gatestate:
                                                          gatestatelist[46]),
                                              willChange: true,
                                              child: const SizedBox(
                                                height: 40,
                                                width: 5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                          child: CustomPaint(
                                            foregroundPainter: GPainter(
                                                centerstate: gstate,
                                                pickcolor: gcolor),
                                            willChange: true,
                                            child: const SizedBox(
                                              height: 84,
                                              width: 84,
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              gcolor = pickedcolor;
                                              //if (gstate < 7) {
                                              if (gstate != 7) {
                                                gstate = 7;
                                              } else {
                                                //gstate = 0;
                                                gstate = 3;
                                              }
                                            });
                                          }),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 30, top: 29),
                                        child: Text(
                                          '7',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[7]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[7]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 13),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[1]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[1]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 30, top: 29),
                                        child: Text(
                                          '13',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[13]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[13]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 30, bottom: 29),
                                        child: Text(
                                          '46',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[46]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[46]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 13),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[2]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[2]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 30, bottom: 29),
                                        child: Text(
                                          '15',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[15]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[15]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 54),
                                        child: Text(
                                          '10',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[10]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[10]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 54),
                                        child: Text(
                                          '25',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[25]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[25]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // g to sacral gates
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[5]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 25,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[14]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 25,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[29]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 25,
                                      width: 5,
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 19, right: 78),
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            -78 / 360),
                                        child: CustomPaint(
                                          foregroundPainter:
                                              VerticalGatePainter(
                                                  gatestate: gatestatelist[27]),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 35,
                                            width: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 12, right: 145),
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            -78 / 360),
                                        child: CustomPaint(
                                          foregroundPainter:
                                              VerticalGatePainter(
                                                  gatestate: gatestatelist[50]),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 35,
                                            width: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 23, left: 80),
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            78 / 360),
                                        child: CustomPaint(
                                          foregroundPainter:
                                              VerticalGatePainter(
                                                  gatestate: gatestatelist[59]),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 35,
                                            width: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 16, left: 145),
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            78 / 360),
                                        child: CustomPaint(
                                          foregroundPainter:
                                              VerticalGatePainter(
                                                  gatestate: gatestatelist[6]),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 35,
                                            width: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // sacral

                                  Stack(
                                    children: [
                                      Positioned(
                                        left: 138,
                                        //alignment: Alignment.center,
                                        child: InkWell(
                                            child: CustomPaint(
                                              foregroundPainter: SacralPainter(
                                                  centerstate: sacralstate,
                                                  pickcolor: sacralcolor),
                                              willChange: true,
                                              child: const SizedBox(
                                                height: 62,
                                                width: 65,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                sacralcolor = pickedcolor;
                                                if (sacralstate != 7) {
                                                  sacralstate = 7;
                                                } else {
                                                  sacralstate = 3;
                                                }
                                              });
                                            }),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 35),
                                          child: Text(
                                            '29',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[29]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[29]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          '14',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[14]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[14]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 35),
                                          child: Text(
                                            '5',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[5]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[5]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 35, top: 46),
                                          child: Text(
                                            '9',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[9]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[9]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 46),
                                          child: Text(
                                            '3',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[3]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[3]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 35, top: 46),
                                          child: Text(
                                            '42',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[42]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[42]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 46, top: 14),
                                          child: Text(
                                            '34',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[34]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[34]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 46, top: 30),
                                          child: Text(
                                            '59',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[59]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[59]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 46, top: 30),
                                          child: Text(
                                            '27',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[27]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[27]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // sacral to root gates
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[42]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[3]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[9]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[53]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[60]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
                                        gatestate: gatestatelist[52]),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 10,
                                      width: 5,
                                    ),
                                  ),
                                ],
                              ),

                              // root
                              Stack(
                                children: [
                                  PositionedDirectional(
                                    top: 10,
                                    end: 10,
                                    child: IconButton(
                                      icon: CircleAvatar(
                                          //minRadius: 5,
                                          maxRadius: 20,
                                          foregroundImage:
                                              AssetImage(coins4lst[3])),
                                      tooltip: 'שתיקה',
                                      onPressed: () {
                                        setState(() {
                                          setSilenceChart();
                                        });
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                        child: CustomPaint(
                                          foregroundPainter: RootPainter(
                                              centerstate: rootstate,
                                              pickcolor: rootcolor),
                                          willChange: true,
                                          child: const SizedBox(
                                            height: 65,
                                            width: 65,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            rootcolor = pickedcolor;
                                            if (rootstate != 7) {
                                              rootstate = 7;
                                            } else {
                                              rootstate = 3;
                                            }
                                          });
                                        }),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 35),
                                      child: Text(
                                        '52',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[52]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[52]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      '60',
                                      style: TextStyle(
                                          backgroundColor: _isBoldList[60]
                                              ? Colors.white
                                              : Colors.transparent,
                                          fontSize: 11, // gatefont
                                          fontWeight: _isBoldList[60]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 35),
                                      child: Text(
                                        '53',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[53]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[53]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 45, top: 15),
                                      child: Text(
                                        '54',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[54]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[54]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 45, top: 30),
                                      child: Text(
                                        '38',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[38]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[38]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 45, top: 45),
                                      child: Text(
                                        '58',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[58]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[58]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 45, top: 15),
                                      child: Text(
                                        '19',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[19]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[19]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 45, top: 30),
                                      child: Text(
                                        '39',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[39]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[39]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 45, top: 45),
                                      child: Text(
                                        '41',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[41]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[41]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              PositionedDirectional(
                                top: 230,
                                start: 270,
                                child: IconButton(
                                  icon: CircleAvatar(
                                      //minRadius: 5,
                                      maxRadius: 20,
                                      foregroundImage:
                                          AssetImage(coins4lst[0])),
                                  tooltip: 'מורכב',
                                  onPressed: () {
                                    setState(() {
                                      setComplexChart();
                                    });
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 240, bottom: 120),
                                  child: InkWell(
                                      child: CustomPaint(
                                        foregroundPainter: SolarPainter(
                                            centerstate: solarstate,
                                            pickcolor: solarcolor),
                                        willChange: true,
                                        child: const SizedBox(
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          solarcolor = pickedcolor;
                                          //if (solarstate < 7) {
                                          if (solarstate != 7) {
                                            //solarstate++;
                                            solarstate = 7;
                                          } else {
                                            solarstate = 3;
                                          }
                                        });
                                      }),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 204, bottom: 153),
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[6]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[6]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 251, bottom: 142),
                                  child: Text(
                                    '49',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[49]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[49]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 251, bottom: 164),
                                  child: Text(
                                    '37',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[37]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[37]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 303, bottom: 178),
                                  child: Text(
                                    '36',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[36]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[36]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 303, bottom: 130),
                                  child: Text(
                                    '30',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[30]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[30]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 277, bottom: 170),
                                  child: Text(
                                    '22',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[22]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[22]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 277, bottom: 136),
                                  child: Text(
                                    '55',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[55]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[55]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 240, bottom: 120),
                                  child: InkWell(
                                      child: CustomPaint(
                                        foregroundPainter: SpleenPainter(
                                            centerstate: spleenstate,
                                            pickcolor: spleencolor),
                                        willChange: true,
                                        child: const SizedBox(
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          spleencolor = pickedcolor;
                                          if (spleenstate != 7) {
                                            spleenstate = 7;
                                          } else {
                                            spleenstate = 3;
                                          }
                                        });
                                      }),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 204, bottom: 153),
                                  child: Text(
                                    '50',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[50]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[50]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 251, bottom: 142),
                                  child: Text(
                                    '32',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[32]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[32]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 251, bottom: 164),
                                  child: Text(
                                    '44',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[44]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[44]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 303, bottom: 178),
                                  child: Text(
                                    '48',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[48]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[48]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 303, bottom: 130),
                                  child: Text(
                                    '18',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[18]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[18]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 277, bottom: 170),
                                  child: Text(
                                    '57',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[57]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[57]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 277, bottom: 136),
                                  child: Text(
                                    '28',
                                    style: TextStyle(
                                        backgroundColor: _isBoldList[28]
                                            ? Colors.white
                                            : Colors.transparent,
                                        fontSize: 11, // gatefont
                                        fontWeight: _isBoldList[28]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 20,
                              height: 20,
                              margin:
                                  const EdgeInsets.only(top: 72, right: 180),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.black,
                                  ),
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const AutoSizeText('I',
                                  textAlign: TextAlign.center,
                                  minFontSize: 6,
                                  maxFontSize: 10,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          PositionedDirectional(
                            start: 10,
                            bottom: 40,
                            child: IconButton(
                                icon: const CircleAvatar(
                                    //minRadius: 5,
                                    maxRadius: 20,
                                    foregroundImage: AssetImage(
                                        'assets/coins/fullcoins.png')),
                                tooltip: 'צבע לבחור',
                                onPressed: () {
                                  showDialog(
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('צבע לבחור'),
                                      content: SingleChildScrollView(
                                        child: HueRingPicker(
                                          pickerColor: currentcolor,
                                          onColorChanged: changeColor,
                                          enableAlpha: true,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text('נצבע'),
                                          onPressed: () {
                                            //setState(() => pickedcolor = currentcolor);
                                            pickedcolor = currentcolor;
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                    context: context,
                                  );
                                }),
                          ),

                          Opacity(
                            opacity: opacityLevelFigures,
                            child: Stack(
                              children: [
                                PositionedDirectional(
                                  start: 180,
                                  child: Opacity(
                                    opacity: opacityLevelFigures,
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/family/fgrampa6nbg.png',
                                            ),
                                            opacity: 1.0),
                                      ),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 180,
                                  top: 90,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/camog/zbgreenoctopus.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 180,
                                  top: 180,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/camog/elephantclock.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 100,
                                  top: 295,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/camog/zbyellowoctopussy.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 135,
                                  top: 370,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/camog/zbredog.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 180,
                                  top: 480,
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/family/agranny1nbg.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 240,
                                  top: 380,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/camog/zbwhitecamel.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 40,
                                  top: 380,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/camog/zblackcat.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  start: 215,
                                  top: 295,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/camog/zbluedog.png',
                                          ),
                                          opacity: 1.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PositionedDirectional(
                            start: 10,
                            bottom: 4,
                            child: Container(
                              height: 33,
                              width: 320,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //border: Border.all(
                                // color: Colors.blue,
                                // width: 4,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                child: AutoSizeText(
                                  chartText,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  isChartText = !isChartText;
                                  setState(() {
                                    isChartText == true
                                        ? chartText = "מפה רואים בחוץ ובפנים"
                                        : chartText = "English Outglitch";
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 300,
                  width: 300,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 8, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    padding:
                        const EdgeInsets.all(8.0), // padding around the grid
                    itemCount: 64, // total number of items
                    itemBuilder: (context, index) {
                      return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: _isBoldList[index + 1]
                                    ? Colors.black
                                    : Colors.white,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            child: Center(
                              child: Text((index + 1).toString(),
                                  style: TextStyle(
                                      color: _isBoldList[index + 1]
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if (gatestatelist[index + 1] == 0) {
                                _isBoldList[index + 1] =
                                    !_isBoldList[index + 1];
                                gatestatelist[index + 1]++;
                                //&&
                              } else {
                                if (gatestatelist[index + 1] == 8) {
                                  gatestatelist[index + 1] = 0;
                                  _isBoldList[index + 1] =
                                      !_isBoldList[index + 1];
                                } else {
                                  gatestatelist[index + 1]++;
                                }
                              }
                            });
                          });
                    },
                  ),
                ),

                SizedBox(
                  height: 250,
                  width: 250,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 5.0, // spacing between rows
                      crossAxisSpacing: 5.0, // spacing between columns
                    ),
                    padding:
                        const EdgeInsets.all(5.0), // padding around the grid
                    itemCount: 9, // total number of items
                    itemBuilder: (context, index) {
                      DesignForm designform = designFormsList
                          .firstWhere((df) => df.id == index + 1);
                      List<int> designformGates = designform.gates!;
                      return InkWell(
                          child: Tooltip(
                            message:
                                designform.name! + "\n" + designform.orient!,
                            child: Container(
                              width: 55,
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Colors.black)),
                              child: Center(
                                //child: Text((hdZBCodonName[index]),
                                child: Text((designform.zbname!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              for (final formgate in designformGates) {
                                int tempformgate = formgate;

                                if (gatestatelist[tempformgate] == 0) {
                                  _isBoldList[tempformgate] =
                                      !_isBoldList[tempformgate];
                                  //gatestatelist[tmpcod]++;
                                  gatestatelist[tempformgate] = 1;
                                  //&&
                                } else {
                                  //if (gatestatelist[tmpcod] == 9) {
                                  //if (gatestatelist[tmpcod] != 0) {
                                  gatestatelist[tempformgate] = 0;
                                  _isBoldList[tempformgate] =
                                      !_isBoldList[tempformgate];
                                  //} else {
                                  // gatestatelist[tmpcod]++;
                                  // }
                                }
                              }
                            });
                          });
                    },
                  ),
                ),

                SizedBox(
                  height: 300,
                  width: 300,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 5, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    padding:
                        const EdgeInsets.all(8.0), // padding around the grid
                    itemCount: 21, // total number of items
                    itemBuilder: (context, index) {
                      Codon codon =
                          codonLst.firstWhere((cd) => cd.id == index + 1);
                      List<int> codongates = codon.gates!;
                      var codonslist = codongates.join(', ');
                      return InkWell(
                          child: Tooltip(
                            message: codon.name! + ': ' + codonslist,
                            child: Container(
                              width: 35,
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Colors.black)),
                              child: Center(
                                //child: Text((hdZBCodonName[index]),
                                child: Text((codon.zbname!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              for (final cod in codongates) {
                                int tmpcod = cod;

                                if (gatestatelist[tmpcod] == 0) {
                                  _isBoldList[tmpcod] = !_isBoldList[tmpcod];
                                  //gatestatelist[tmpcod]++;
                                  gatestatelist[tmpcod] = 1;
                                  //&&
                                } else {
                                  //if (gatestatelist[tmpcod] == 9) {
                                  //if (gatestatelist[tmpcod] != 0) {
                                  gatestatelist[tmpcod] = 0;
                                  _isBoldList[tmpcod] = !_isBoldList[tmpcod];
                                  //} else {
                                  // gatestatelist[tmpcod]++;
                                  // }
                                }
                              }
                            });
                          });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),

                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        foregroundImage: AssetImage(
                          'assets/coins/simple.png',
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildWalletPopUp(context, wallet),
                        );
                      },
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: AutoSizeTextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey),
                          //contentPadding: EdgeInsets.only(left: 30),
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'iChing',
                        ),
                        controller: _controllercoinnumber,
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
                // new wheel
                Stack(
                  children: [
                    CircleList(
                      innerRadius: screenwidth / 60,
                      initialAngle: 3.85,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(12, (index) {
                        return Container(
                          width: 65,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            //color: revZodiacColorList[index],
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                //Colors.purple.shade900,
                                //Colors.purple.shade100,
                                revzodiacGradeColorlist[index * 2],
                                revzodiacGradeColorlist[index * 2 + 1],
                              ],
                            ),
                            image: DecorationImage(
                              image: AssetImage(revZodiacList[index]),
                              fit: BoxFit.scaleDown,
                            ),
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 60 + 80,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(64, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: reversedbotcoincolor[index],
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 60 + 110,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(64, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: reversedmidcoincolor[index],
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: screenwidth / 60 + 145,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(64, (index) {
                        return InkWell(
                          child: Tooltip(
                            message: reversedHexagramsWheel[index].toString(),
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.white),
                            child: Container(
                              width: 20,
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  //color: reversedtopcoincolor[index],
                                  color: simplewgscolor[index],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 0.5, color: Colors.black)),
                              child: AutoSizeText(
                                  reversedHexagramsWheel[index].toString(),
                                  minFontSize: 8,
                                  maxFontSize: 12,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          onTap: () {
                            wallet = reversedHexagramsWheel[index];
                            _controllercoinnumber.text = wallet.toString();
                            _controllerfibo.text =
                                Fibonacci.printSeries(size: wallet).toString();
                            setState(() {
                              _chosenhex = wallet;
                              _hexalignedList = hexagramAlignment(_chosenhex);
                              _controllertop.jumpToPage(_hexalignedList[0]);
                              _controllermid.jumpToPage(_hexalignedList[1]);
                              _controllerbot.jumpToPage(_hexalignedList[2]);
                            });
                          },
                        );
                      }),
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: AutoSizeTextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey),
                          //contentPadding: EdgeInsets.only(left: 30),
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'iChing',
                        ),
                        controller: _controllerfibo,
                        readOnly: true,
                        maxFontSize: 25,
                      ),
                    ),
                  ],
                ),
                CircleList(
                  innerRadius: screenwidth / 10,
                  initialAngle: 3.85,
                  childrenPadding: 0.1,
                  origin: const Offset(0, 0),
                  children: List.generate(12, (index) {
                    return Tooltip(
                      message: revzodiacNameHeblist[index] +
                          "\n" +
                          revzodiacNamelist[index],
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 90,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          //color: revZodiacColorList[index],
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              //Colors.purple.shade900,
                              //Colors.purple.shade100,
                              revzodiacGradeColorlist[index * 2],
                              revzodiacGradeColorlist[index * 2 + 1],
                            ],
                          ),
                          image: DecorationImage(
                            image: AssetImage(revZodiacList[index]),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                // 64 coins wheel
                Stack(
                  children: [
                    CircleList(
                      innerRadius: screenwidth / 60,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: coincolors[0],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 12 + 10,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: revmidyangcolor[index],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: screenwidth / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: Container(
                        width: 100,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1)),
                            child: Image.asset(zoo4lst[0])),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: revtopyangcolor[index],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            child: AutoSizeText(
                                reversedHexagramsWheel[index + 48].toString(),
                                minFontSize: 20,
                                //maxFontSize: 85,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                                reversedHexagramsWheel[index + 48]);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);
                          },
                        );
                      }),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    CircleList(
                      innerRadius: screenwidth / 60,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: coincolors[1],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 12 + 10,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: revmidyangcolor[index],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: screenwidth / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: Container(
                        width: 100,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1)),
                            child: Image.asset(zoo4lst[1])),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: revtopyangcolor[index],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            child: AutoSizeText(
                                reversedHexagramsWheel[index + 32].toString(),
                                minFontSize: 20,
                                //maxFontSize: 85,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                                reversedHexagramsWheel[index + 32]);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);
                          },
                        );
                      }),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    CircleList(
                      innerRadius: screenwidth / 60,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: coincolors[2],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 12 + 10,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: midyangcolor[index],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: screenwidth / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: Container(
                        width: 100,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1)),
                            child: Image.asset(zoo4lst[2])),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: topyangcolor[index],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            child: AutoSizeText(
                                reversedHexagramsWheel[index].toString(),
                                minFontSize: 20,
                                //maxFontSize: 85,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                                reversedHexagramsWheel[index]);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);
                          },
                        );
                      }),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    CircleList(
                      innerRadius: screenwidth / 60,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: coincolors[3],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 12 + 10,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: midyangcolor[index],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: screenwidth / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: Container(
                        width: 100,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1)),
                            child: Image.asset(zoo4lst[3])),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: topyangcolor[index],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            child: AutoSizeText(
                                reversedHexagramsWheel[index + 16].toString(),
                                minFontSize: 20,
                                //maxFontSize: 85,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                                reversedHexagramsWheel[index + 16]);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);
                          },
                        );
                      }),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                // 64 coins wheel
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Positioned(
                      top: screenheight / 4,
                      bottom: screenheight / 4,
                      left: screenwidth / 20,
                      right: screenwidth / 20,
                      child: Center(
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '1',
                            hintStyle: TextStyle(color: Colors.white),
                            contentPadding: EdgeInsets.only(left: 30),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 55.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'iChing',
                          ),
                          controller: _controllercointext,
                          readOnly: true,
                        ),
                      ),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 60 + 40,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      rotateMode: RotateMode.stopRotate,
                      children: List.generate(64, (index) {
                        return Container(
                          width: 20,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: reversedbotcoincolor[index],
                            shape: BoxShape.circle,
                          ),
                          child: AutoSizeText(
                            revfontWheelHexOrderList[index],
                            minFontSize: 10,
                            maxFontSize: 15,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              //fontFamily: 'iChing',
                            ),
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: screenwidth / 12 + 60,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(64, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: reversedmidcoincolor[index],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: AutoSizeText(
                              reversedHexagramsWheel[index].toString(),
                              minFontSize: 10,
                              maxFontSize: 12,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: screenwidth / 7 + 80,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      rotateMode: RotateMode.stopRotate,
                      children: List.generate(64, (index) {
                        return InkWell(
                          child: Container(
                            width: 55,
                            margin: const EdgeInsets.all(1),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: AutoSizeText(
                                revfontWheelHexOrderList[index],
                                minFontSize: 10,
                                maxFontSize: 13,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  //color: Colors.white,
                                  color: simplewgscolor[index],
                                  fontFamily: 'iChing',
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            wallet = reversedHexagramsWheel[index];
                            _controllerlettext.text =
                                revfontWheelHexOrderList[index];
                            _controllerichingtext.text =
                                revfontWheelHexOrderList[index];
                            _controllernumtext.text =
                                reversedHexagramsWheel[index].toString();
                            _controllercointext.text =
                                revfontWheelHexOrderList[index];
                          },
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeTextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      minLines: 1,
                      minFontSize: 15,
                      fullwidth: false,
                      decoration: const InputDecoration.collapsed(
                          //hintText: hexNamesList[1],
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        //fontFamily: 'iChing',
                      ),
                      controller: _controllernumtext,
                      readOnly: false,
                    ),
                    AutoSizeTextField(
                      minLines: 1,
                      minFontSize: 15,
                      fullwidth: false,
                      decoration: const InputDecoration.collapsed(
                          //hintText: hexNamesList[1],
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'iChing',
                      ),
                      controller: _controllerichingtext,
                      readOnly: false,
                    ),
                    AutoSizeTextField(
                      minLines: 1,
                      minFontSize: 15,
                      fullwidth: false,
                      decoration: const InputDecoration.collapsed(
                          //hintText: hexNamesList[1],
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        //fontFamily: 'iChing',
                      ),
                      controller: _controllerlettext,
                      readOnly: false,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                Stack(
                  children: [
                    CircleList(
                      innerRadius: screenwidth / 16,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child:
                              Image.asset("assets/coins/fullrotateicon.png")),
                      children: List.generate(16, (index) {
                        return Container(
                          width: 50,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(revbotfourzoonimal[index]),
                              fit: BoxFit.scaleDown,
                            ),
                            //color: revfourbotcoincolor[index],
                            //revbotfourzoonimal
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: screenwidth / 5.5,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 55,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(topfourzoonimal[index]),
                                fit: BoxFit.scaleDown,
                              ),
                              //topfourzoonimal
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          onTap: () {
                            int newindex = index - 0;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  buildGodheadPopUp(context, newindex),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
                const Divider(
                    thickness: 5, indent: 5, endIndent: 5, color: Colors.green),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      height: screenheight / 5,
                      width: screenwidth / 3.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/camog/zbgreencamel.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(
                      height: screenheight / 5,
                      width: screenwidth / 3.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/camog/zbgreencamel.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(
                      height: screenheight / 5,
                      width: screenwidth / 3.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/camog/zbgreencamel.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                ),

                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                const SizedBox(height: 10),
                Container(
                    height: 35,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const AutoSizeText('אבוד-לוציה',
                        textAlign: TextAlign.center,
                        minFontSize: 20,
                        maxFontSize: 25,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                const SizedBox(height: 10),
                // rt evolution
                Container(
                  height: 130,
                  width: 120,
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: evolutionContainerSlider,
                    carouselController: _controlEvolutionContainerSlider,
                    options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: false,
                        enlargeCenterPage: false,
                        aspectRatio: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            //_currenttop = indextop;
                            _currentevolution = index;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 10),
                // rt evolution
                Container(
                  //height: screenheight * 0.9,
                  height: 400,
                  //width: screenwidth,
                  width: 400,
                  decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.green,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(20), // border color
                      image: const DecorationImage(
                        image: AssetImage('assets/coins/rtevolutionnobg.png'),
                        //colorFilter: ColorFilter.mode(
                        //Colors.white.withValues(alpha:1.0),
                        //    BlendMode.modulate,
                        //    )
                      )),
                ),

                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                SizedBox(
                  height: screenheight / 3,
                  width: screenwidth / 1.5,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: screenheight / 4,
                    child: CarouselSlider(
                      items: miximageslider,
                      carouselController: _controllerimages,
                      options: CarouselOptions(
                          initialPage: 1,
                          autoPlay: false,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enlargeCenterPage: true,
                          aspectRatio: 1.3,
                          onPageChanged: (indextop, reason) {
                            setState(() {});
                          }),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: screenheight / 2,
                  width: 350,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    padding:
                        const EdgeInsets.all(8.0), // padding around the grid
                    itemCount: rtimages.length, // total number of items
                    itemBuilder: (context, index) {
                      return InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(rtimages[index]),
                                    colorFilter: ColorFilter.mode(
                                      Colors.white.withValues(alpha: 1.0),
                                      BlendMode.modulate,
                                    ))),
                          ),
                          onTap: () {
                            _controllerimages.jumpToPage(index);
                          });
                    },
                  ),
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),

                Stack(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/mink/minkmentalword.webp',
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 1,
                      end: 1,
                      top: 80,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: 70.0,
                        child: CarouselSlider(
                          items: mixPinkSlider,
                          carouselController: _controllernew,
                          options: CarouselOptions(
                              initialPage: 1,
                              autoPlay: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              enlargeCenterPage: true,
                              aspectRatio: 1.3,
                              onPageChanged: (indextop, reason) {
                                setState(() {
                                  //_currenttop = indextop;
                                  //_controllertoptext.text = bimboxlist[indextop];
                                  //_controllerbottomtext.text = hexNamesList[indextop];
                                  //_controllerbottomtext.text = russianamelist[indextop];
                                  //mainText = puncNamesList[indextop];
                                  //maintextcolor = coincolors4lst[indextop];
                                  //controlbottxtcolor = coincolors4lst[indextop];
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.green,
                  thickness: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const AutoSizeText(
                    'O',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                      fontFamily: 'iChing',
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  setSilenceChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  setBreathChart() {
    gatestatelist[64] = 4;
    gatestatelist[47] = 4;
    gatestatelist[61] = 4;
    gatestatelist[24] = 4;
    gatestatelist[63] = 4;
    gatestatelist[4] = 4;
    gatestatelist[17] = 4;
    gatestatelist[62] = 4;
    gatestatelist[43] = 4;
    gatestatelist[23] = 4;
    gatestatelist[11] = 4;
    gatestatelist[56] = 4;
    gatestatelist[31] = 4;
    gatestatelist[7] = 4;
    gatestatelist[8] = 4;
    gatestatelist[1] = 4;
    gatestatelist[33] = 4;
    gatestatelist[13] = 4;
    gatestatelist[16] = 4;
    gatestatelist[48] = 4;
    gatestatelist[20] = 4;
    gatestatelist[57] = 4;
    gatestatelist[10] = 4;
    gatestatelist[25] = 4;
    gatestatelist[51] = 4;
    gatestatelist[18] = 4;
    gatestatelist[58] = 4;
    gatestatelist[28] = 4;
    gatestatelist[38] = 4;
    gatestatelist[32] = 4;
    gatestatelist[54] = 4;
    gatestatelist[44] = 4;
    gatestatelist[26] = 4;
    gatestatelist[37] = 4;
    gatestatelist[40] = 4;
    gatestatelist[49] = 4;
    gatestatelist[19] = 4;
    gatestatelist[55] = 4;
    gatestatelist[39] = 4;
    gatestatelist[30] = 4;
    gatestatelist[41] = 4;

    _isBoldList[64] = true;
    _isBoldList[47] = true;
    _isBoldList[61] = true;
    _isBoldList[24] = true;
    _isBoldList[63] = true;
    _isBoldList[4] = true;
    _isBoldList[17] = true;
    _isBoldList[62] = true;
    _isBoldList[43] = true;
    _isBoldList[23] = true;
    _isBoldList[11] = true;
    _isBoldList[56] = true;
    _isBoldList[31] = true;
    _isBoldList[7] = true;
    _isBoldList[8] = true;
    _isBoldList[1] = true;
    _isBoldList[33] = true;
    _isBoldList[13] = true;
    _isBoldList[16] = true;
    _isBoldList[48] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[10] = true;
    _isBoldList[25] = true;
    _isBoldList[51] = true;
    _isBoldList[18] = true;
    _isBoldList[58] = true;
    _isBoldList[28] = true;
    _isBoldList[38] = true;
    _isBoldList[32] = true;
    _isBoldList[54] = true;
    _isBoldList[44] = true;
    _isBoldList[26] = true;
    _isBoldList[37] = true;
    _isBoldList[40] = true;
    _isBoldList[49] = true;
    _isBoldList[19] = true;
    _isBoldList[55] = true;
    _isBoldList[39] = true;
    _isBoldList[30] = true;
    _isBoldList[41] = true;

    headstate = 2;
    ajnastate = 2;
    throatstate = 2;
    gstate = 2;
    rootstate = 2;
    heartstate = 2;
    spleenstate = 2;
    solarstate = 2;
  }

  setComplexChart() {
    gatestatelist[45] = 2;
    gatestatelist[21] = 2;
    gatestatelist[35] = 2;
    gatestatelist[36] = 2;
    gatestatelist[12] = 2;
    gatestatelist[22] = 2;

    _isBoldList[45] = true;
    _isBoldList[21] = true;
    _isBoldList[35] = true;
    _isBoldList[36] = true;
    _isBoldList[12] = true;
    _isBoldList[22] = true;

    throatstate = 4;
    solarstate = 4;
    heartstate = 4;
  }

  setformsChart(int design) {
    for (var i = 0; i < designFormsList[design].gates!.length; i++) {
      gatestatelist[designFormsList[design].gates![i]] = 2;
      _isBoldList[designFormsList[design].gates![i]] = true;
    }
  }

  setinanimateChart() {
    for (var i = 0; i < designFormsList[1].gates!.length; i++) {
      gatestatelist[designFormsList[1].gates![i]] = 1;
      _isBoldList[designFormsList[1].gates![i]] = true;
    }
  }

  setcellChart() {
    for (var i = 0; i < designFormsList[2].gates!.length; i++) {
      gatestatelist[designFormsList[1].gates![i]] = 1;
      _isBoldList[designFormsList[1].gates![i]] = true;
    }
  }

  setplantChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  setinsectChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  setbirdReptileFishChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  setmammalChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  setpentaChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  setwaChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  sethumanChart() {
    gatestatelist[34] = 1;
    gatestatelist[5] = 1;
    gatestatelist[14] = 1;
    gatestatelist[29] = 1;
    gatestatelist[42] = 1;
    gatestatelist[3] = 1;
    gatestatelist[9] = 1;
    gatestatelist[59] = 1;
    gatestatelist[27] = 1;

    gatestatelist[10] = 1;
    gatestatelist[20] = 1;
    gatestatelist[57] = 1;
    gatestatelist[15] = 1;
    gatestatelist[2] = 1;
    gatestatelist[46] = 1;
    gatestatelist[53] = 1;
    gatestatelist[60] = 1;
    gatestatelist[52] = 1;
    gatestatelist[6] = 1;
    gatestatelist[50] = 1;

    _isBoldList[34] = true;
    _isBoldList[5] = true;
    _isBoldList[14] = true;
    _isBoldList[29] = true;
    _isBoldList[42] = true;
    _isBoldList[3] = true;
    _isBoldList[9] = true;
    _isBoldList[59] = true;
    _isBoldList[27] = true;

    _isBoldList[10] = true;
    _isBoldList[20] = true;
    _isBoldList[57] = true;
    _isBoldList[15] = true;
    _isBoldList[2] = true;
    _isBoldList[46] = true;
    _isBoldList[53] = true;
    _isBoldList[60] = true;
    _isBoldList[52] = true;
    _isBoldList[6] = true;
    _isBoldList[50] = true;

    throatstate = 1;
    gstate = 1;
    sacralstate = 1;
    rootstate = 1;
    spleenstate = 1;
    solarstate = 1;
  }

  void _resetgatesState() {
    for (var i = 0; i < gatestatelist.length; i++) {
      gatestatelist[i] = 0;
      _isBoldList[i] = false;
    }
  }

  void _resetcentersState() {
    //setState(() {
    headstate = 3;
    ajnastate = 3;
    throatstate = 3;
    gstate = 3;
    sacralstate = 3;
    rootstate = 3;
    heartstate = 3;
    spleenstate = 3;
    solarstate = 3;
    //});
  }

  void _onSliderChanged(double progress) {
    setState(() {
      _progress = progress;
    });
  }
}

class TreePainter extends CustomPainter {
  final double progress;
  static const int _depth = 6;

  TreePainter(this.progress);

  static var degToRed = math.pi / 180.0;
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final lineLength = math.min(size.width, size.height) * 0.035;
    final x = size.width / 2;
    final y = size.height * 0.8;
    _drawTree(canvas, x, y, -90, 90 * progress, _depth, lineLength);
  }

  void _drawTree(Canvas canvas, double x1, double y1, double angle,
      double offset, int depth, double lineLength) {
    if (depth != 0) {
      _paint
        ..strokeWidth = depth * 0.2
        ..color = _colors[(depth % _colors.length)];
      final x2 = x1 + (math.cos(angle * degToRed) * depth * lineLength);
      final y2 = y1 + (math.sin(angle * degToRed) * depth * lineLength);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), _paint);
      _drawTree(canvas, x2, y2, angle - offset, offset, depth - 1, lineLength);
      _drawTree(canvas, x2, y2, angle + offset, offset, depth - 1, lineLength);
      _drawTree(
          canvas, x2, y2, angle + offset + 45, offset, depth - 1, lineLength);
      _drawTree(
          canvas, x2, y2, angle + offset - 65, offset, depth - 1, lineLength);
      _drawTree(
          canvas, x2, y2, angle + offset - 85, offset, depth - 1, lineLength);
      _drawTree(
          canvas, x2, y2, angle + offset + 105, offset, depth - 1, lineLength);
    }
  }

  final _colors = [
    const Color(0xff000000),
    const Color(0xffa19e9e),
    const Color(0xff3a86ff),
    const Color(0xff39ff14),
    const Color(0xfffdfd15),
    const Color(0xffff0000),
  ];

  @override
  bool shouldRepaint(TreePainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
