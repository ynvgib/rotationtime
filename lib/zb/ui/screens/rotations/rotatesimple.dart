import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:fibonacci/fibonacci.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_widgethelpers.dart';
import 'package:finallyicanlearn/zb/ui/zb_helpers.dart';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/zb_data.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_cleanwidgets.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class RotateSimple extends StatefulWidget {
  const RotateSimple({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleState();
  }
}

//class _RotateSimpleState extends State<RotateSimple> {
class _RotateSimpleState extends State<RotateSimple>
    with SingleTickerProviderStateMixin {
  // added tree
  final GlobalKey<SpinWheelState> _wheelKey = GlobalKey<SpinWheelState>();

  double _progress = 0.01;
  late Animation<double> animation;
  late AnimationController animationcontroller;
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
      pickedcolor = Colors.green,
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

  final List<Color> _simplewgscolor = List.generate(
    64,
    (index) => getWalletLayerColor(index, 'top', isReversed: true),
  );
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

  List<int> _walletstatelist = List.filled(65, 4, growable: false);
  // late List<int> _gatestatelist;
  final List<bool> _isBoldList = List<bool>.filled(65, false, growable: false);

  int headstate = 4,
      ajnastate = 4,
      throatstate = 4,
      gstate = 4,
      sacralstate = 4,
      rootstate = 4,
      heartstate = 4,
      spleenstate = 4,
      solarstate = 4,
      allcounterstate = 4;

  int _wallet = 1;

  // The Ensemble: A list of all your counter state objects
  List<int> get allStates {
    return [
      headstate,
      ajnastate,
      throatstate,
      gstate,
      rootstate,
      heartstate,
      spleenstate,
      solarstate,
    ];
  }

  final double chartWidth = 350.0;
  final double chartHeight = 608.0;

  double opacityLevel = 1.0, opacityLevelFigures = 1.0;
  final Offset _offset = Offset.zero;

  //String mainText = ';זה לא אני תמנונירוק', chartText = 'מפה רואים בחוץ ובפנים';
  String mainText = ';פשוט', chartText = 'מפה רואים בחוץ ובפנים';
  bool isMainText = true, isChartText = true;

  Map<String, ZBCounter> _sandboxRegistry = {};
  ZBTheme _zbTheme = ZBTheme.zb;

  final _presetSimpleConfigs = [
    {'asset': coins4lst[0], 'tooltip': 'מורכב', 'state': 5},
    {'asset': coins4lst[1], 'tooltip': 'פשוט', 'state': 4},
    {'asset': coins4lst[2], 'tooltip': 'נשימה', 'state': 3},
    {'asset': coins4lst[3], 'tooltip': 'שתיקה', 'state': 2},
  ];
  // ZBAccount? _currentActiveAccount;
  @override
  void initState() {
    super.initState();

    // 1. Reset the local list
    _walletstatelist = List.filled(65, 4);

    // 2. DEEP CLONE the global registry into our local _sandboxRegistry
    // We create NEW ZBCounter objects to ensure isolation
    _sandboxRegistry = {};

    ZBData.counterMap.forEach((key, original) {
      _sandboxRegistry[key] = ZBCounter(
        id: original.id,
        name: original.name,
        counterstate: 4, // Force to Simple (White)
        isManual: false,
        wallets: List.from(original.wallets), // Clone the wallet list
        hebname: original.hebname,
        hdname: original.hdname,
      );
    });

    // 3. Initialize any missing Gates in the local registry
    for (int i = 1; i <= 64; i++) {
      final String gateId = 'g$i';
      if (!_sandboxRegistry.containsKey(gateId)) {
        _sandboxRegistry[gateId] = ZBCounter(
          id: i,
          counterstate: 4,
          name: gateId,
          wallets: [],
          hebname: '$i',
          hdname: '$i',
        );
      }
    }

    // 4. Animation Setup (Remains the same)
    animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        if (mounted) setState(() => _progress = animationcontroller.value);
      });
  }

  @override
  void dispose() {
    // Text controllers
    _controllertoptext.dispose();
    _controllerbottomtext.dispose();
    _controllerichingtext.dispose();
    _controllerlettext.dispose();
    _controllernumtext.dispose();
    _controllercointext.dispose();
    _controllercoinnumber.dispose();
    _controllerfibo.dispose();

    // Scroll controller
    rtScrollController.dispose();

    // Animation controller
    animationcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use 90% of screen width if it's narrower than 350
    double responsiveSize = Screen.width < 450 ? Screen.width * 0.9 : 450;
    Screen.init(context);

    return SelectionArea(
      child: GestureDetector(
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
              onPressed: () => zbPop(context),
            ),
            //backgroundColor: Colors.green.withValues(alpha:0.3)
            backgroundColor: Colors.transparent,
          ),
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
                      image: AssetImage('assets/camog/zbgreenoctopus.png'),
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
                          ? mainText = ";עיוורית"
                          : mainText = "Inglitch;";
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
                          _controllerbottomtext.text = sacralnamelist[indextop];
                          mainText = coinsHebMark4lst[indextop];
                          maintextcolor = coincolors4lst[indextop];
                          controlbottxtcolor = coincolors4lst[indextop];
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 0.8,
                  child: AutoSizeTextField(
                    minLines: 1,
                    maxLines: 2,
                    minFontSize: 45,
                    fullwidth: false,
                    decoration: InputDecoration.collapsed(
                      hintText: sacralnamelist[1],
                      //hintText: hexNamesList[1],
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: controlbottxtcolor,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllerbottomtext,
                    readOnly: false,
                  ),
                ),
                const SizedBox(height: 20),

                const SizedBox(height: 30),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      value: _dropdowichingordervalue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      items: orderHexagramsWheelList,
                      onChanged: (int? dropdowichingordervalueChange) {
                        setState(() {
                          _dropdowichingordervalue =
                              dropdowichingordervalueChange ??
                                  _dropdowichingordervalue;

                          _chosenhex = _dropdowichingordervalue;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);

                          _controllercoinnumber.text = _chosenhex.toString();
                          _wallet = _chosenhex;
                        });
                      },
                    ),
                    DropdownButton(
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      value: _dropdownvalue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      items: hexDropDownNumbersList,
                      onChanged: (int? dropdownvalueChange) {
                        setState(() {
                          _dropdownvalue =
                              dropdownvalueChange ?? _dropdownvalue;
                          _chosenhex = _dropdownvalue;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);

                          _controllercoinnumber.text = _chosenhex.toString();
                          _wallet = _chosenhex;
                        });
                      },
                    ),
                    DropdownButton(
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      value: _dropdowichingvalue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      items: fontHexList,
                      onChanged: (String? dropdowichingvalueChange) {
                        setState(() {
                          _dropdowichingvalue =
                              dropdowichingvalueChange ?? _dropdowichingvalue;
                          _fontindex = fontHexOrderList.indexWhere(
                            (element) => element == _dropdowichingvalue,
                          );
                          _fonthexconverted = fontHexNumbersList[_fontindex];

                          _chosenhex = _fonthexconverted;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);

                          _controllercoinnumber.text = _chosenhex.toString();
                          _wallet = _chosenhex;
                        });
                      },
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (String? textHexValueChange) {
                          setState(() {
                            _textHexValueChange = int.parse(
                              textHexValueChange!,
                            );

                            _chosenhex = _textHexValueChange;
                            _hexalignedList = hexagramAlignment(_chosenhex);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);

                            _controllercoinnumber.text = _chosenhex.toString();
                            _wallet = _chosenhex;
                          });
                        },
                      ),
                    ),
                  ],
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
                          'assets/camog/greendog.png',
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildWalletPopUp(context, _wallet),
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
                    maxHeight: Screen.height * 0.2,
                    maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height * 0.2,
                    maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height * 0.2,
                    maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.green, thickness: 7),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height / 7.5,
                    //maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height / 7.5,
                    //maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height / 7.5,
                    //maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height / 7.5,
                    //maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height / 7.5,
                    //maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: Screen.height / 7.5,
                    //maxWidth: Screen.width * 0.5,
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
                      },
                    ),
                  ),
                ),
                const Divider(color: Colors.green, thickness: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Base 4
                    buildSelectionButton(
                      context,
                      '4',
                      zbbuildBasePopUp(context, '4', ZBData.base4Data),
                    ),

                    // Base 4
                    buildSelectionButton(
                      context,
                      '6',
                      zbbuildBasePopUp(context, '6', ZBData.base6Data),
                    ),

                    // Base 36
                    buildSelectionButton(
                      context,
                      '36',
                      zbbuild36PopUp(context), // Added the missing argument
                    ),

                    // Base 64
                    buildSelectionButton(
                      context,
                      '64',
                      zbbuildBasePopUp(context, '64', ZBData.base64Data),
                    ),

                    // Base 384 (Keep its custom logic for the Sun/Earth button)
                    buildSelectionButton(
                      context,
                      '384',
                      zbbuild384PopUp(context),
                    ),
                  ],
                ),
                const Divider(color: Colors.green, thickness: 7),

                RepaintBoundary(
                  key: zbChartBoundaryKey,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: chartWidth,
                          height: chartHeight,
                          decoration: BoxDecoration(
                            // color: cardcolor, // Using your existing variable
                            color:
                                Colors.black87, // Using your existing variable
                            border: Border.all(color: Colors.blue, width: 4),
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: SizedBox(
                              width: chartWidth,
                              height: chartHeight,
                              child: ZBAccountChart(
                                // No 'account' passed here. It stays a pure UI sandbox.
                                key: const ValueKey('manual_sandbox_chart'),
                                registry: _sandboxRegistry, //
                                walletStates: _walletstatelist,
                                pickedcolor: pickedcolor,
                                onCounterTap: (id) {
                                  setState(() {
                                    ZBLogic.toggleCounter(
                                      id,
                                      pickedcolor,
                                      targetRegistry: _sandboxRegistry,
                                    );
                                  });
                                },
                                walletBuilder: (n) {
                                  return ZBStyles.buildWalletText(n,
                                      state: _walletstatelist[n]);
                                },
                                presets: [
                                  ZBPreset(
                                      asset: coins4lst[0],
                                      tooltip: 'מורכב',
                                      onTap: _toggleComplex),
                                  ZBPreset(
                                      asset: coins4lst[1],
                                      tooltip: 'פשוט',
                                      onTap: _toggleSimple),
                                  ZBPreset(
                                      asset: coins4lst[2],
                                      tooltip: 'נשימה',
                                      onTap: _toggleBreath),
                                  ZBPreset(
                                      asset: coins4lst[3],
                                      tooltip: 'שתיקה',
                                      onTap: _toggleSilence),
                                ],
                              ),
                            ),
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
                                'assets/coins/fullcoins.png',
                              ),
                            ),
                            tooltip: 'צבע לבחור',
                            onPressed: () {
                              showDialog(
                                builder: (BuildContext context) => AlertDialog(
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
                            },
                          ),
                        ),
                        const PositionedDirectional(
                          end: 10,
                          top: 10,
                          child: ZBExportButton(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(color: Colors.green, thickness: 7),
                SelectionContainer.disabled(
                  child: SizedBox(
                    width: 300, // Keep width constrained
                    child: GridView.builder(
                      // 1. REMOVE fixed height, use shrinkWrap to let it calculate its own height
                      shrinkWrap: true,
                      // 2. Use ClampingScrollPhysics so it doesn't fight with a parent ScrollView
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 8,
                        mainAxisSpacing:
                            4.0, // Reduced spacing for 8x8 to save room
                        crossAxisSpacing: 4.0,
                      ),
                      padding: const EdgeInsets.all(4.0),
                      itemCount: ZBData.getzbwallets.length,
                      itemBuilder: (context, index) {
                        final walletIndex = index + 1;
                        final int state = _walletstatelist[walletIndex];
                        final List<Color> walletColors =
                            ZBStyles.setWalletColor(state);

                        return GestureDetector(
                          onTap: () => _updateWallets(
                              wallets: [walletIndex], cycle: true),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: walletColors[0] != walletColors[1]
                                  ? LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: walletColors,
                                    )
                                  : null,
                              color: walletColors[0] == walletColors[1]
                                  ? walletColors[0]
                                  : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: state == 6
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: FittedBox(
                                // 3. CRITICAL: Ensures the number scales to fit the tiny circle
                                fit: BoxFit.scaleDown,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    '$walletIndex',
                                    style: TextStyle(
                                      color: {1, 4, 5, 7, 8, 9}.contains(state)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(color: Colors.green, thickness: 7),

                SelectionContainer.disabled(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      // Allow it to be as wide as needed up to 300
                      maxWidth: 300,
                      // Set a MAX height instead of a FIXED height so it doesn't overflow the screen
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    child: SingleChildScrollView(
                      // 1. Allow scrolling if the grid is too tall
                      child: GridView.builder(
                          shrinkWrap:
                              true, // 2. Tell GridView to only take needed space
                          physics: const ScrollPhysics(), // 3. Enable scrolling
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 3,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            ZBDesignForm designform =
                                ZBData.designFormsList[index];
                            List<int> designformWallets =
                                designform.wallets ?? [];

                            // 1. Check for Manual State (Orange)
                            bool isInternallyActive = designformWallets
                                .any((id) => _walletstatelist[id] == 2);

                            // 2. Check for Shared/Master State (Green on Master)
                            bool isExternallyLit = designformWallets
                                .any((id) => _walletstatelist[id] == 4);

                            return GestureDetector(
                              onTap: () {
                                // We no longer 'return' on State 4 because 4 is our 'Simple' starting state.
                                // This allows the 9-grid to toggle a '4' into a '2' immediately.

                                int targetState = isInternallyActive ? 4 : 2;

                                _updateWallets(
                                  wallets: designformWallets,
                                  walletState: targetState,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // CHANGE: If it is State 4, show Black (or a unique 'Shared' color)
                                  // Only show Orange if it's Internally Active (State 2)
                                  color: isInternallyActive
                                      ? Colors.yellow
                                      : (isExternallyLit
                                          ? Colors.green
                                          : Colors.black),

                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    // VISUAL CUE: Show a thin Orange border if it's State 4
                                    // to indicate it's 'available' but not manually active.
                                    color: isInternallyActive
                                        ? Colors.yellow
                                        : (isExternallyLit
                                            ? Colors.black
                                            : Colors.white24),
                                  ),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      designform.zbname ?? '',
                                      style: TextStyle(
                                        color: isInternallyActive
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                SelectionContainer.disabled(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 250, // Keep your width preference
                      maxHeight: MediaQuery.of(context).size.height *
                          0.5, // Allow up to 50% of screen
                    ),
                    child: GridView.builder(
                      // CRITICAL: Tells the grid to take ONLY the space it needs for the 21 items
                      shrinkWrap: true,
                      // Allow scrolling if it still exceeds the constrained height
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 5,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemCount: 21,
                      itemBuilder: (context, index) {
                        ZBCodon codon = ZBData.codonLst[index];
                        List<int> codonwallets = codon.wallets ?? [];

                        bool isInternallyActive =
                            codonwallets.any((id) => _walletstatelist[id] == 3);
                        // bool isSimpleState =
                        //     codonwallets.any((id) => _walletstatelist[id] == 4);

                        return GestureDetector(
                          onTap: () {
                            int targetState = isInternallyActive ? 4 : 3;

                            _updateWallets(
                              wallets: codonwallets,
                              walletState: targetState,
                            );
                          },
                          child: Tooltip(
                            message:
                                '${codon.name ?? ''}: ${codonwallets.join(', ')}',
                            child: Container(
                              decoration: BoxDecoration(
                                color: isInternallyActive
                                    ? Colors.yellow
                                    : Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: isInternallyActive
                                      ? Colors.black
                                      : Colors.white24,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      codon.zbname ?? '',
                                      style: TextStyle(
                                        color: isInternallyActive
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const Divider(color: Colors.green, thickness: 7),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        foregroundImage: AssetImage('assets/coins/simple.png'),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildWalletPopUp(context, _wallet),
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
                // new zbgemini wheel
                // Refactored external wheel segment
                Center(
                  child: ZBMandalaWidget(
                    // You are passing the function as a tear-off
                    onTapWallet: _handleSimpleTap,
                    walletsState: _walletstatelist,
                  ),
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
                  innerRadius: Screen.width / 10,
                  initialAngle: 3.85,
                  childrenPadding: 0.1,
                  origin: const Offset(0, 0),
                  children: List.generate(12, (index) {
                    return Tooltip(
                      message:
                          '${revzodiacNameHeblist[index]}\n${revzodiacNamelist[index]}',
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 90,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
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
                const Divider(color: Colors.green, thickness: 7),
                // 64 coins wheel
                Stack(
                  children: [
                    CircleList(
                      innerRadius: Screen.width / 60,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: Screen.width / 12 + 10,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: Screen.width / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: SizedBox(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(1),
                          ),
                          child: Image.asset(zoo4lst[0]),
                        ),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: revtopyangcolor[index],
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: AutoSizeText(
                              reversedHexagramsWheel[index + 48].toString(),
                              minFontSize: 20,
                              //maxFontSize: 85,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                              reversedHexagramsWheel[index + 48],
                            );
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
                      innerRadius: Screen.width / 60,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: Screen.width / 12 + 10,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: Screen.width / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: SizedBox(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(1),
                          ),
                          child: Image.asset(zoo4lst[1]),
                        ),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: revtopyangcolor[index],
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: AutoSizeText(
                              reversedHexagramsWheel[index + 32].toString(),
                              minFontSize: 20,
                              //maxFontSize: 85,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                              reversedHexagramsWheel[index + 32],
                            );
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
                      innerRadius: Screen.width / 60,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: Screen.width / 12 + 10,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: Screen.width / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: SizedBox(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(1),
                          ),
                          child: Image.asset(zoo4lst[2]),
                        ),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: topyangcolor[index],
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: AutoSizeText(
                              reversedHexagramsWheel[index].toString(),
                              minFontSize: 20,
                              //maxFontSize: 85,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                              reversedHexagramsWheel[index],
                            );
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
                      innerRadius: Screen.width / 60,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: Screen.width / 12 + 10,
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
                            border: Border.all(width: 2, color: Colors.black),
                          ),
                        );
                      }),
                    ),
                    //external wheel
                    CircleList(
                      rotateMode: RotateMode.stopRotate,
                      innerRadius: Screen.width / 7 + 20,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: SizedBox(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(1),
                          ),
                          child: Image.asset(zoo4lst[3]),
                        ),
                      ),
                      children: List.generate(16, (index) {
                        return InkWell(
                          child: Container(
                            width: 35,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: topyangcolor[index],
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: AutoSizeText(
                              reversedHexagramsWheel[index + 16].toString(),
                              minFontSize: 20,
                              //maxFontSize: 85,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            _hexalignedList = hexagramAlignment(
                              reversedHexagramsWheel[index + 16],
                            );
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);
                          },
                        );
                      }),
                    ),
                  ],
                ),
                const Divider(color: Colors.green, thickness: 7),
                // 64 coins wheel
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Positioned(
                      top: Screen.height / 4,
                      bottom: Screen.height / 4,
                      left: Screen.width / 20,
                      right: Screen.width / 20,
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
                      innerRadius: Screen.width / 60 + 40,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      rotateMode: RotateMode.stopRotate,
                      children: List.generate(64, (index) {
                        return Container(
                          width: 20,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: getWalletLayerColor(
                              index,
                              'bot',
                              isReversed: true,
                            ),
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
                      innerRadius: Screen.width / 12 + 60,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      children: List.generate(64, (index) {
                        return Container(
                          width: 35,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: getWalletLayerColor(
                              index,
                              'mid',
                              isReversed: true,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: AutoSizeText(
                            reversedHexagramsWheel[index].toString(),
                            minFontSize: 10,
                            maxFontSize: 12,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                    ),
                    CircleList(
                      innerRadius: Screen.width / 7 + 80,
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
                                  color: _simplewgscolor[index],
                                  fontFamily: 'iChing',
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            _wallet = reversedHexagramsWheel[index];
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
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      minLines: 1,
                      minFontSize: 15,
                      fullwidth: false,
                      decoration: const InputDecoration.collapsed(
                        //hintText: hexNamesList[1],
                        hintText: '1',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                const Divider(color: Colors.green, thickness: 7),
                Stack(
                  children: [
                    CircleList(
                      innerRadius: Screen.width / 16,
                      initialAngle: -0.8,
                      childrenPadding: 0.1,
                      origin: const Offset(0, 0),
                      centerWidget: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        child: Image.asset(
                          "assets/coins/fullrotateicon.png",
                        ),
                      ),
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
                      innerRadius: Screen.width / 5.5,
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
                  thickness: 5,
                  indent: 5,
                  endIndent: 5,
                  color: Colors.green,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      height: Screen.height / 5,
                      width: Screen.width / 3.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/camog/zbgreencamel.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(
                      height: Screen.height / 5,
                      width: Screen.width / 3.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/camog/zbgreencamel.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(
                      height: Screen.height / 5,
                      width: Screen.width / 3.2,
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

                const Divider(color: Colors.green, thickness: 7),
                const SizedBox(height: 10),
                Container(
                  height: 35,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const AutoSizeText(
                    'אבוד-לוציה',
                    textAlign: TextAlign.center,
                    minFontSize: 20,
                    maxFontSize: 25,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // rt evolution
                SizedBox(
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
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // rt evolution
                Container(
                  //height: Screen.height * 0.9,
                  height: 400,
                  //width: Screen.width,
                  width: 400,
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(color: Colors.green, width: 4),
                    borderRadius: BorderRadius.circular(20), // border color
                    image: const DecorationImage(
                      image: AssetImage('assets/coins/rtevolutionnobg.png'),
                      //colorFilter: ColorFilter.mode(
                      //Colors.white.withValues(alpha:1.0),
                      //    BlendMode.modulate,
                      //    )
                    ),
                  ),
                ),

                const Divider(color: Colors.green, thickness: 7),
                SizedBox(
                  height: 200,
                  width: 350,
                  // color: Colors.black.withValues(alpha: 0.1),
                  // color: Colors.transparent,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 200,
                    child: CarouselSlider(
                      items: miximageslider,
                      carouselController: _controllerimages,
                      options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        viewportFraction: 0.8,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indextop, reason) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SelectionContainer.disabled(
                  child: SizedBox(
                    height: 300,
                    width: 350,
                    child: GridView.builder(
                      cacheExtent: 300,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.5,
                        crossAxisCount: 3, // number of items in each row
                        mainAxisSpacing: 8.0, // spacing between rows
                        crossAxisSpacing: 6.0, // spacing between columns
                      ),
                      padding: const EdgeInsets.all(
                        6.0,
                      ), // padding around the grid
                      itemCount: rtimages.length, // total number of items
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.black.withValues(alpha: 0.1),
                              image: DecorationImage(
                                image: AssetImage(rtimages[index]),
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withValues(alpha: 1.0),
                                  BlendMode.modulate,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            _controllerimages.jumpToPage(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
                const Divider(color: Colors.green, thickness: 7),

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
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.green, thickness: 7),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    // Generate random 1-64 and tell the wheel to spin
                    int randomWallet = math.Random().nextInt(64) + 1;
                    _wheelKey.currentState?.startSpin(randomWallet);
                  },
                  child: Image.asset(
                    'assets/camog/zbgreenoctopus.png', // Corrected your typo 'zbgreenoctopus'
                    width: 80,
                    height: 80,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    size: 40,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    _wheelKey.currentState
                        ?.resetWheel(); // Resets the wheel on click
                  },
                ),
                const SizedBox(height: 50),
                SelectionContainer.disabled(
                  child: SizedBox(
                    width: responsiveSize,
                    height: responsiveSize,
                    child: SpinWheel(key: _wheelKey, size: responsiveSize),
                  ),
                ),
                // const ColorWheel(size: 350),
                const SizedBox(height: 50),
                const Center(
                  child: SpokeWheel(size: 200, wheelColor: Colors.green),
                ),
                const SizedBox(height: 20),

                const Divider(color: Colors.green, thickness: 7),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1. Create a helper to handle the gate reset so you don't type List.generate every time
  void _resetAllWallets([int state = 0]) {
    setState(() {
      for (int i = 1; i <= 64; i++) {
        _writeWalletState(i, state);
      }
    });
  }

  Widget _presetButton(String asset, String tooltip, VoidCallback onPressed) {
    return IconButton(
      icon: CircleAvatar(maxRadius: 20, foregroundImage: AssetImage(asset)),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }

  // 2. Optimized Story Charts
  void setSilenceChart() {
    // _resetAllGates(0); // Clear the slate
    _updateWallets(
      wallets: ZBData.silencewallets,
      walletState: 2,
    ); // State 2 (Red)

    // Update only the Silence centers to State 1
    setCounters(2, ['throat', 'self', 'sacral', 'root', 'spleen', 'solar']);
  }

  void setBreathChart() {
    _updateWallets(wallets: ZBData.walletsByZBState(3), walletState: 3);
    // Only set counters that aren't already COMPLEX
    for (var id in [
      'head',
      'ajna',
      'throat',
      'self',
      'heart',
      'spleen',
      'solar',
      'root',
    ]) {
      if (ZBData.counterMap[id]?.counterstate != 5) {
        ZBData.counterMap[id]?.counterstate = 3;
      }
    }
    ZBData.counterMap['sacral']?.counterstate = 4;
  }

  void setSimpleChart() {
    _resetAllWallets(4); // Reset directly to State 4 (Green/Simple)
    setCounters(4); // Set all centers to Green
  }

  void setComplexChart() {
    _updateWallets(
      wallets: ZBData.walletsByZBState(5),
      walletState: 5,
    ); // 5 = Blue
    setCounters(5, ['throat', 'solar', 'heart']);
  }

  // 0=off, 1=simple, 2=breath, 3=complex, 4=silence
  /// --- 1. SIMPLE (Green / State 4) ---
  void _toggleSimple() {
    setState(() {
      // Clean start
      ZBRegistry.resetRegistryToZB();

      // Update ALL 64 gates to Simple (4)
      for (int i = 0; i <= 64; i++) {
        _writeWalletState(i, 4);
      }

      // Set all 9 centers to Green
      setCounters(4, [
        'head',
        'ajna',
        'throat',
        'self',
        'heart',
        'spleen',
        'sacral',
        'solar',
        'root'
      ]);

      _clearManualFlags();
    });
  }

  /// --- 2. BREATH (Yellow / State 3) ---
  void _toggleBreath() {
    setState(() {
      // Clean start - default everything to Simple (4) first
      _setAllWalletsToSimple();

      // Apply Breath (3) to specific wallets
      _updateWallets(wallets: ZBData.walletsByZBState(3), walletState: 3);

      // Set centers: Sacral is specifically Green (4), others are Yellow (3)
      setCounters(3, [
        'head',
        'ajna',
        'throat',
        'self',
        'heart',
        'spleen',
        'solar',
        'root',
      ]);
      setCounters(4, ['sacral']);

      _clearManualFlags();
    });
  }

  /// --- 3. COMPLEX (Blue / State 5) ---
  void _toggleComplex() {
    setState(() {
      _setAllWalletsToSimple();

      _updateWallets(
        wallets: ZBData.walletsByZBState(5),
        walletState: 5,
      );

      // Complex usually only highlights the "Motor/Expression" centers
      setCounters(5, ['throat', 'solar', 'heart']);
      // Ensure others are reset/transparent
      setCounters(4, ['head', 'ajna', 'self', 'spleen', 'sacral', 'root']);

      _clearManualFlags();
    });
  }

  /// --- 4. SILENCE (Red / State 2) ---
  void _toggleSilence() {
    setState(() {
      _setAllWalletsToSimple();

      _updateWallets(
        wallets: ZBData.walletsByZBState(2),
        walletState: 2,
      );

      // Silence centers
      setCounters(2, ['throat', 'self', 'sacral', 'root', 'spleen', 'solar']);
      setCounters(4, ['head', 'ajna', 'heart']);

      _clearManualFlags();
    });
  }

  /// Sets all 64 wallet indicators to Simple (4) as a background layer
  void _setAllWalletsToSimple() {
    for (int i = 0; i <= 64; i++) {
      _writeWalletState(i, 4);
    }
  }

  /// Ensures no manual overrides interfere with the preset colors
  void _clearManualFlags() {
    ZBData.counterMap.forEach((id, counter) {
      counter.isManual = false;
    });
  }

  //counters centers

  // 1. Get the current numeric frequency (0-7)
  int getCounterState(String id) {
    return ZBData.counterMap[id]?.counterstate ?? 0;
  }

  // 2. Get the actual color from your ZBStory registry
  Color getCounterColor(String id) {
    int state = getCounterState(id);
    return ZBStory.getfrequency(state)?.zbcolor ?? Colors.green;
  }

  Widget walletText(int walletNumber, {bool useCircle = false}) {
    String id = 'g$walletNumber';
    int state = getCounterState(id);

    // Rule: NOT Bold if state is 0, 1, or 4
    bool isBold = state != 0 && state != 1 && state != 4;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 13),
        padding: const EdgeInsets.all(2), // Slight padding for the background
        decoration: (isBold && useCircle)
            ? const BoxDecoration(color: Colors.white, shape: BoxShape.circle)
            : null,
        child: Text(
          '$walletNumber',
          style: TextStyle(
            backgroundColor:
                (isBold && !useCircle) ? Colors.white : Colors.transparent,
            fontSize: 11,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.black, // Ensures visibility on white background
          ),
        ),
      ),
    );
  }

  // 3. The logic for your onTap
  void toggleCounter(String id) {
    setState(() {
      int current = getCounterState(id);
      // If it's not at frequency 7, set it to 7. Otherwise, drop to 3.
      int next = (current != 7) ? 7 : 3;
      ZBData.counterMap[id]?.counterstate = next;
    });
  }

  // If counterMap is in your public ZBMain class:
  void setCounters(int counterstate, [List<String>? counters]) {
    // Use _sandboxRegistry instead of ZBData.counterMap
    if (counters == null || counters.isEmpty || counters.contains('all')) {
      for (var counter in _sandboxRegistry.values) {
        counter.counterstate = counterstate;
        counter.isManual = false; // Presets should clear manual overrides
      }
    } else {
      for (var id in counters) {
        if (_sandboxRegistry.containsKey(id)) {
          _sandboxRegistry[id]!.counterstate = counterstate;
          _sandboxRegistry[id]!.isManual = false;
        }
      }
    }
  }

  // zb claude updates

  void _updateWallets(
      {required List<int> wallets, int? walletState, bool cycle = false}) {
    setState(() {
      // gemini snapshot line
      _walletstatelist = List<int>.from(_walletstatelist);

      for (int walletId in wallets) {
        if (cycle) {
          int currentState = _walletstatelist[walletId] ?? 0;
          // Increase 6 to 9 to allow States 7 (Black/Red), 8 (Black/White), and 9 (Red/Blue)
          int nextState = (currentState >= 9) ? 0 : currentState + 1;
          _writeWalletState(walletId, nextState);
        } else if (walletState != null) {
          _writeWalletState(walletId, walletState);
        }
      }
    });
  }

  void _writeWalletState(int wallet, int newState) {
    if (wallet < 0 || wallet >= _walletstatelist.length) return;
    _walletstatelist[wallet] = newState;
    // ZBData.counterMap['w$wallet']?.state = newState;
  }

  void _handleSimpleTap(int gateValue, int currentState) {
    int current = _walletstatelist[gateValue];
    int next = (current >= 8) ? 0 : current + 1;
    setState(() {
      _writeWalletState(gateValue, next);
      _wallet = gateValue;
      _controllercoinnumber.text = _wallet.toString();
      _controllerfibo.text = Fibonacci.printSeries(size: _wallet).toString();
      _chosenhex = _wallet;
      _hexalignedList = hexagramAlignment(_chosenhex);
      _controllertop.jumpToPage(_hexalignedList[0]);
      _controllermid.jumpToPage(_hexalignedList[1]);
      _controllerbot.jumpToPage(_hexalignedList[2]);
    });
  }

  void _syncCountersWithWallets() {
    // Loop through head, ajna, throat, etc.
    ZBData.counterMap.forEach((id, counter) {
      // We only want to sync the 9 Centers, not the individual wallet entries
      if (!id.startsWith('w')) {
        int highestState = 0;

        // Check every wallet belonging to this specific center
        for (int walletId in counter.wallets) {
          int currentWalletState = _walletstatelist[walletId];
          if (currentWalletState > highestState) {
            highestState = currentWalletState;
          }
        }

        // Update the Counter state so the Painter draws the correct color
        counter.counterstate = highestState;
      }
    });
  }

  void _syncCarouselsToWallet(int hexagramNumber) {
    // 1. Get the binary string for the hexagram (e.g., "111111" for 1, "000000" for 2)
    // Logic: 1 = YANG (Page 0), 0 = yin (Page 1)
    String binary = getHexBinary(hexagramNumber);

    // 2. Command the 6 Drivers to their specific "Animal State"
    // Assuming index 5 is Line 6 (Camel) and index 0 is Line 1 (pussycat)
    _controllercamel.animateToPage(binary[5] == '1' ? 0 : 1);
    _controllerdog.animateToPage(binary[4] == '1' ? 0 : 1);
    _controlleroctopus.animateToPage(binary[3] == '1' ? 0 : 1);
    _controlleroctopussy.animateToPage(binary[2] == '1' ? 0 : 1);
    _controllerbitch.animateToPage(binary[1] == '1' ? 0 : 1);
    _controllerpussycat.animateToPage(binary[0] == '1' ? 0 : 1);
  }

  void _onGateTapped(int gateValue) {
    _wallet = gateValue;
    _controllercoinnumber.text = _wallet.toString();
    _controllerfibo.text = Fibonacci.printSeries(size: _wallet).toString();

    setState(() {
      _chosenhex = _wallet;
      _hexalignedList = hexagramAlignment(_chosenhex);
      // Move your page controllers here
    });
  }
}

class TreePainter extends CustomPainter {
  final double progress;
  static const int _depth = 6;

  TreePainter(this.progress);

  static var degToRed = math.pi / 180.0;
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final lineLength = math.min(size.width, size.height) * 0.035;
    final x = size.width / 2;
    final y = size.height * 0.8;
    _drawTree(canvas, x, y, -90, 90 * progress, _depth, lineLength);
  }

  void _drawTree(
    Canvas canvas,
    double x1,
    double y1,
    double angle,
    double offset,
    int depth,
    double lineLength,
  ) {
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
        canvas,
        x2,
        y2,
        angle + offset + 45,
        offset,
        depth - 1,
        lineLength,
      );
      _drawTree(
        canvas,
        x2,
        y2,
        angle + offset - 65,
        offset,
        depth - 1,
        lineLength,
      );
      _drawTree(
        canvas,
        x2,
        y2,
        angle + offset - 85,
        offset,
        depth - 1,
        lineLength,
      );
      _drawTree(
        canvas,
        x2,
        y2,
        angle + offset + 105,
        offset,
        depth - 1,
        lineLength,
      );
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
