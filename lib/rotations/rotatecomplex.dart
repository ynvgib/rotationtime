import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchplanets.dart';
import 'package:finallyicanlearn/services/rotatewidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sweph/sweph.dart';


class RotateComplex extends StatefulWidget {
  const RotateComplex({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateComplexState();
  }
}

class _RotateComplexState extends State<RotateComplex> {
  // human design
  Color headcolor = Colors.green,
      ajnacolor = Colors.green,
      throatcolor = Colors.green,
      gcolor = Colors.green,
      sacralcolor = Colors.green,
      rootcolor = Colors.green,
      heartcolor = Colors.green,
      spleencolor = Colors.green,
      solarcolor = Colors.green,
      grampacolor = Colors.black,
      papacolor = Colors.black,
      soncolor = Colors.black,
      daughtercolor = Colors.black,
      mamacolor = Colors.black,
      grannycolor = Colors.black;

  int headstate = 3,
      ajnastate = 3,
      throatstate = 3,
      gstate = 3,
      sacralstate = 3,
      rootstate = 3,
      heartstate = 3,
      spleenstate = 3,
      solarstate = 3,
      zbheadstate = 3,
      zbajnastate = 3,
      zbthroatstate = 3,
      zbgstate = 3,
      zbsacralstate = 3,
      zbrootstate = 3,
      zbheartstate = 3,
      zbspleenstate = 3,
      zbsolarstate = 3;

  int headcolorstate = 0,
      ajnacolorstate = 0,
      throatcolorstate = 0,
      gcolorstate = 0,
      sacralcolorstate = 0,
      rootcolorstate = 0,
      heartcolorstate = 0,
      spleencolorstate = 0,
      solarcolorstate = 0;

  // gate state
  // 0-undefined, 1-personality, 2-design, 3-both, 4 - transit

  List<int> gatestatelist = List.filled(65, 0, growable: false),
      tonallist = List.filled(4, 1, growable: false);
  //listdesigngates = List.generate(13, (index) => index++),
  //listpersonalitygates = List.generate(13, (index) => index++);

  /// end hd

  //List<String> _centers = [],
  //List<String> coinsHeb4lst = hexNamesList,
  //List<String> newcoinsHeb4lst = newcoinsHeb4lst,
  List<String> coins64List = rtminmic65List,
      topcoinnamelist = zbzoo4names,
      midcoinnamelist = newcoinsHeb4lst,
      botcoinnamelist = coinsHeb4lst,
      maincoin = zbrussianames;

  List<hdCenter> _centers = [];

  List coins384List = rtmix390lstHeb, coinssidenamelist = rt6HEbcoins;

  HumanDesign hdfinaldata = HumanDesign(typeid: 0);

  final TextEditingController _controllerType = TextEditingController(),
      _controllerAuthority = TextEditingController(),
      _controllerStrategy = TextEditingController(),
      _controllerSentence = TextEditingController(),
      _controllerFinalLine = TextEditingController(),
      //_controllerTime = TextEditingController(),
      _controllerSetTime = TextEditingController(),
      _controllerPersonTime = TextEditingController(),
      _controllerDesignTime = TextEditingController(),
      _controllerTimePick = TextEditingController(),
      _controllerDatePick = TextEditingController(),
      _controllermaintext = TextEditingController(),
      _controllergatelinestory = TextEditingController(),
      _controllergatetext = TextEditingController(),
      _controllerlinetext = TextEditingController(),
      _controllercoinsttext = TextEditingController(),
      _controllercointopfirsttext = TextEditingController(),
      _controllercointopsecondtext = TextEditingController(),
      _controllercointopthirdtext = TextEditingController(),
      _controllercoinmidfirsttext = TextEditingController(),
      _controllercoinmidsecondtext = TextEditingController(),
      _controllercoinmidthirdtext = TextEditingController(),
      _controllercoinbotfirsttext = TextEditingController(),
      _controllercoinbotsecondtext = TextEditingController(),
      _controllercoinbotthirdtext = TextEditingController(),
      _controllerNorthNodeHex = TextEditingController(),
      _controllerNorthNodeText = TextEditingController(),
      _controllerNorthNodeGate = TextEditingController(),
      _controllerDesignNorthNodeGate = TextEditingController(),
      _controllerSunHex = TextEditingController(),
      _controllerSunText = TextEditingController(),
      _controllerSunGate = TextEditingController(),
      _controllerDesignSunGate = TextEditingController(),
      _controllerMoonHex = TextEditingController(),
      _controllerMoonText = TextEditingController(),
      _controllerMoonGate = TextEditingController(),
      _controllerDesignMoonGate = TextEditingController(),
      _controllerMarsHex = TextEditingController(),
      _controllerMarsText = TextEditingController(),
      _controllerMarsGate = TextEditingController(),
      _controllerDesignMarsGate = TextEditingController(),
      _controllerVenusHex = TextEditingController(),
      _controllerVenusText = TextEditingController(),
      _controllerVenusGate = TextEditingController(),
      _controllerDesignVenusGate = TextEditingController(),
      _controllerMercuryHex = TextEditingController(),
      _controllerMercuryText = TextEditingController(),
      _controllerMercuryGate = TextEditingController(),
      _controllerDesignMercuryGate = TextEditingController(),
      _controllerJupiterHex = TextEditingController(),
      _controllerJupiterText = TextEditingController(),
      _controllerJupiterGate = TextEditingController(),
      _controllerDesignJupiterGate = TextEditingController(),
      _controllerSaturnHex = TextEditingController(),
      _controllerSaturnText = TextEditingController(),
      _controllerSaturnGate = TextEditingController(),
      _controllerDesignSaturnGate = TextEditingController(),
      _controllerUranusHex = TextEditingController(),
      _controllerUranusText = TextEditingController(),
      _controllerUranusGate = TextEditingController(),
      _controllerDesignUranusGate = TextEditingController(),
      _controllerNeptuneHex = TextEditingController(),
      _controllerNeptuneText = TextEditingController(),
      _controllerNeptuneGate = TextEditingController(),
      _controllerDesignNeptuneGate = TextEditingController(),
      _controllerPlutoHex = TextEditingController(),
      _controllerPlutoText = TextEditingController(),
      _controllerPlutoGate = TextEditingController(),
      _controllerDesignPlutoGate = TextEditingController(),
      _controllerChironGate = TextEditingController(),
      _controllerDesignChironGate = TextEditingController(),
      _controllerEarthHex = TextEditingController(),
      _controllerEarthText = TextEditingController(),
      _controllerEarthGate = TextEditingController(),
      _controllerDesignEarthGate = TextEditingController(),
      _controllerSouthNodeHex = TextEditingController(),
      _controllerSouthNodeText = TextEditingController(),
      _controllerSouthNodeGate = TextEditingController(),
      _controllerDesignSouthNodeGate = TextEditingController(),
      _controllerPlanetType = TextEditingController(),
      _controllerPlanetSubType = TextEditingController(),
      _controllergrampatxt = TextEditingController(),
      _controllerpapaptxt = TextEditingController(),
      _controllersontxt = TextEditingController(),
      _controllerdaughtertxt = TextEditingController(),
      _controllermamatxt = TextEditingController(),
      _controllergrannytxt = TextEditingController(),
      _controllersavetxt = TextEditingController(),
      _controllerchartname = TextEditingController(),
      country = TextEditingController(),
      state = TextEditingController(),
      city = TextEditingController();

  final CarouselSliderController _controllercoin = CarouselSliderController(),
      _controllerconstate = CarouselSliderController(),
      _controllerrotationstate = CarouselSliderController(),
      _controllertop = CarouselSliderController(),
      _controllermid = CarouselSliderController(),
      _controllerbot = CarouselSliderController(),
      _controlEvolutionContainerSlider = CarouselSliderController(),
      _controlComplexSlider = CarouselSliderController(),
      _controlSimpleSlider = CarouselSliderController(),
      _controlBreathSlider = CarouselSliderController(),
      _controlSilenceSlider = CarouselSliderController();

  //final String _title = subtitles[4];
  final String _title = subtitles_heb[4];

  String _textlevel = '',
      _planettext = '',
      _formattedDate = '',
      //_formattedDay = '',
      //_formattedMonth = '',
      //_formattedYear = '',
      _formattedTime = '',
      _settimestamp = 'דקות',
      cardstate = 'zb';

  DateTime _now = DateTime.now(),
      _personTime = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now();

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  List<Hexagram> _planetsList = List.filled(
          14, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'),
          growable: false),
      _planetsdesignList = List.filled(
          13, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'),
          growable: false),
      _planetspersonList = List.filled(
          13, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'),
          growable: false),
      _planetstransitList = List.filled(
          13, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'),
          growable: false),
      _planetsfulldisplayList =
          List.filled(14, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'), growable: true),
      _allplanetsList = List.filled(14, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio')),
      _planetsfulldesignList = List.filled(14, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'), growable: true),
      _planetsfullpersonList = List.filled(14, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'), growable: true),
      _planetsfulltransitList = List.filled(14, Hexagram(gate: 1, line: 1, gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio'), growable: true);

  List<HDChannel> _channelsList = [],
      _personchannelsList = [],
      _designchannelsList = [];

  int _currentmain = 0,
      _currenttop = 0,
      _currentmid = 0,
      _currentbot = 0,
      _currentconstate = 0,
      _currentrotationstate = 0,
      _chosenhex = 1,
      _hexagramVal = 0,
      _carouselvalueindex = 0,
      _previousPlanetIndex = -1,
      _currentline = 1,
      _newts = 1,
      _linesListplace = 0,
      _gatesListplace = 0;

  bool _setupdown = true;

  List<Color> colorlst = [Colors.white, Colors.black];

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
      _plutohex = Hexagram(),
      _chironhex = Hexagram(),
      _sundesignhex = Hexagram(),
      _earthdesignhex = Hexagram(),
      _northnodedesignhex = Hexagram(),
      _southnodedesignhex = Hexagram(),
      _moondesignhex = Hexagram(),
      _mercurydesignhex = Hexagram(),
      _venusdesignhex = Hexagram(),
      _marsdesignhex = Hexagram(),
      _jupiterdesignhex = Hexagram(),
      _saturndesignhex = Hexagram(),
      _uranusdesignhex = Hexagram(),
      _neptunedesignhex = Hexagram(),
      _plutodesignhex = Hexagram(),
      _chirondesignhex = Hexagram();

  Hexagram _planethex =
      Hexagram(gateline: '1.1', zodiacid: 7, zodiacsign: 'scorpio');

  final List<bool> _isPlanetSelectedList =
      List<bool>.filled(13, false, growable: false);
  final List<bool> _isBoldList = List<bool>.filled(65, false, growable: false);

  List<int> _hexalignedList = [0, 0, 0];

  Color colorindex = Colors.blue,
      cardcolor = Colors.black,
      timecolor = Colors.white,
      firstcolor = Colors.blue,
      secondcolor = Colors.blue,
      thirdcolor = Colors.blue,
      _colorinsilence = Colors.red,
      _colorinbreath = Colors.yellow,
      _colorinsimple = Colors.green,
      _colorincomplex = Colors.blue,
      _inbodycolor = Colors.red,
      _exbodycolor = Colors.yellow,
      _inpersoncolor = Colors.blue,
      _expersoncolor = Colors.green,
      pickedColor = Colors.green;

  List<Color> wheelgatescolor = List<Color>.filled(64, Colors.black26, growable: false);
  List<Color> complexrevtopcoincolor = reversedtopcoincolor;
  //List<Color> wheelgatescolor = complexrevtopcoincolor;
  //List<Color> revwheelgatescolor = List<Color>.filled(65, Colors.black26, growable: false);



  double screenwidth = 1, screenheight = 1, wheelgateopacity = 0.3;

  String silenceText = 'שתיקה',
      breathText = 'נשימה',
      simpleText = 'פשוט',
      complexText = 'מורכב',
      silenceBottomText = 'גוף',
      breathBottomText = 'גופוף',
      simpleBottomText = 'ווף',
      complexBottomText = 'ניגוף',
      _inbodyalign = 'left',
      _exbodyalign = 'left',
      _inpersonalign = 'left',
      _expersonalign = 'left',
      bitchText = '.',
      octopussyText = ',',
      octocaText = ';',
      dogText = '\"';

  bool isSilenceText = true,
      isBreathText = true,
      isSimpleText = true,
      isComplexText = true,
      isSilenceBotText = true,
      isBreathBotText = true,
      isSimpleBotText = true,
      isComplexBotText = true,
      isFamilyText = true,
      isBitchText = true,
      isOctopussyText = true,
      isOctocatText = true,
      isDogText = true;

  double opacityLevel = 1.0, opacityMainLevel = 1.0;

  IconData _inbodyicon = Icons.arrow_circle_right,
      _exbodyicon = Icons.arrow_circle_right,
      _inpersonicon = Icons.arrow_circle_left,
      _expersonicon = Icons.arrow_circle_left;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Sweph.init(
        //modulePath: 'sweph', // where to load module from.
        epheAssets: [
        //'packages/sweph/assets/ephe/seas_18.se1']);
        'packages/sweph/assets/ephe/seas_18.se1']);
    super.setState(() {}); // to update widget data
  }

  @override
  Widget build(BuildContext context) {
    //cityTimeInit();
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        title: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins4lst[0]),
            ),
          ],
        ),
        leading: IconButton(
          iconSize: 25,
          icon: const Icon(Icons.close, color: Colors.lightBlue),
          onPressed: () => Navigator.of(context).pop(),
          //onPressed: () => Navigator.pushNamed(context, mainroutes[0]),
        ),
        //backgroundColor: Colors.lightBlue.withValues(alpha:0.2),
        backgroundColor: Colors.transparent,
        actions: const [
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),
            Stack(
              children: [
                Align(
                  alignment: AlignmentGeometry.center,
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 2.2,
                    height: 200,
                    width: 200,
                    //width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            //'assets/mink/minkluzluz.webp',
                            'assets/mink/minkpinklok.png',
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.transparent
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 0, end: 0,
                  top: 50,
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 2.2,
                    height: 110,
                    width: 110,
                    //width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/mink/minkluzluz.webp',
                            //'assets/mink/minkpinklok.png',
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.transparent
                    ),
                  ),
                ),
              ],
            ),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[0]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[1]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[2]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[3]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      //borderRadius: BorderRadius.circular(25),
                      shape: BoxShape.rectangle,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                        child: AutoSizeText(
                          dogText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.7),
                        ),

                    ),
                    onTap: () {
                      isDogText = !isDogText;
                      setState(() {
                        isDogText == true
                            ? dogText = "\"BLUGOD\""
                            : dogText = "\"אלגמלכלב\"";
                      });
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      //borderRadius: BorderRadius.circular(25),
                      shape: BoxShape.rectangle,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                        child: AutoSizeText(
                          octocaText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.7),
                        ),
                    ),
                    onTap: () {
                      isOctocatText = !isOctocatText;
                      setState(() {
                        isOctocatText == true
                            ? octocaText = "osminog;"
                            : octocaText = ";זה לא אני";
                      });
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                          octopussyText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.7),
                        ),
                    ),
                    onTap: () {
                      isOctopussyText = !isOctopussyText;
                      setState(() {
                        isOctopussyText == true
                            ? octopussyText = "octopussy,"
                            : octopussyText =  ",ג'ולייטה";
                      });
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                          bitchText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.7),
                        ),
                    ),
                    onTap: () {
                      isBitchText = !isBitchText;
                      setState(() {
                        isBitchText == true
                            ? bitchText = "redbitch."
                            : bitchText = ".כלבדומא";
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
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(15),
                      shape: BoxShape.rectangle,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.white60,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                          complexText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.7),
                        ),
                    ),
                    onTap: () {
                      isComplexText = !isComplexText;
                      setState(() {
                        isComplexText == true
                            ? complexText = "מורכב"
                            : complexText = "COMPLEX";
                      });
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      //borderRadius: BorderRadius.circular(25),
                      shape: BoxShape.rectangle,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.white60,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                          simpleText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.8),
                        ),
                    ),
                    onTap: () {
                      isSimpleText = !isSimpleText;
                      setState(() {
                        isSimpleText == true
                            ? simpleText = "פשוט"
                            : simpleText = "Simple";
                      });
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                          breathText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.9),
                        ),
                    ),
                    onTap: () {
                      isBreathText = !isBreathText;
                      setState(() {
                        isBreathText == true
                            ? breathText = "נשימה"
                            : breathText = "Breath";
                      });
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                          silenceText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 2.0),
                        ),
                    ),
                    onTap: () {
                      isSilenceText = !isSilenceText;
                      setState(() {
                        isSilenceText == true
                            ? silenceText = "שתיקה"
                            : silenceText = "silence";
                      });
                    },
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.transparent,
              thickness: 5,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    _now = DateTime.now();
                    _personTime = _now;

                    //_planetsfullpersonList =
                    //_planetstransitList =
                    _planetsfulltransitList =
                        await PlanetsServices.getCurrentData(_now);

                    //_designTime = await AstrologyServices.getDesignTime(_now);
                    //emulate design time to now time to prevent blank
                    //_planetsfulldesignList =
                    //   await PlanetsServices.getCurrentData(_now);

                    _chironhex = _planetsfulltransitList.last;
                    _chirondesignhex = _chironhex;

                    _planetsfullpersonList = _planetsfulltransitList;
                    _planetsfulldesignList = _planetsfulltransitList;

                    for (int i = 0;
                        _planetsfulltransitList.length - 1 > i;
                        i++) {
                      _planetstransitList[i] = _planetsfulltransitList[i];
                      _planetspersonList[i] = _planetsfulltransitList[i];
                      _planetsdesignList[i] = _planetsfulltransitList[i];
                    }

                    _channelsList =
                        HDServices.getHDChannelsJustNow(_planetspersonList);

                    _personchannelsList = [];
                    _designchannelsList = [];

                    hdfinaldata = HDServices.getHDBasicData(_channelsList);
                    //_controlHDData(hdbasicdata);
                    _controlHDData(hdfinaldata);

                    //_centers = HDServices.getHDCenters(_channelsList);
                    _centers = HDServices.getHDCenters(_channelsList);

                    //_fearSentence = HDServices.getHDDefinedFears(_centers);
                    //_selfreminderSentence = HDServices.getSelfReminder();
                    _setDateTime(_now);

                    _planetsfulldisplayList = _planetstransitList;
                    _planethex = _planetsfulldisplayList[0];

                    _setCoins();

                    _controllerlinetext.text = _planethex.line!.toString();
                    _controllergatelinestory.text = coins384List[
                        (coins384List.indexOf(_planethex.gate!) +
                            _planethex.line!)];

                    switch (_previousPlanetIndex) {
                      case -1:
                        _previousPlanetIndex = 0;
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        break;
                      default:
                        _isPlanetSelectedList[_previousPlanetIndex] =
                            !_isPlanetSelectedList[_previousPlanetIndex];
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        _previousPlanetIndex = 0;
                    }

                    switch (_currentconstate) {
                      case 0:
                        _controllerconstate.jumpToPage(1);
                        _controllerconstate.jumpToPage(0);
                        _controllerrotationstate.jumpToPage(0);
                        break;
                      case 1:
                        _controllerconstate.jumpToPage(0);
                        break;
                      default:
                        _controllerconstate.jumpToPage(0);
                        break;
                    }

                    resetChartColor;
                    _resetgatesState();
                    _settransitgatesState();
                    _setChart(_centers);
                    _setgatesState();
                    _setEvolutionCoin();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: const Text('כעט',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _selectedtime = await TimeServices.selectTime(context);
                    setState(() {
                      _controllerTimePick.text = _selectedtime.format(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  child: const Text(
                    'ושעה',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _selectedDate = await TimeServices.selectDate(context);
                    //_formattedDate = DateFormat('MM/dd/yyyy').format(_selectedDate);
                    _formattedDate = _formatDate(_selectedDate);
                    setState(() {
                      //_controllerDatePick.text = "${_selectedDate.toLocal()}".split(' ')[0];
                      _controllerDatePick.text = _formattedDate;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  child: const Text('תאריך',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // _selectedDate by user pick
                    //_now = _selectedDate.applied(_selectedtime);
                    _personTime = _selectedDate.applied(_selectedtime);

                    _planetsfullpersonList =
                        await PlanetsServices.getCurrentData(_personTime);

                    _designTime =
                        await PlanetsServices.getDesignTime(_personTime);
                    _planetsfulldesignList =
                        await PlanetsServices.getCurrentData(_designTime);

                    _chironhex = _planetsfullpersonList.last;
                    _chirondesignhex = _planetsfulldesignList.last;

                    for (int i = 0;
                        _planetsfullpersonList.length - 1 > i;
                        i++) {
                      _planetspersonList[i] = _planetsfullpersonList[i];
                      _planetsdesignList[i] = _planetsfulldesignList[i];
                    }

                    _allplanetsList = _planetspersonList + _planetsdesignList;
                    _channelsList = HDServices.getHDChannels(_allplanetsList);
                    _personchannelsList =
                        HDServices.getHDChannels(_planetspersonList);
                    _designchannelsList =
                        HDServices.getHDChannels(_planetsdesignList);

                    hdfinaldata = HDServices.getHDBasicData(_channelsList);

                    _centers = HDServices.getHDCenters(_channelsList);

                    _controlHDData(hdfinaldata);

                    _setDateTime(_personTime);

                    _planetsfulldisplayList = _planetspersonList;
                    _planethex = _planetsfulldisplayList[0];

                    switch (_previousPlanetIndex) {
                      case -1:
                        _previousPlanetIndex = 0;
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        break;
                      default:
                        _isPlanetSelectedList[_previousPlanetIndex] =
                            !_isPlanetSelectedList[_previousPlanetIndex];
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        _previousPlanetIndex = 0;
                    }

                    switch (_currentconstate) {
                      case 0:
                        _controllerconstate.jumpToPage(1);
                        _controllerconstate.jumpToPage(0);
                        _controllerrotationstate.jumpToPage(0);
                        break;
                      case 1:
                        _controllerconstate.jumpToPage(0);
                        break;
                      default:
                        _controllerconstate.jumpToPage(0);
                        break;
                    }

                    // idk
                    resetChartColor();

                    _resetgatesState();
                    _setgatesState();
                    _setChart(_centers);
                    _setCoins();

                    _controllergatelinestory.text =
                        coins384List[(_planethex.gate! * 7) + _planethex.line!];

                    _controllerlinetext.text = _planethex.line.toString();

                    _setEvolutionCoin();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: const AutoSizeText('לפלוט',
                      maxFontSize: 25,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 70,
                  child: AutoSizeTextField(
                      minFontSize: 16,
                      readOnly: true,
                      decoration: InputDecoration.collapsed(
                          hintText: DateFormat.Hm().format(_now),
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      controller: _controllerTimePick,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 25,
                  width: 200,
                  child: AutoSizeTextField(
                      minFontSize: 16,
                      readOnly: true,
                      decoration: InputDecoration.collapsed(
                          //hintText: DateFormat('MM/dd/yyyy').format(_now),
                          hintText: _formatDate(_now),
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      controller: _controllerDatePick,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Divider(
              color: Colors.transparent,
              thickness: 5,
            ),
            Container(
              width: 150.0,
              height: 150.0,
              child: CarouselSlider(
                items: zooslider,
                carouselController: _controllercoin,
                options: CarouselOptions(
                    height: 95,
                    autoPlay: false,
                    onPageChanged: (indextop, reason) {
                      setState(() {
                        _currentmain = indextop;
                        _controllermaintext.text = maincoin[_currentmain];
                      });
                    }),
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 100,
                  child: AutoSizeTextField(
                    maxLines: 2,
                    minFontSize: 25,
                    fullwidth: false,
                    decoration: InputDecoration.collapsed(
                        //hintText: '${newCoinNames[0]} ${hexNamesList[0]}',
                        hintText: maincoin[0],
                        hintStyle: const TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllermaintext,
                    readOnly: false,
                  ),
                ),
              ],
            ),
            // start hd chart
            SizedBox(
              width: screenwidth * 0.8,
              height: 50,
              child: AutoSizeTextField(
                maxLines: 1,
                minFontSize: 15,
                maxFontSize: 25,
                fullwidth: false,
                decoration: InputDecoration.collapsed(
                    //hintText: '${newCoinNames[0]} ${hexNamesList[0]}',
                    hintText: 'טיהור אשם',
                    hintStyle: const TextStyle(color: Colors.grey)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                controller: _controllerchartname,
                readOnly: false,
              ),
            ),
            Container(
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
                opacity: opacityMainLevel,
                child: Stack(
                  children: [
                    PositionedDirectional(
                      end: 10,
                      top: 10,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  zoocoins[hdfinaldata.typeid!],
                                  //'assets/camog/dogstwogrey.gif',
                                ),
                                opacity: 1.0),
                          ),
                        ),
                      ),
                    ),

                    // pro file - Prefessional Elephant
                    Align(
                      alignment: Alignment.topRight,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          width: 55,
                          height: 55,
                          margin: const EdgeInsets.only(top: 100, right: 60),
                          //decoration: BoxDecoration(
                          //   color: Colors.red),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                    IconData(
                                        rt6iconshex[_planetsdesignList[1].line!],
                                        fontFamily: 'MaterialIcons'),
                                    color: Colors.red,
                                    size: 55),
                              ),
                              Center(
                                child: Text(
                                  _planetsdesignList[1].line!.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: timecolor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          width: 55,
                          height: 55,
                          margin: const EdgeInsets.only(top: 100, right: 5),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                    IconData(
                                        rt6iconshex[_planetspersonList[1].line!],
                                        fontFamily: 'MaterialIcons'),
                                    color: Colors.blue,
                                    size: 55),
                              ),
                              Center(
                                child: Text(
                                  _planetspersonList[1].line!.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: timecolor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    PositionedDirectional(
                      end: 5,
                      top: 140,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //color: Colors.black12,
                            image: DecorationImage(
                                image: AssetImage(
                                  zooprofiles[_planetspersonList[1].line!],
                                  //familyList[_planetspersonList[1].line!],
                                  //'assets/camog/dogstwogrey.gif',
                                  //'assets/camog/dogstwogrey.gif',
                                ),
                                opacity: 1.0),
                          ),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      end: 55,
                      top: 140,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  //familyList[_planetsdesignList[1].line!],
                                  zooprofiles[_planetsdesignList[1].line!],
                                  //'assets/camog/dogstwogrey.gif',
                                ),
                                opacity: 1.0),
                          ),
                        ),
                      ),
                    ),

                    PositionedDirectional(
                      end: 5,
                      top: 190,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: InkWell(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/camog/elephantclock.png',
                                    //'assets/camog/dogstwogrey.gif',
                                  ),
                                  opacity: 1.0),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              setChartState();

                              if (cardstate == 'zb') {
                                //print ('hd card state');

                                zbheadstate = headstate;
                                zbajnastate = ajnastate;
                                zbthroatstate = throatstate;
                                zbgstate = gstate;
                                zbsacralstate = sacralstate;
                                zbrootstate = rootstate;
                                zbheartstate = heartstate;
                                zbspleenstate = spleenstate;
                                zbsolarstate = solarstate;
                                cardstate = 'hd';

                                if (headstate == 3) {
                                  headstate = 5;
                                } else {
                                  headstate = 2;
                                }

                                if (ajnastate == 3) {
                                  ajnastate = 5;
                                } else {
                                  ajnastate = 3;
                                }

                                if (throatstate == 3) {
                                  throatstate = 5;
                                } else {
                                  throatstate = 6;
                                }

                                if (gstate == 3) {
                                  gstate = 5;
                                } else {
                                  gstate = 2;
                                }

                                if (rootstate == 3) {
                                  rootstate = 5;
                                } else {
                                  rootstate = 6;
                                }

                                if (heartstate == 3) {
                                  heartstate = 5;
                                } else {
                                  heartstate = 1;
                                }

                                if (sacralstate == 3) {
                                  sacralstate = 5;
                                } else {
                                  sacralstate = 1;
                                }

                                if (spleenstate == 3) {
                                  spleenstate = 5;
                                } else {
                                  spleenstate = 6;
                                }

                                if (solarstate == 3) {
                                  solarstate = 5;
                                } else {
                                  solarstate = 6;
                                }
                              } else {
                                //print ('zb card state');
                                headstate = zbheadstate;
                                ajnastate = zbajnastate;
                                throatstate = zbthroatstate;
                                gstate = zbgstate;
                                sacralstate = zbsacralstate;
                                rootstate = zbrootstate;
                                heartstate = zbheartstate;
                                spleenstate = zbspleenstate;
                                solarstate = zbsolarstate;
                                cardstate = 'zb';
                              }
                              for (int i = 0; gatestatelist.length > i; i++) {
                                //_isBoldList[i] = !_isBoldList[i];

                                switch (gatestatelist[i]) {
                                  case 0:
                                    gatestatelist[i] = 6;
                                    break;
                                  case 1:
                                    break;
                                  case 2:
                                    gatestatelist[i] = 5;
                                    break;
                                  case 3:
                                    gatestatelist[i] = 8;
                                    break;
                                  case 4:
                                    break;
                                  case 5:
                                    gatestatelist[i] = 2;
                                    break;
                                  case 6:
                                    gatestatelist[i] = 0;
                                    break;
                                  case 7:
                                    break;
                                  case 8:
                                    gatestatelist[i] = 3;
                                    break;
                                  default:
                                    gatestatelist[i] = 0;
                                    break;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),

                    // animals
                    PositionedDirectional(
                      start: 60,
                      top: 10,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: InkWell(
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/camog/zbgreencamel.png',
                                  ),
                                  opacity: 1.0),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              setComplexOnly();
                            });
                          },
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 60,
                      top: 100,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: InkWell(
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/camog/greendog.png',
                                    //'assets/camog/dogstwogrey.gif',
                                  ),
                                  opacity: 1.0),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              setSilenceOnly();
                            });
                          },
                        ),
                      ),
                    ),

                    // coins
                    PositionedDirectional(
                      start: 10,
                      top: 200,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CarouselSlider(
                              items: complexSlider,
                              carouselController: _controlComplexSlider,
                              options: CarouselOptions(
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1.0)),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 10,
                      top: 30,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CarouselSlider(
                              items: simpleSlider,
                              carouselController: _controlSimpleSlider,
                              options: CarouselOptions(
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1.0)),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 10,
                      top: 110,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CarouselSlider(
                              items: breathSlider,
                              carouselController: _controlBreathSlider,
                              options: CarouselOptions(
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1.0)),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 10,
                      bottom: 30,
                      child: Opacity(
                        opacity: opacityLevel,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CarouselSlider(
                              items: silenceSlider,
                              carouselController: _controlSilenceSlider,
                              options: CarouselOptions(
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1.0)),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(right: 100, top: 80),
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(90 / 360),
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[10]),
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
                        margin: const EdgeInsets.only(right: 100, bottom: 135),
                        child: Transform.rotate(
                          angle: -0.60,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[34]),
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
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[26]),
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
                        margin: const EdgeInsets.only(right: 166, top: 217),
                        child: Transform.rotate(
                          angle: -1.81,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[44]),
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
                        margin: const EdgeInsets.only(right: 115, top: 192),
                        child: Transform.rotate(
                          angle: 0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[16]),
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
                        margin: const EdgeInsets.only(right: 243, top: 295),
                        child: Transform.rotate(
                          angle: 0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[48]),
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
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[25]),
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
                        margin: const EdgeInsets.only(left: 105, top: 113),
                        child: Transform.rotate(
                          angle: -0.8,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[51]),
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
                        margin: const EdgeInsets.only(left: 234, top: 215),
                        child: Transform.rotate(
                          angle: -0.64,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[37]),
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
                        margin: const EdgeInsets.only(left: 208, top: 180),
                        child: Transform.rotate(
                          angle: -0.64,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[40]),
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
                        margin: const EdgeInsets.only(left: 82, bottom: 50),
                        child: Transform.rotate(
                          angle: -0.42,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[45]),
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
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[21]),
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
                        margin: const EdgeInsets.only(right: 120, top: 224),
                        child: Transform.rotate(
                          angle: 0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[20]),
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
                        margin: const EdgeInsets.only(right: 242, top: 328),
                        child: Transform.rotate(
                          angle: 0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[57]),
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
                        margin: const EdgeInsets.only(left: 121, top: 188),
                        child: Transform.rotate(
                          angle: -0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[35]),
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
                        margin: const EdgeInsets.only(left: 246, top: 290),
                        child: Transform.rotate(
                          angle: -0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[36]),
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
                        margin: const EdgeInsets.only(left: 121, top: 215),
                        child: Transform.rotate(
                          angle: -0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[12]),
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
                        margin: const EdgeInsets.only(left: 239, top: 315),
                        child: Transform.rotate(
                          angle: -0.55,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[22]),
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
                        margin: const EdgeInsets.only(right: 208, bottom: 98),
                        child: Transform.rotate(
                          angle: -1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[32]),
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
                        margin: const EdgeInsets.only(right: 211, bottom: 84),
                        child: Transform.rotate(
                          angle: -1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[28]),
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
                        margin: const EdgeInsets.only(right: 229, bottom: 69),
                        child: Transform.rotate(
                          angle: -1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[18]),
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
                        margin: const EdgeInsets.only(right: 100, bottom: 62),
                        child: Transform.rotate(
                          angle: -1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[54]),
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
                        margin: const EdgeInsets.only(right: 100, bottom: 47),
                        child: Transform.rotate(
                          angle: -1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[38]),
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
                        margin: const EdgeInsets.only(right: 100, bottom: 32),
                        child: Transform.rotate(
                          angle: -1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[58]),
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
                        margin: const EdgeInsets.only(left: 104, bottom: 59),
                        child: Transform.rotate(
                          angle: 1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[19]),
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
                        margin: const EdgeInsets.only(left: 104, bottom: 44),
                        child: Transform.rotate(
                          angle: 1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[39]),
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
                        margin: const EdgeInsets.only(left: 104, bottom: 29),
                        child: Transform.rotate(
                          angle: 1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[41]),
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
                        margin: const EdgeInsets.only(left: 235, bottom: 94),
                        child: Transform.rotate(
                          angle: 1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[49]),
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
                        margin: const EdgeInsets.only(left: 235, bottom: 79),
                        child: Transform.rotate(
                          angle: 1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[55]),
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
                        margin: const EdgeInsets.only(left: 235, bottom: 64),
                        child: Transform.rotate(
                          angle: 1.05,
                          child: CustomPaint(
                            foregroundPainter:
                                VerticalGatePainter(gatestate: gatestatelist[30]),
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
                              margin:
                                  const EdgeInsets.only(top: 110.0, left: 155.0),
                              child: CustomPaint(
                                foregroundPainter: HeartPainter(
                                    centerstate: heartstate,
                                    pickcolor: pickedColor),
                                willChange: true,
                                child: const SizedBox(
                                  height: 50,
                                  width: 72,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(left: 137, top: 105),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(left: 103, top: 152),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(left: 124, top: 130),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(left: 170, top: 158),
                            child: ClipOval(
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
                                    CustomPaint(
                                      foregroundPainter: HeadPainter(
                                          centerstate: headstate,
                                          pickcolor: pickedColor),
                                      //centercolorstate: headcolorstate),
                                      willChange: true,
                                      child: const SizedBox(
                                        height: 70,
                                        width: 80,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ClipOval(
                                              child: Text(
                                                '64',
                                                style: TextStyle(
                                                    backgroundColor:
                                                        _isBoldList[64]
                                                            ? Colors.white
                                                            : Colors.transparent,
                                                    fontSize: 11, // gatefont
                                                    fontWeight: _isBoldList[64]
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                            ),
                                            ClipOval(
                                              child: Text(
                                                '61',
                                                style: TextStyle(
                                                    backgroundColor:
                                                        _isBoldList[61]
                                                            ? Colors.white
                                                            : Colors.transparent,
                                                    fontSize: 11, // gatefont
                                                    fontWeight: _isBoldList[61]
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                            ),
                                            ClipOval(
                                              child: Text(
                                                '63',
                                                style: TextStyle(
                                                    backgroundColor:
                                                        _isBoldList[63]
                                                            ? Colors.white
                                                            : Colors.transparent,
                                                    fontSize: 11, // gatefont
                                                    fontWeight: _isBoldList[63]
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CustomPaint(
                                      foregroundPainter: VerticalGatePainter(
                                          gatestate: gatestatelist[17]),
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
                                      foregroundPainter: VerticalGatePainter(
                                          gatestate: gatestatelist[43]),
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
                                      foregroundPainter: VerticalGatePainter(
                                          gatestate: gatestatelist[11]),
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
                                child: CustomPaint(
                                  foregroundPainter: AjnaPainter(
                                      centerstate: ajnastate,
                                      pickcolor: pickedColor),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 70,
                                    width: 80,
                                  ),
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
                                        ClipOval(
                                          child: Text(
                                            '47',
                                            style: TextStyle(
                                                backgroundColor: _isBoldList[47]
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                fontSize: 11, // gatefont
                                                fontWeight: _isBoldList[47]
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4),
                                          child: ClipOval(
                                            child: Text(
                                              '24',
                                              style: TextStyle(
                                                  backgroundColor: _isBoldList[24]
                                                      ? Colors.white
                                                      : Colors.transparent,
                                                  fontSize: 11, // gatefont
                                                  fontWeight: _isBoldList[24]
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 2.0),
                                          child: ClipOval(
                                            child: Text(
                                              '4',
                                              style: TextStyle(
                                                  backgroundColor: _isBoldList[4]
                                                      ? Colors.white
                                                      : Colors.transparent,
                                                  fontSize: 11, // gatefont
                                                  fontWeight: _isBoldList[4]
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            ),
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
                                      ClipOval(
                                        child: Text(
                                          '17',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[17]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[17]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                      ClipOval(
                                        child: Text(
                                          '11',
                                          style: TextStyle(
                                              backgroundColor: _isBoldList[11]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontSize: 11, // gatefont
                                              fontWeight: _isBoldList[11]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  //width: 11,
                                  margin: const EdgeInsets.fromLTRB(0, 0, 2, 20),
                                  child: ClipOval(
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
                              child: CustomPaint(
                                foregroundPainter: ThroatPainter(
                                    centerstate: throatstate,
                                    pickcolor: pickedColor),
                                willChange: true,
                                child: const SizedBox(
                                  height: 72,
                                  width: 72,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                width: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipOval(
                                      child: Text(
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
                                    ),
                                    ClipOval(
                                      child: Text(
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
                                    ),
                                    ClipOval(
                                      child: Text(
                                        '56',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[56]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[56]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 63,
                                margin: const EdgeInsets.fromLTRB(0, 12, 1, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipOval(
                                      child: Text(
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
                                    ),
                                    ClipOval(
                                      child: Text(
                                        '35',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[35]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[35]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
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
                                margin: const EdgeInsets.fromLTRB(0, 28, 1, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipOval(
                                      child: Text(
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
                                    ),
                                    ClipOval(
                                      child: Text(
                                        '12',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[12]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[12]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 45,
                                margin: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipOval(
                                      child: Text(
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
                                    ),
                                    ClipOval(
                                      child: Text(
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
                                    ),
                                    ClipOval(
                                      child: Text(
                                        '33',
                                        style: TextStyle(
                                            backgroundColor: _isBoldList[33]
                                                ? Colors.white
                                                : Colors.transparent,
                                            fontSize: 11, // gatefont
                                            fontWeight: _isBoldList[33]
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                //width: 11,
                                margin: const EdgeInsets.only(top: 43, left: 51),
                                child: ClipOval(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
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
                                    foregroundPainter: VerticalGatePainter(
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
                                    foregroundPainter: VerticalGatePainter(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      margin: const EdgeInsets.only(top: 70),
                                      child: CustomPaint(
                                        foregroundPainter: VerticalGatePainter(
                                            gatestate: gatestatelist[15]),
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
                                      margin: const EdgeInsets.only(top: 80),
                                      child: CustomPaint(
                                        foregroundPainter: VerticalGatePainter(
                                            gatestate: gatestatelist[2]),
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
                                      margin: const EdgeInsets.only(top: 70),
                                      child: CustomPaint(
                                        foregroundPainter: VerticalGatePainter(
                                            gatestate: gatestatelist[46]),
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
                                child: CustomPaint(
                                  foregroundPainter: GPainter(
                                      centerstate: gstate,
                                      pickcolor: pickedColor),
                                  willChange: true,
                                  child: const SizedBox(
                                    height: 84,
                                    width: 84,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 30, top: 29),
                                  child: ClipOval(
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
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 13),
                                  child: ClipOval(
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
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 30, top: 29),
                                  child: ClipOval(
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
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 30, bottom: 29),
                                  child: ClipOval(
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
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 13),
                                  child: ClipOval(
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
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 30, bottom: 29),
                                  child: ClipOval(
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
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 54),
                                  child: ClipOval(
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
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 54),
                                  child: ClipOval(
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
                                margin: const EdgeInsets.only(top: 19, right: 78),
                                child: RotationTransition(
                                  turns: const AlwaysStoppedAnimation(-78 / 360),
                                  child: CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
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
                                margin:
                                    const EdgeInsets.only(top: 12, right: 145),
                                child: RotationTransition(
                                  turns: const AlwaysStoppedAnimation(-78 / 360),
                                  child: CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
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
                                margin: const EdgeInsets.only(top: 23, left: 80),
                                child: RotationTransition(
                                  turns: const AlwaysStoppedAnimation(78 / 360),
                                  child: CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
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
                                margin: const EdgeInsets.only(top: 16, left: 145),
                                child: RotationTransition(
                                  turns: const AlwaysStoppedAnimation(78 / 360),
                                  child: CustomPaint(
                                    foregroundPainter: VerticalGatePainter(
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
                                  child: CustomPaint(
                                    foregroundPainter: SacralPainter(
                                        centerstate: sacralstate,
                                        pickcolor: pickedColor),
                                    willChange: true,
                                    child: const SizedBox(
                                      height: 62,
                                      width: 65,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 35),
                                    child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 35),
                                    child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(left: 35, top: 46),
                                    child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 46),
                                    child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(right: 35, top: 46),
                                    child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(right: 46, top: 14),
                                    child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(left: 46, top: 30),
                                    child: ClipOval(
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
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(right: 46, top: 30),
                                    child: ClipOval(
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
                            Align(
                              alignment: Alignment.center,
                              child: CustomPaint(
                                foregroundPainter: RootPainter(
                                    centerstate: rootstate,
                                    pickcolor: pickedColor),
                                willChange: true,
                                child: const SizedBox(
                                  height: 65,
                                  width: 65,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(left: 35),
                                child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(right: 35),
                                child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(right: 45, top: 15),
                                child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(right: 45, top: 30),
                                child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(right: 45, top: 45),
                                child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(left: 45, top: 15),
                                child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(left: 45, top: 30),
                                child: ClipOval(
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
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(left: 45, top: 45),
                                child: ClipOval(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 240, bottom: 120),
                            child: CustomPaint(
                              foregroundPainter: SolarPainter(
                                  centerstate: solarstate,
                                  pickcolor: pickedColor),
                              willChange: true,
                              child: const SizedBox(
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 204, bottom: 153),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 251, bottom: 142),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 251, bottom: 164),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 303, bottom: 178),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 303, bottom: 130),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 277, bottom: 170),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(left: 277, bottom: 136),
                            child: ClipOval(
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
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 240, bottom: 120),
                            child: CustomPaint(
                              foregroundPainter: SpleenPainter(
                                  centerstate: spleenstate,
                                  pickcolor: pickedColor),
                              willChange: true,
                              child: const SizedBox(
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 204, bottom: 153),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 251, bottom: 142),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 251, bottom: 164),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 303, bottom: 178),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 303, bottom: 130),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 277, bottom: 170),
                            child: ClipOval(
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 277, bottom: 136),
                            child: ClipOval(
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
                        ),
                      ],
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(top: 72, right: 180),
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
                      bottom: 10,
                      child: Container(
                          height: 33,
                          width: 320,
                          //decoration: BoxDecoration(
                          //color: Colors.black,
                          //border: Border.all(color: Colors.white, width: 3),
                          //borderRadius: BorderRadius.circular(20),
                          //),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 120,
                                  child: AutoSizeTextField(
                                      minFontSize: 18,
                                      readOnly: true,
                                      decoration: InputDecoration.collapsed(
                                          hintText: DateFormat.Hm().format(_now),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey)),
                                      textAlign: TextAlign.center,
                                      controller: _controllerTimePick,
                                      style: TextStyle(
                                          //fontSize: 14,
                                          color: timecolor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Tooltip(
                                  message: 'dd mm yyyy',
                                  child: SizedBox(
                                    height: 20,
                                    width: 150,
                                    child: AutoSizeTextField(
                                        minFontSize: 18,
                                        readOnly: true,
                                        decoration: InputDecoration.collapsed(
                                            //hintText: DateFormat('MM/dd/yyyy').format(_now),
                                            hintText: _formatDate(_now),
                                            hintStyle: const TextStyle(
                                                color: Colors.grey)),
                                        textAlign: TextAlign.center,
                                        controller: _controllerDatePick,
                                        style: TextStyle(
                                            //fontSize: 14,
                                            color: timecolor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),

            // end hd chart
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/camog/bluedog.png')),
                  tooltip: 'זמן לעדכן',
                  onPressed: () async {
                    _planetsfullpersonList =
                        await PlanetsServices.getCurrentData(_personTime);

                    _designTime =
                        await PlanetsServices.getDesignTime(_personTime);
                    _planetsfulldesignList =
                        await PlanetsServices.getCurrentData(_designTime);

                    //_planetspersonList = _planetsfullpersonList;
                    //_planetsdesignList = _planetsfulldesignList;

                    for (int i = 0;
                        _planetsfullpersonList.length - 1 > i;
                        i++) {
                      _planetspersonList[i] = _planetsfullpersonList[i];
                      _planetsdesignList[i] = _planetsfulldesignList[i];
                    }

                    _chironhex = _planetsfullpersonList.last;
                    _chirondesignhex = _planetsfulldesignList.last;

                    //_planetspersonList.removeLast();
                    //_planetsdesignList.removeLast();

                    _allplanetsList = _planetspersonList + _planetsdesignList;
                    _channelsList = HDServices.getHDChannels(_allplanetsList);
                    _personchannelsList =
                        HDServices.getHDChannels(_planetspersonList);
                    _designchannelsList =
                        HDServices.getHDChannels(_planetsdesignList);

                    //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);
                    hdfinaldata = HDServices.getHDBasicData(_channelsList);

                    _centers = HDServices.getHDCenters(_channelsList);
                    //_fearSentence = HDServices.getHDDefinedFears(_centers);
                    //_selfreminderSentence = HDServices.getSelfReminder();
                    //_selfreminder = _timeselfreminder;

                    //_controlHDData(hdbasicdata);
                    _controlHDData(hdfinaldata);
                    //hdfinaldata = HDServices.getHDBasicData(_channelsList);

                    //_setDateTime(_now);
                    _setDateTime(_personTime);

                    //_formattedDate = DateFormat('MM/dd/yyyy').format(_now);
                    //_formattedTime = DateFormat.Hms().format(_now);
                    //_controllerTime.text = 'text $_formattedTime $_formattedDate';

                    _planetsfulldisplayList = _planetspersonList;
                    _planethex = _planetsfulldisplayList[0];
                    //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

                    _setCoins();

                    //_hexalignedList = hexagramAlignment(_planethex.gate!);

                    //_controllertop.jumpToPage(_hexalignedList[0]);
                    //_controllermid.jumpToPage(_hexalignedList[1]);
                    //_controllerbot.jumpToPage(_hexalignedList[2]);

                    _controllerlinetext.text = _planethex.line!.toString();
                    _controllergatelinestory.text = coins384List[
                        (coins384List.indexOf(_planethex.gate!) +
                            _planethex.line!)];

                    switch (_previousPlanetIndex) {
                      case -1:
                        _previousPlanetIndex = 0;
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        break;
                      default:
                        _isPlanetSelectedList[_previousPlanetIndex] =
                            !_isPlanetSelectedList[_previousPlanetIndex];
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        _previousPlanetIndex = 0;
                    }

                    switch (_currentconstate) {
                      case 0:
                        _controllerconstate.jumpToPage(1);
                        _controllerconstate.jumpToPage(0);
                        _controllerrotationstate.jumpToPage(0);
                        break;
                      case 1:
                        _controllerconstate.jumpToPage(0);
                        break;
                      default:
                        _controllerconstate.jumpToPage(0);
                        break;
                    }

                    resetChartColor();
                    _resetgatesState();
                    _setgatesState();
                    _setChart(_centers);

                    _setEvolutionCoin();

                    //setState(() {});
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/coins/complex.png')),
                  tooltip: 'העלאה',
                  onPressed: () {
                    _setupdown = true;
                    controlSetTime(_setupdown);
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/coins/silence.png')),
                  tooltip: 'הורדה',
                  onPressed: () {
                    _setupdown = false;
                    controlSetTime(_setupdown);
                  },
                ),
                const SizedBox(width: 5),
                DropdownButton(
                  underline: DropdownButtonHideUnderline(child: Container()),
                  value: _settimestamp,
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  items: timecoinsDropDownLst,
                  onChanged: (String? newsettimestamp) {
                    setState(() {
                      _settimestamp = newsettimestamp!;
                    });
                  },
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 15,
                  width: 70,
                  child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      readOnly: false,
                      decoration:
                          const InputDecoration.collapsed(hintText: '1'),
                      controller: _controllerSetTime,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                ),
              ],
            ),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenwidth / 3,
                  child: Slider(
                    value: opacityMainLevel,
                    min: 0,
                    max: 1,
                    //divisions: values.length - 1,
                    //label: opacityLevel.toString(),
                    activeColor: Colors.blue,
                    inactiveColor: Colors.red,
                    onChanged: (double value) {
                      setState(() {
                        opacityMainLevel = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: screenwidth / 3,
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
              ],
            ),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildChannelsPopUp(context),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text('תנו לאיות',
                        style: TextStyle(fontSize: 13, color: Colors.white))),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildDataPopUp(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      //'Rotate Design',
                      'זמן עיצוב',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Center(
                  child: CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: screenwidth / 60,
                    //innerRadius: -1,
                    initialAngle: 4.55,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(14, (index) {
                      return CircleAvatar(
                        //backgroundColor: Colors.black12,
                        backgroundColor: planetscolorList[index],
                        minRadius: 1,
                        maxRadius: 15,
                        foregroundImage: AssetImage(planetsfullList[index]),
                      );
                    }),
                  ),
                ),
                Center(
                  child: CircleList(
                    innerRadius: screenwidth / 60 + 70,
                    initialAngle: 4.55,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(14, (index) {
                      return Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          //color: revZodiacColorList[index],
                          image: DecorationImage(
                            image: AssetImage(zodiacSwephImagelist[
                                _planetsfullpersonList[index].zodiacid!]),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.blue),
                        ),
                      );
                    }),
                  ),
                ),
                Center(
                  child: CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: screenwidth / 60 + 130,
                    initialAngle: 4.55,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(14, (index) {
                      return Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.blue)),
                        child: Center(
                          child: AutoSizeText(
                              _planetsfullpersonList[index].gateline!,
                              minFontSize: 10,
                              maxFontSize: 12,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 70,
                  child: AutoSizeTextField(
                      minFontSize: 16,
                      readOnly: true,
                      decoration: InputDecoration.collapsed(
                          hintText: DateFormat.Hm().format(_now),
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      controller: _controllerTimePick,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 25,
                  width: 200,
                  child: AutoSizeTextField(
                      minFontSize: 16,
                      readOnly: true,
                      decoration: InputDecoration.collapsed(
                          //hintText: DateFormat('MM/dd/yyyy').format(_now),
                          hintText: _formatDate(_now),
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      controller: _controllerDatePick,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/camog/bluedog.png')),
                  tooltip: 'זמן לעדכן',
                  onPressed: () async {
                    _planetsfullpersonList =
                        await PlanetsServices.getCurrentData(_personTime);

                    _designTime =
                        await PlanetsServices.getDesignTime(_personTime);
                    _planetsfulldesignList =
                        await PlanetsServices.getCurrentData(_designTime);

                    //_planetspersonList = _planetsfullpersonList;
                    //_planetsdesignList = _planetsfulldesignList;

                    for (int i = 0;
                        _planetsfullpersonList.length - 1 > i;
                        i++) {
                      _planetspersonList[i] = _planetsfullpersonList[i];
                      _planetsdesignList[i] = _planetsfulldesignList[i];
                    }

                    _chironhex = _planetsfullpersonList.last;
                    _chirondesignhex = _planetsfulldesignList.last;

                    //_planetspersonList.removeLast();
                    //_planetsdesignList.removeLast();

                    _allplanetsList = _planetspersonList + _planetsdesignList;
                    _channelsList = HDServices.getHDChannels(_allplanetsList);
                    _personchannelsList =
                        HDServices.getHDChannels(_planetspersonList);
                    _designchannelsList =
                        HDServices.getHDChannels(_planetsdesignList);

                    //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);
                    hdfinaldata = HDServices.getHDBasicData(_channelsList);

                    _centers = HDServices.getHDCenters(_channelsList);
                    //_fearSentence = HDServices.getHDDefinedFears(_centers);
                    //_selfreminderSentence = HDServices.getSelfReminder();
                    //_selfreminder = _timeselfreminder;

                    //_controlHDData(hdbasicdata);
                    _controlHDData(hdfinaldata);
                    //hdfinaldata = HDServices.getHDBasicData(_channelsList);

                    //_setDateTime(_now);
                    _setDateTime(_personTime);

                    //_formattedDate = DateFormat('MM/dd/yyyy').format(_now);
                    //_formattedTime = DateFormat.Hms().format(_now);
                    //_controllerTime.text = 'text $_formattedTime $_formattedDate';

                    _planetsfulldisplayList = _planetspersonList;
                    _planethex = _planetsfulldisplayList[0];
                    //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

                    _setCoins();

                    //_hexalignedList = hexagramAlignment(_planethex.gate!);

                    //_controllertop.jumpToPage(_hexalignedList[0]);
                    //_controllermid.jumpToPage(_hexalignedList[1]);
                    //_controllerbot.jumpToPage(_hexalignedList[2]);

                    _controllerlinetext.text = _planethex.line!.toString();
                    _controllergatelinestory.text = coins384List[
                        (coins384List.indexOf(_planethex.gate!) +
                            _planethex.line!)];

                    switch (_previousPlanetIndex) {
                      case -1:
                        _previousPlanetIndex = 0;
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        break;
                      default:
                        _isPlanetSelectedList[_previousPlanetIndex] =
                            !_isPlanetSelectedList[_previousPlanetIndex];
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        _previousPlanetIndex = 0;
                    }

                    switch (_currentconstate) {
                      case 0:
                        _controllerconstate.jumpToPage(1);
                        _controllerconstate.jumpToPage(0);
                        _controllerrotationstate.jumpToPage(0);
                        break;
                      case 1:
                        _controllerconstate.jumpToPage(0);
                        break;
                      default:
                        _controllerconstate.jumpToPage(0);
                        break;
                    }

                    resetChartColor();
                    _resetgatesState();
                    _setgatesState();
                    _setChart(_centers);

                    _setEvolutionCoin();

                    //setState(() {});
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/coins/complex.png')),
                  tooltip: 'העלאה',
                  onPressed: () {
                    _setupdown = true;
                    controlSetTime(_setupdown);
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/coins/silence.png')),
                  tooltip: 'הורדה',
                  onPressed: () {
                    _setupdown = false;
                    controlSetTime(_setupdown);
                  },
                ),
                const SizedBox(width: 5),
                DropdownButton(
                  underline: DropdownButtonHideUnderline(child: Container()),
                  value: _settimestamp,
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  items: timecoinsDropDownLst,
                  onChanged: (String? newsettimestamp) {
                    setState(() {
                      _settimestamp = newsettimestamp!;
                    });
                  },
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 15,
                  width: 70,
                  child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      readOnly: false,
                      decoration:
                          const InputDecoration.collapsed(hintText: '1'),
                      controller: _controllerSetTime,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                ),
              ],
            ),
            Stack(
              children: [
                Center(
                  child: CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: screenwidth / 60,
                    //innerRadius: -1,
                    initialAngle: 4.55,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(14, (index) {
                      return CircleAvatar(
                        //backgroundColor: Colors.black12,
                        backgroundColor: planetscolorList[index],
                        minRadius: 1,
                        maxRadius: 15,
                        foregroundImage: AssetImage(planetsfullList[index]),
                      );
                    }),
                  ),
                ),
                Center(
                  child: CircleList(
                    innerRadius: screenwidth / 60 + 70,
                    initialAngle: 4.55,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(14, (index) {
                      return Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          //color: revZodiacColorList[index],
                          image: DecorationImage(
                            image: AssetImage(zodiacSwephImagelist[
                                _planetsfulldesignList[index].zodiacid!]),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.red),
                        ),
                      );
                    }),
                  ),
                ),
                Center(
                  child: CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: screenwidth / 60 + 130,
                    initialAngle: 4.55,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(14, (index) {
                      return Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.red)),
                        child: Center(
                          child: AutoSizeText(
                              _planetsfulldesignList[index].gateline!,
                              minFontSize: 10,
                              maxFontSize: 12,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),

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
                              //color: reversedtopcoincolor[index].withValues(alpha:wheelgateopacity),
                              color: wheelgatescolor[index],
                              //color: wheelgatescolor[index].withValues(alpha:wheelgateopacity),
                              //color: revwheelgatescolor[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 0.5, color: Colors.black)),
                                  //width: 0.5, color: reversedtopcoincolor[index])),
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
                        //setState(() {
                        //});
                      },
                    );
                  }),
                ),
              ],
            ),

            const Divider(
              color: Colors.blue,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.recycling),
                  tooltip: 'להחליף ארנק',
                  onPressed: () {
                    switch (_gatesListplace) {
                      case 0:
                        coins64List = rtbimBox65List;
                        _gatesListplace++;
                        break;
                      case 1:
                        coins64List = hexRTNames65lst;
                        _gatesListplace++;
                        break;
                      case 2:
                        coins64List = new_hexRTNames65lst;
                        _gatesListplace++;
                        break;
                      case 3:
                        coins64List = rtwallets65lst_heb;
                        _gatesListplace++;
                        break;
                      case 4:
                        coins64List = new_rtbbwallet65lst_heb;
                        _gatesListplace++;
                        break;
                      case 5:
                        coins64List = hdgates65lst_heb;
                        _gatesListplace++;
                        break;
                      case 6:
                        coins64List = rtgateswallet65lst_heb;
                        _gatesListplace++;
                        break;
                      case 7:
                        coins64List = new_hexRTNames65lst;
                        _gatesListplace++;
                        break;
                      case 8:
                        coins64List = hexNames65lst;
                        _gatesListplace++;
                        break;
                      case 9:
                        coins64List = hdgates65lst;
                        _gatesListplace++;
                        break;
                      case 10:
                        coins64List = iChingEng65lst;
                        _gatesListplace++;
                        break;
                      case 11:
                        coins64List = rtminmic65List;
                        _linesListplace = 0;
                        break;
                      default:
                        break;
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildGatesDialog(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      //'Wallets',
                      'ארנקים',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildLinesDialog(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      //'Coins',
                      'מטבעות',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                IconButton(
                  icon: const Icon(Icons.recycling),
                  tooltip: 'להחליף מטבעות',
                  onPressed: () {
                    switch (_linesListplace) {
                      case 0:
                        coins384List = rtmix390lst;
                        _linesListplace++;
                        break;
                      case 1:
                        coins384List = hdmixlines390lst;
                        _linesListplace++;
                        break;
                      case 2:
                        coins384List = hdmixlines390lstHeb;
                        _linesListplace++;
                        break;
                      case 3:
                        coins384List = rtmix390lstHeb;
                        _linesListplace = 0;
                        break;
                      default:
                        break;
                    }
                  },
                ),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            ToggleButtons(
              direction: Axis.horizontal,
              constraints: BoxConstraints.expand(
                  width: screenwidth * 0.9 / 14,
                  height: screenheight * 0.9 / 14),
              borderWidth: 0.5,
              hoverColor: Colors.black,
              //borderRadius: BorderRadius.circular(20),
              fillColor: Colors.blue,
              isSelected: _isPlanetSelectedList,
              onPressed: (int index) async {
                setState(() {
                  switch (_previousPlanetIndex) {
                    case -1:
                      _previousPlanetIndex = index;
                      _isPlanetSelectedList[index] =
                          !_isPlanetSelectedList[index];
                      break;
                    default:
                      _isPlanetSelectedList[_previousPlanetIndex] =
                          !_isPlanetSelectedList[_previousPlanetIndex];
                      _isPlanetSelectedList[index] =
                          !_isPlanetSelectedList[index];
                      _previousPlanetIndex = index;
                      break;
                  }

                  _planethex = _planetsfulldisplayList[index];
                  //_planethex = _planetsList[index];
                  //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);
                  //_hexsentence = LineSentenceList[_planethex.gate!];

                  _setCoins();

                  //_hexalignedList = hexagramAlignment(_planethex.gate!);

                  //_controllertop.jumpToPage(_hexalignedList[0]);
                  //_controllermid.jumpToPage(_hexalignedList[1]);
                  //_controllerbot.jumpToPage(_hexalignedList[2]);

                  _controllerlinetext.text = _planethex.line!.toString();
                  _currentline = _planethex.line!;

                  _controllergatelinestory.text = coins384List[
                      (coins384List.indexOf(_planethex.gate!) +
                          _planethex.line!)];
                });
              },
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/sun.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/earth.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/northnode.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/southnode.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/moon.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/mercury.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/venus.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/mars.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/jupiter.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/saturn.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/uranus.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/neptune.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/pluto.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CarouselSlider(
                    items: mixHexagramSlidersBol,
                    carouselController: _controllerconstate,
                    options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexconstate, reason) {
                          setState(() {
                            _currentconstate = indexconstate;

                            switch (_currentconstate) {
                              case 0:
                                _planetsfulldisplayList =
                                    _planetsfullpersonList;

                                _controlPlanetHexagramData(
                                    _planetsfulldisplayList);

                                _setDateTime(_personTime);

                                _controllerPlanetType.text = 'אחר כך לחשוב';

                                _controllerrotationstate.jumpToPage(0);
                                break;
                              case 1:
                                _planetsfulldisplayList =
                                    _planetsfulldesignList;
                                _controlPlanetHexagramData(
                                    _planetsfulldisplayList);

                                _setDateTime(_designTime);

                                _controllerPlanetType.text = 'קודם לחיות';

                                _controllerrotationstate.jumpToPage(3);
                                break;
                              default:
                                //_planetsList = _planetspersonList;

                                _controlPlanetHexagramData(
                                    _planetsfullpersonList);
                                _setDateTime(_personTime);

                                break;
                            }
                          });
                        }),
                  ),
                ),
                const SizedBox(width: 20),
                Tooltip(
                  message: zodiacSwephNameHeblist[_planethex.zodiacid!],
                  child: Container(
                    width: 80,
                    height: 80,
                    //margin: const EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(
                            zodiacSwephImagelist[_planethex.zodiacid!]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          //Colors.purple.shade900,
                          //Colors.purple.shade100,
                          zodiacSwephGradeColorlist[_planethex.zodiacid! * 2],
                          zodiacSwephGradeColorlist[
                              _planethex.zodiacid! * 2 + 1],
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage(hdlinesplanet[
                              (hdlinesplanet.indexOf(_planethex.gateline!)) +
                                  1]),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        ///color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage(hdlinesplanet[
                              (hdlinesplanet.indexOf(_planethex.gateline!)) +
                                  2]),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Container(
                    width: 35,
                    height: 35,
                    //margin: const EdgeInsets.only(top: 20, left: 40),
                    child: AutoSizeTextField(
                      fullwidth: false,
                      minFontSize: 30,
                      maxFontSize: 35,
                      decoration: const InputDecoration.collapsed(
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        //fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllergatetext,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                Container(
                    width: 35,
                    height: 35,
                    //margin: const EdgeInsets.only(top: 20, left: 70),
                    child: AutoSizeTextField(
                      fullwidth: false,
                      minFontSize: 20,
                      maxFontSize: 25,
                      decoration: const InputDecoration.collapsed(
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        //fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllerlinetext,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: midcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: thirdcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinmidthirdtext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: newcoinsHeb4lst[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinmidsecondtext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      minFontSize: 10,
                      maxFontSize: 30,
                      decoration: InputDecoration.collapsed(
                          hintText: midcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: firstcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinmidfirsttext,
                      readOnly: true,
                    )),
              ],
            ),
            const SizedBox(height: 5),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: botcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: thirdcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinbotthirdtext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: botcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinbotsecondtext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      minFontSize: 10,
                      maxFontSize: 30,
                      decoration: InputDecoration.collapsed(
                          hintText: botcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: firstcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinbotfirsttext,
                      readOnly: true,
                    )),
              ],
            ),
            const SizedBox(height: 5),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: topcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: thirdcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercointopthirdtext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: topcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercointopsecondtext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: screenwidth * 0.33,
                    child: AutoSizeTextField(
                      minFontSize: 10,
                      maxFontSize: 30,
                      decoration: InputDecoration.collapsed(
                          hintText: topcoinnamelist[0],
                          hintStyle: const TextStyle(color: Colors.blue)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: firstcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercointopfirsttext,
                      readOnly: true,
                    )),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            Container(
                width: screenwidth,
                height: 270,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Flex(direction: Axis.vertical, children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                 
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minHeight: 10,
                                  minWidth: 10,
                                  maxHeight: 100,
                                  maxWidth: 100,
                                ),
                                child: CarouselSlider(
                                  items: mainSlider,
                                  carouselController: _controllertop,
                                  options: CarouselOptions(
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      aspectRatio: 1.3,
                                      onPageChanged: (indextop, reason) {
                                        setState(() {
                                          _currenttop = indextop;

                                          _hexagramVal =
                                              ((_currenttop + 1) * 100 +
                                                  (_currentmid + 1) * 10 +
                                                  (_currentbot + 1));

                                          _carouselvalueindex =
                                              hexCarouselWheelOrderList
                                                  .indexOf(_hexagramVal);

                                          _chosenhex = orderHexagramsWheel[
                                              _carouselvalueindex];

                                          _controllergatetext.text =
                                              _chosenhex.toString();

                                          // idonotknow _currentline
                                          //_controllergatelinestory.text = 'test';
                                          _controllergatelinestory.text =
                                              coins384List[(coins384List
                                                      .indexOf(_chosenhex) +
                                                  _currentline)];

                                          //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);
                                          //_hexsentence = LineSentenceList[_planethex.gate!];

                                          //_controllertopfirsttext.text = _hexsentence.adjective!;

                                          _controllercoinsttext.text =
                                              coins64List[_chosenhex];
                                          //rtminmicList[_chosenhex];
                                          //_controllertopsecondtext.text = _hexsentence.subject!;
                                          //_controllertopthirdtext.text = _hexsentence.verb!;
                                          //_controllertopfourthtext.text = _hexsentence.adverb!;

                                          thirdcolor =
                                              //controlCollor(coinsHeb4lst[_currenttop]);
                                              controlCollor(_currenttop);
                                          _controllercointopthirdtext.text =
                                              topcoinnamelist[_currenttop];
                                          _controllercoinmidthirdtext.text =
                                              midcoinnamelist[_currenttop];
                                          _controllercoinbotthirdtext.text =
                                              botcoinnamelist[_currenttop];
                                        });
                                      }),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: thirdcolor,
                                  child: const AutoSizeText('6',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: thirdcolor,
                                  child: const AutoSizeText('5',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                      IconData(rt6iconshex[6],
                                          fontFamily: 'MaterialIcons'),
                                      color: thirdcolor),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                      IconData(rt6iconshex[5],
                                          fontFamily: 'MaterialIcons'),
                                      color: thirdcolor),
                                ),
                              ],
                            ),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                InkWell(
                                  child: Container(
                                    width: 80,
                                    height: 30,
                                    color: thirdcolor,
                                    child: AutoSizeText(coinssidenamelist[6],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black)),
                                  ),
                                  onTap: () {
                                    isFamilyText = !isFamilyText;
                                    setState(() {
                                      isFamilyText == true
                                          ? coinssidenamelist = rt6HEbcoins
                                          : coinssidenamelist = rt6coins;
                                    });
                                  },
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  color: thirdcolor,
                                  child: AutoSizeText(coinssidenamelist[5],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minHeight: 10,
                                  minWidth: 10,
                                  maxHeight: 100,
                                  maxWidth: 100,
                                ),
                                child: CarouselSlider(
                                  items: mainSlider,
                                  carouselController: _controllermid,
                                  options: CarouselOptions(
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      aspectRatio: 1.3,
                                      onPageChanged: (indexmid, reason) {
                                        setState(() {
                                          _currentmid = indexmid;

                                          _hexagramVal =
                                              ((_currenttop + 1) * 100 +
                                                  (_currentmid + 1) * 10 +
                                                  (_currentbot + 1));

                                          _carouselvalueindex =
                                              hexCarouselWheelOrderList
                                                  .indexOf(_hexagramVal);

                                          _chosenhex = orderHexagramsWheel[
                                              _carouselvalueindex];

                                          _controllergatetext.text =
                                              _chosenhex.toString();

                                          //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

                                          _controllercoinsttext.text =
                                              coins64List[_chosenhex];

                                          //_controllertopfirsttext.text = _hexsentence.adjective!;
                                          //_controllertopsecondtext.text = _hexsentence.subject!;
                                          //_controllertopthirdtext.text = _hexsentence.verb!;
                                          //_controllertopfourthtext.text = _hexsentence.adverb!;

                                          _controllergatelinestory.text =
                                              coins384List[(coins384List
                                                      .indexOf(_chosenhex) +
                                                  _currentline)];

                                          secondcolor =
                                              //controlCollor(coinsHeb4lst[_currentmid]);
                                              controlCollor(_currentmid);

                                          _controllercointopsecondtext.text =
                                              topcoinnamelist[_currentmid];
                                          _controllercoinmidsecondtext.text =
                                              midcoinnamelist[_currentmid];
                                          _controllercoinbotsecondtext.text =
                                              botcoinnamelist[_currentmid];
                                        });
                                      }),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: secondcolor,
                                  child: const AutoSizeText('4',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: secondcolor,
                                  child: const AutoSizeText('3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                      IconData(rt6iconshex[4],
                                          fontFamily: 'MaterialIcons'),
                                      color: secondcolor),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                      IconData(rt6iconshex[3],
                                          fontFamily: 'MaterialIcons'),
                                      color: secondcolor),
                                ),
                              ],
                            ),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 80,
                                  height: 30,
                                  color: secondcolor,
                                  child: AutoSizeText(coinssidenamelist[4],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  color: secondcolor,
                                  child: AutoSizeText(coinssidenamelist[3],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minHeight: 10,
                                  minWidth: 10,
                                  maxHeight: 100,
                                  maxWidth: 100,
                                ),
                                child: CarouselSlider(
                                  items: mainSlider,
                                  carouselController: _controllerbot,
                                  options: CarouselOptions(
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      aspectRatio: 1.3,
                                      onPageChanged: (indexbot, reason) {
                                        setState(() {
                                          _currentbot = indexbot;
                                          _hexagramVal =
                                              ((_currenttop + 1) * 100 +
                                                  (_currentmid + 1) * 10 +
                                                  (_currentbot + 1));

                                          _carouselvalueindex =
                                              hexCarouselWheelOrderList
                                                  .indexOf(_hexagramVal);

                                          _chosenhex = orderHexagramsWheel[
                                              _carouselvalueindex];

                                          _controllergatetext.text =
                                              _chosenhex.toString();

                                          //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

                                          _controllercoinsttext.text =
                                              coins64List[_chosenhex];
                                          //_controllertopfirsttext.text = _hexsentence.adjective!;
                                          //_controllertopsecondtext.text = _hexsentence.subject!;
                                          //_controllertopthirdtext.text = _hexsentence.verb!;
                                          //_controllertopfourthtext.text = _hexsentence.adverb!;

                                          _controllergatelinestory.text =
                                              coins384List[(coins384List
                                                      .indexOf(_chosenhex) +
                                                  _currentline)];

                                          firstcolor =
                                              //controlCollor(coinsHeb4lst[_currentbot]);
                                              controlCollor(_currentbot);

                                          _controllercointopfirsttext.text =
                                              topcoinnamelist[_currentbot];
                                          _controllercoinmidfirsttext.text =
                                              midcoinnamelist[_currentbot];
                                          _controllercoinbotfirsttext.text =
                                              botcoinnamelist[_currentbot];
                                        });
                                      }),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: firstcolor,
                                  child: const AutoSizeText('2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: firstcolor,
                                  child: const AutoSizeText('1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                      IconData(rt6iconshex[2],
                                          fontFamily: 'MaterialIcons'),
                                      shadows: const [
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 15.0)
                                      ],
                                      color: firstcolor),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                      IconData(rt6iconshex[1],
                                          fontFamily: 'MaterialIcons'),
                                      color: firstcolor,
                                      size: 10),
                                ),
                              ],
                            ),
                            Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 80,
                                  height: 30,
                                  color: firstcolor,
                                  child: AutoSizeText(coinssidenamelist[2],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  color: firstcolor,
                                  child: AutoSizeText(coinssidenamelist[1],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                      ]),
                    ),
                  ],
                )),
            const Divider(
              color: Colors.blue,
            ),
            SizedBox(
              //width: screenwidth / 1.7,
              width: screenwidth / 1.5,
              child: AutoSizeTextField(
                minLines: 2,
                maxLines: 4,
                minFontSize: 18,
                maxFontSize: 18,
                fullwidth: true,
                decoration: const InputDecoration.collapsed(
                    //hintText: LineSentenceList[0],
                    hintText: 'אוכל לאיות',
                    hintStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                controller: _controllercoinsttext,
                readOnly: false,
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            SizedBox(
                //width: screenheight / 3,
                width: screenwidth / 1.5,
                child: AutoSizeTextField(
                  minLines: 3,
                  maxLines: 4,
                  minFontSize: 15,
                  maxFontSize: 15,
                  fullwidth: true,
                  decoration: const InputDecoration.collapsed(
                      //hintText: 'Rotating Coins Story',
                      hintText: 'תוסף לאיות',
                      hintStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  controller: _controllergatelinestory,
                  readOnly: false,
                )),
            const Divider(
              color: Colors.blue,
            ),

            // rt evolution
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 10,
                minWidth: 10,
                maxHeight: screenheight * 0.25,
                maxWidth: screenwidth,
              ),
              //child: EvolutionContainer(colorinsilence: Colors.red, colorinbreath: Colors.yellow,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color:
                              Colors.red, //                   <--- border color
                          width: 1.0,
                        ),
                        image: DecorationImage(
                            //image: AssetImage(newminmaxcoins[index]),
                            image: AssetImage('assets/camog/zbredog.png'),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withValues(alpha:1.0),
                              BlendMode.modulate,
                            ))),
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(_inbodyicon, color: _inbodycolor),
                    onPressed: () {},
                    //onPressed: () => Navigator.pushNamed(context, mainroutes[0]),
                  ),
                  IconButton(
                      iconSize: 50,
                      icon: Icon(_inpersonicon, color: _inpersoncolor),
                      onPressed: () {}),
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color:
                              Colors.blue, //                   <--- border color
                          width: 4.0,
                        ),
                        image: DecorationImage(
                            //image: AssetImage(newminmaxcoins[index]),
                            image: AssetImage('assets/camog/zbluedog.png'),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withValues(alpha:1.0),
                              BlendMode.modulate,
                            ))),
                  ),
                ],
              ),
              //  colorinsimple: Colors.green, colorincomplex: Colors.blue)
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 10,
                minWidth: 10,
                maxHeight: screenheight * 0.25,
                maxWidth: screenwidth,
              ),
              //child: EvolutionContainer(colorinsilence: Colors.red, colorinbreath: Colors.yellow,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors
                              .yellow, //                   <--- border color
                          width: 2.0,
                        ),
                        image: DecorationImage(
                            //image: AssetImage(newminmaxcoins[index]),
                            image: AssetImage(
                                'assets/camog/zbyellowoctopussy.png'),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withValues(alpha:1.0),
                              BlendMode.modulate,
                            ))),
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(_exbodyicon, color: _exbodycolor),
                    onPressed: () {},
                    //onPressed: () => Navigator.pushNamed(context, mainroutes[0]),
                  ),
                  IconButton(
                      iconSize: 50,
                      icon: Icon(_expersonicon, color: _expersoncolor),
                      onPressed: () {}
                      //onPressed: () => Navigator.pushNamed(context, mainroutes[0]),
                      ),
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors
                              .green, //                   <--- border color
                          width: 3.0,
                        ),
                        image: DecorationImage(
                            //image: AssetImage(newminmaxcoins[index]),
                            image:
                                AssetImage('assets/camog/zbgreenoctopus.png'),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withValues(alpha:1.0),
                              BlendMode.modulate,
                            ))),
                  ),
                ],
              ),
              //  colorinsimple: Colors.green, colorincomplex: Colors.blue)
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 70,
                  child: AutoSizeTextField(
                      minFontSize: 16,
                      readOnly: true,
                      decoration: InputDecoration.collapsed(
                          hintText: DateFormat.Hm().format(_now),
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      controller: _controllerTimePick,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 25,
                  width: 200,
                  child: AutoSizeTextField(
                      minFontSize: 16,
                      readOnly: true,
                      decoration: InputDecoration.collapsed(
                          //hintText: DateFormat('MM/dd/yyyy').format(_now),
                          hintText: _formatDate(_now),
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      controller: _controllerDatePick,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/camog/bluedog.png')),
                  tooltip: 'זמן לעדכן',
                  onPressed: () async {
                    _planetsfullpersonList =
                        await PlanetsServices.getCurrentData(_personTime);

                    _designTime =
                        await PlanetsServices.getDesignTime(_personTime);
                    _planetsfulldesignList =
                        await PlanetsServices.getCurrentData(_designTime);

                    //_planetspersonList = _planetsfullpersonList;
                    //_planetsdesignList = _planetsfulldesignList;

                    for (int i = 0;
                        _planetsfullpersonList.length - 1 > i;
                        i++) {
                      _planetspersonList[i] = _planetsfullpersonList[i];
                      _planetsdesignList[i] = _planetsfulldesignList[i];
                    }

                    _chironhex = _planetsfullpersonList.last;
                    _chirondesignhex = _planetsfulldesignList.last;

                    //_planetspersonList.removeLast();
                    //_planetsdesignList.removeLast();

                    _allplanetsList = _planetspersonList + _planetsdesignList;
                    _channelsList = HDServices.getHDChannels(_allplanetsList);
                    _personchannelsList =
                        HDServices.getHDChannels(_planetspersonList);
                    _designchannelsList =
                        HDServices.getHDChannels(_planetsdesignList);

                    //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);
                    hdfinaldata = HDServices.getHDBasicData(_channelsList);

                    _centers = HDServices.getHDCenters(_channelsList);
                    //_fearSentence = HDServices.getHDDefinedFears(_centers);
                    //_selfreminderSentence = HDServices.getSelfReminder();
                    //_selfreminder = _timeselfreminder;

                    //_controlHDData(hdbasicdata);
                    _controlHDData(hdfinaldata);
                    //hdfinaldata = HDServices.getHDBasicData(_channelsList);

                    //_setDateTime(_now);
                    _setDateTime(_personTime);

                    //_formattedDate = DateFormat('MM/dd/yyyy').format(_now);
                    //_formattedTime = DateFormat.Hms().format(_now);
                    //_controllerTime.text = 'text $_formattedTime $_formattedDate';

                    _planetsfulldisplayList = _planetspersonList;
                    _planethex = _planetsfulldisplayList[0];
                    //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

                    _setCoins();

                    //_hexalignedList = hexagramAlignment(_planethex.gate!);

                    //_controllertop.jumpToPage(_hexalignedList[0]);
                    //_controllermid.jumpToPage(_hexalignedList[1]);
                    //_controllerbot.jumpToPage(_hexalignedList[2]);

                    _controllerlinetext.text = _planethex.line!.toString();
                    _controllergatelinestory.text = coins384List[
                        (coins384List.indexOf(_planethex.gate!) +
                            _planethex.line!)];

                    switch (_previousPlanetIndex) {
                      case -1:
                        _previousPlanetIndex = 0;
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        break;
                      default:
                        _isPlanetSelectedList[_previousPlanetIndex] =
                            !_isPlanetSelectedList[_previousPlanetIndex];
                        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                        _previousPlanetIndex = 0;
                    }

                    switch (_currentconstate) {
                      case 0:
                        _controllerconstate.jumpToPage(1);
                        _controllerconstate.jumpToPage(0);
                        _controllerrotationstate.jumpToPage(0);
                        break;
                      case 1:
                        _controllerconstate.jumpToPage(0);
                        break;
                      default:
                        _controllerconstate.jumpToPage(0);
                        break;
                    }

                    resetChartColor();
                    _resetgatesState();
                    _setgatesState();
                    _setChart(_centers);

                    _setEvolutionCoin();

                    //setState(() {});
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/coins/complex.png')),
                  tooltip: 'העלאה',
                  onPressed: () {
                    _setupdown = true;
                    controlSetTime(_setupdown);
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //minRadius: 5,
                      maxRadius: 20,
                      foregroundImage: AssetImage('assets/coins/silence.png')),
                  tooltip: 'הורדה',
                  onPressed: () {
                    _setupdown = false;
                    controlSetTime(_setupdown);
                  },
                ),
                const SizedBox(width: 5),
                DropdownButton(
                  underline: DropdownButtonHideUnderline(child: Container()),
                  value: _settimestamp,
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  items: timecoinsDropDownLst,
                  onChanged: (String? newsettimestamp) {
                    setState(() {
                      _settimestamp = newsettimestamp!;
                    });
                  },
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 15,
                  width: 70,
                  child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      readOnly: false,
                      decoration:
                          const InputDecoration.collapsed(hintText: '1'),
                      controller: _controllerSetTime,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                ),
              ],
            ),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth / 4,
                  child: AutoSizeTextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.center,
                      controller: _controllerDesignSunGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _sunhex.linename!;
                        _planettext =
                            '1 year of COMPLEX PersonReality and Reality shining';
                        break;
                      case 1:
                        _planettext =
                            '1 year of COMPLEX PersonReality and Reality shining';
                        break;
                      case 2:
                        _planettext = 'breath';
                        break;
                      case 3:
                        _planettext = 'silence';
                        break;
                      default:
                        break;
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPlanetDialog(context, _planettext),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: const CircleBorder(),
                  ),
                  child: const CircleAvatar(
                      minRadius: 13.0,
                      maxRadius: 13.0,
                      backgroundColor: Colors.blue,
                      foregroundImage: AssetImage('assets/planets/sun.png')),
                ),
                SizedBox(
                  width: screenwidth / 4,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      minFontSize: 10,
                      maxFontSize: 20,
                      maxLines: 1,
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.center,
                      controller: _controllerSunGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignEarthGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _earthhex.linename!;
                          _planettext =
                              '1 year of silence PersonReality and Reality grounded';
                          break;
                        case 1:
                          _planettext =
                              '1 year of silence PersonReality and Reality grounded';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            AssetImage('assets/planets/earth.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerEarthGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth / 4,
                  child: AutoSizeTextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.center,
                      controller: _controllerDesignNorthNodeGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _northnodehex.linename!;
                        _planettext =
                            '18.6 years of COMPLEX PersonReality and Reality moving forward';
                        break;
                      case 1:
                        _planettext =
                            '18.6 years of COMPLEX PersonReality and Reality moving forward';
                        break;
                      case 2:
                        _planettext = 'breath';
                        break;
                      case 3:
                        _planettext = 'silence';
                        break;
                      default:
                        break;
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPlanetDialog(context, _planettext),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: const CircleBorder(),
                  ),
                  child: const CircleAvatar(
                      minRadius: 13.0,
                      maxRadius: 13.0,
                      backgroundColor: Colors.green,
                      foregroundImage:
                          AssetImage('assets/planets/northnode.png')),
                ),
                SizedBox(
                  width: screenwidth / 4,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      minFontSize: 10,
                      maxFontSize: 20,
                      maxLines: 1,
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.center,
                      controller: _controllerNorthNodeGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignSouthNodeGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _southnodehex.linename!;
                          _planettext =
                              '18.6 years of silence PersonReality and Reality leaving behind';
                          break;
                        case 1:
                          _planettext =
                              '18.6 years of silence PersonReality and Reality leaving behind';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/southnode.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerSouthNodeGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignMoonGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _moonhex.linename!;
                          _planettext =
                              '27 days of Simple PersonReality and Reality driven to rise';
                          break;
                        case 1:
                          _planettext =
                              '27 days of Simple PersonReality and Reality driven to rise';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('assets/planets/moon.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerMoonGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignMercuryGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _mercuryhex.linename!;
                          _planettext =
                              '88 days of Simple PersonReality and Reality communicating';
                          break;
                        case 1:
                          _planettext =
                              '88 days of Simple PersonReality and Reality communicating';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage:
                            AssetImage('assets/planets/mercury.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerMercuryGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignVenusGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _venushex.linename!;                          break;
                          _planettext =
                              '225 days of Simple PersonReality and Reality values';
                          break;
                        case 1:
                          _planettext =
                              '225 days of Simple PersonReality and Reality values';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage:
                            AssetImage('assets/planets/venus.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerVenusGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignMarsGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _marshex.linename!;
                          _planettext =
                              '687 days of Simple PersonReality and Reality Like Children';
                          break;
                        case 1:
                          _planettext =
                              '687 days of Simple PersonReality and Reality Like Children';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('assets/planets/mars.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerMarsGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignJupiterGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _jupiterhex.linename!;
                          _planettext =
                              '12 years of Breath PersonReality and Reality Justice';
                          break;
                        case 1:
                          _planettext =
                              '12 years of Breath PersonReality and Reality Justice';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/jupiter.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerJupiterGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignSaturnGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _saturnhex.linename!;
                          _planettext =
                              '29 years of Breath PersonReality and Reality Discipline';
                          break;
                        case 1:
                          _planettext =
                              '29 years of Breath PersonReality and Reality Discipline';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/saturn.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerSaturnGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth / 4,
                  child: AutoSizeTextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.center,
                      controller: _controllerDesignUranusGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _uranushex.linename!;
                        _planettext =
                            '84 years of Breath PersonReality and Reality Unusual';
                        break;
                      case 1:
                        _planettext =
                            '84 years of Breath PersonReality and Reality Unusual';
                        break;
                      case 2:
                        _planettext = 'breath';
                        break;
                      case 3:
                        _planettext = 'silence';
                        break;
                      default:
                        break;
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPlanetDialog(context, _planettext),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: const CircleBorder(),
                  ),
                  child: const CircleAvatar(
                      minRadius: 13.0,
                      maxRadius: 13.0,
                      backgroundColor: Colors.yellow,
                      backgroundImage: AssetImage('assets/planets/uranus.png')),
                ),
                SizedBox(
                  width: screenwidth / 4,
                  child: AutoSizeTextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.center,
                      controller: _controllerUranusGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignNeptuneGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _neptunehex.linename!;
                          _planettext =
                              '165 years of Silence PersonReality and Reality Hidden';
                          break;
                        case 1:
                          _planettext =
                              '165 years of Silence PersonReality and Reality Hidden';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            AssetImage('assets/planets/neptune.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerNeptuneGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignPlutoGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _plutohex.linename!;
                          _planettext =
                              '248 years of Silence PersonReality and Reality Truth';
                          break;
                        case 1:
                          _planettext =
                              '248 years of Silence PersonReality and Reality Truth';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            AssetImage('assets/planets/pluto.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerPlutoGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerrotationstate,
                    options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexcrotstate, reason) {
                          setState(() {
                            _currentrotationstate = indexcrotstate;

                            switch (_currentrotationstate) {
                              case 0:
                                _textlevel = 'complex';
                                _changeTextLevels(_textlevel);
                                break;
                              case 1:
                                _textlevel = 'simple';
                                _changeTextLevels(_textlevel);
                                break;
                              case 2:
                                _textlevel = 'breath';
                                _changeTextLevels(_textlevel);
                                break;
                              case 3:
                                _textlevel = 'silence';
                                _changeTextLevels(_textlevel);
                                break;
                              default:
                                _textlevel = 'complex';
                                _changeTextLevels(_textlevel);
                                break;
                            }
                          });
                        }),
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  child: const ImageIcon(
                    AssetImage("assets/coins/longitude.png"),
                    color: Colors.black,
                    size: 25,
                  ),
                  onTap: () {
                    _setLongitude();
                  },
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: screenwidth / 3,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      readOnly: true,
                      textAlign: TextAlign.right,
                      decoration:
                          //const InputDecoration.collapsed(hintText: 'Sentence'),
                          const InputDecoration.collapsed(hintText: 'משפטי'),
                      controller: _controllerPlanetSubType,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black)),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: screenwidth / 3,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      textAlign: TextAlign.left,
                      readOnly: true,
                      decoration:
                          //const InputDecoration.collapsed(hintText: 'Rotation'),
                          const InputDecoration.collapsed(hintText: 'סיבוב'),
                      controller: _controllerPlanetType,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black)),
                ),
              ],
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignChironGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _plutohex.linename!;
                          _planettext =
                              '50.7 years of Silence PersonReality and Reality Cycle';
                          break;
                        case 1:
                          _planettext =
                              '50.7 years of Silence PersonReality and Reality Cycle';
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/planets/chiron.png')),
                  ),
                  SizedBox(
                    width: screenwidth / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerChironGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            const SizedBox(height: 10),
            SizedBox(
              width: screenwidth / 2,
              child: AutoSizeTextField(
                  readOnly: false,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'מחזיק מטבע לרגע'),
                  textAlign: TextAlign.center,
                  controller: _controllersavetxt,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal)),
            ),

            const Divider(
              color: Colors.blue,
            ),
            SizedBox(
              height: 300,
              width: 350,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.2,
                  crossAxisCount: 4, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: const EdgeInsets.all(4.0), // padding around the grid
                itemCount: 16, // total number of items
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(rtimgcoins[index]),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withValues(alpha:1.0),
                              BlendMode.modulate,
                            ))),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[0]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[1]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[2]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: screenheight / 8,
                  width: screenwidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[3]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      '"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.7),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      ';',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.7),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      ',',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.7),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      '.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.7),
                    ),
                  ),
                ),
              ],
            ),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        complexBottomText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 1.7),
                      ),
                      onTap: () {
                        isComplexBotText = !isComplexBotText;
                        setState(() {
                          isComplexBotText == true
                              ? complexBottomText = '\"ניגוף\"'
                              : complexBottomText = '\"מר חה אות\"';
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        simpleBottomText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 1.8),
                      ),
                      onTap: () {
                        isSimpleBotText = !isSimpleBotText;
                        setState(() {
                          isSimpleBotText == true
                              ? simpleBottomText = ";ווף"
                              : simpleBottomText = ";נעפסיק";
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        breathBottomText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 1.9),
                      ),
                      onTap: () {
                        isBreathBotText = !isBreathBotText;
                        setState(() {
                          isBreathBotText == true
                              ? breathBottomText = ",גופוף"
                              : breathBottomText = ",פסיקה";
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5.5,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        silenceBottomText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 2.0),
                      ),
                      onTap: () {
                        isSilenceBotText = !isSilenceBotText;
                        setState(() {
                          isSilenceBotText == true
                              ? silenceBottomText = ".גוף"
                              : silenceBottomText = ".נקודה";
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(
              width: 50,
              child: AutoSizeText(
                'a',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontFamily: 'iChing',
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // idk

  Widget _buildCentersPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('טחן-אות'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 300,
          height: screenheight,
          child: Flex(
            direction: Axis.vertical,
            children: [
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(coins4lst[0])),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: solarcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'רגש',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    //color: Colors.blue[100],
                    color: heartcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'רצון',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(coins4lst[1])),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: throatcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'מלונת המדבר',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(coins4lst[2])),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: headcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'גמל',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    //color: Colors.blue[100],
                    color: ajnacolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'כלב',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: gcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'עצמי',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: spleencolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'גוף בריא',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: rootcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'לחץ לנשום ולשתוק',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(coins4lst[3])),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: sacralcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'חיי שתיקה',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildChannelsPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('תנו לאיות'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: screenwidth,
          child: Flex(
            direction: Axis.vertical,
            children: [
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[0])),
              const Divider(color: Colors.transparent),
              channeldisplay(context, _channelsList),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[1])),
              const Divider(color: Colors.transparent),
              //channeldisplay(context, _personchannelsList),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[2])),
              const Divider(color: Colors.transparent),
              channeldisplay(context, _personchannelsList),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[3])),
              const Divider(color: Colors.transparent),
              channeldisplay(context, _designchannelsList),
              const Divider(color: Colors.transparent),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget channeldisplay(BuildContext context, List<HDChannel> displaychannels) {
    return ListView.builder(
        padding: const EdgeInsets.all(2),
        shrinkWrap: true,
        itemCount: displaychannels.length,
        itemBuilder: (BuildContext context, int index) {
          Color coincolor = Colors.red;
          switch (displaychannels[index].coin) {
            case 'silence':
              coincolor = Colors.red;
              break;
            case 'breath':
              coincolor = Colors.yellow;
              break;
            case 'simple':
              coincolor = Colors.green;
              break;
            case 'complex':
              coincolor = Colors.blue;
              break;
            default:
              coincolor = Colors.red;
              break;
          }
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                //color: Colors.blue[100],
                color: coincolor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                displaychannels[index].sentence!,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          );
        });
  }

  Widget _buildDataPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('זמן עיצוב',
          style: TextStyle(fontSize: 15, color: Colors.white)),
      backgroundColor: Colors.black,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 4,
              decoration: const InputDecoration.collapsed(hintText: 'X'),
              controller: _controllerType,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue)),
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 1,
              decoration: const InputDecoration.collapsed(hintText: 'I'),
              controller: _controllerAuthority,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green)),
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration.collapsed(hintText: 'O'),
              controller: _controllerStrategy,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.yellow)),
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 2,
              decoration:
                  const InputDecoration.collapsed(hintText: 'I don\'t know'),
              controller: _controllerFinalLine,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.red)),
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildProfilePopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('חלי-פה',
                      style: TextStyle(fontSize: 13, color: Colors.white))),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildCentersPopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('טחן-אות',
                      style: TextStyle(fontSize: 13, color: Colors.white))),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildChannelsPopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('תנו לאיות',
                      style: TextStyle(fontSize: 13, color: Colors.white))),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProfilePopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('חלי-פה'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 300,
          height: 450,
          child: Flex(
            direction: Axis.vertical,
            children: [
              CircleAvatar(
                  minRadius: 20,
                  maxRadius: 30,
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage(minmaxcoins[0])),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_planetspersonList[0].line.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('מקסימום איות מורכב',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      rt6profile[_planetspersonList[0].line!].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 20,
                  maxRadius: 30,
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage(minmaxcoins[3])),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_planetsdesignList[0].line.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('מינימום אישה שתיקה',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      rt6profile[_planetsdesignList[0].line!].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  void resetChartColor() {
    cardcolor = Colors.black;
    timecolor = Colors.white;
    cardstate = 'zb';
  }

  void setChartState() {
    cardcolor = cardcolor == Colors.black
        ? Colors.black.withValues(alpha:0.2)
        : Colors.black;

    timecolor = timecolor == Colors.white ? Colors.black : Colors.white;
  }

  void setSilenceOnly() {
    int tempdesigngate = 0, temppersongate = 0;
    for (var g in gatestatelist) {
     g = 0;
    }

    if (cardstate == 'zb') {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tempdesigngate = _planetsdesignList[i].gate!;
        if (gatestatelist[tempdesigngate] == 3) {
          gatestatelist[tempdesigngate] = 1;
          _isBoldList[tempdesigngate] = true;
        } else if (gatestatelist[tempdesigngate] == 0 ||
            gatestatelist[tempdesigngate] == 2) {
          gatestatelist[tempdesigngate] = 1;
          _isBoldList[tempdesigngate] = true;
        }
      }

      for (var i = 0; i < _planetspersonList.length; i++) {
        temppersongate = _planetspersonList[i].gate!;
        _isBoldList[temppersongate] = false;

        if (gatestatelist[temppersongate] == 2) {
          gatestatelist[temppersongate] = 0;
        } else if (gatestatelist[temppersongate] == 3) {
          gatestatelist[temppersongate] = 1;
        }
      }
    } else {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tempdesigngate = _planetsdesignList[i].gate!;
        if (gatestatelist[tempdesigngate] == 8) {
          gatestatelist[tempdesigngate] = 1;
          _isBoldList[tempdesigngate] = true;
        } else if (gatestatelist[tempdesigngate] == 6 ||
            gatestatelist[tempdesigngate] == 5) {
          gatestatelist[tempdesigngate] = 1;
          _isBoldList[tempdesigngate] = true;
        }
      }
      for (var i = 0; i < _planetspersonList.length; i++) {
        temppersongate = _planetspersonList[i].gate!;
        _isBoldList[temppersongate] = false;

        if (gatestatelist[temppersongate] == 5) {
          gatestatelist[temppersongate] = 6;
        } else if (gatestatelist[temppersongate] == 8) {
          gatestatelist[temppersongate] = 1;
        }
      }
    }
  }

  void setComplexOnly() {
    int tempdesigngate = 0, temppersongate = 0;

    if (cardstate == 'zb') {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tempdesigngate = _planetsdesignList[i].gate!;
        if (gatestatelist[tempdesigngate] == 1) {
          gatestatelist[tempdesigngate] = 0;
          _isBoldList[tempdesigngate] = false;
        } else if (gatestatelist[tempdesigngate] == 3) {
          gatestatelist[tempdesigngate] = 2;
          _isBoldList[tempdesigngate] = true;
        }
      }

      //for (var i = 0; i < _planetspersonList.length; i++) {
      // temppersongate = _planetspersonList[i].gate!;
      //_isBoldList[temppersongate] = true;

      //if (gatestatelist[temppersongate] == 3) {
      // gatestatelist[temppersongate] = 2;
      //}
      //}
    } else {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tempdesigngate = _planetsdesignList[i].gate!;
        if (gatestatelist[tempdesigngate] == 1) {
          gatestatelist[tempdesigngate] = 6;
          _isBoldList[tempdesigngate] = false;
        } else if (gatestatelist[tempdesigngate] == 8) {
          gatestatelist[tempdesigngate] = 5;
          _isBoldList[tempdesigngate] = true;
        }
      }

      //for (var i = 0; i < _planetspersonList.length; i++) {
      // temppersongate = _planetspersonList[i].gate!;
      // _isBoldList[temppersongate] = true;

      // if (gatestatelist[temppersongate] == 3) {
      //   gatestatelist[temppersongate] = 2;
      // }
      //}
    }
  }

  void _controlHDData(HumanDesign hdbasicdata) {
    _controllerFinalLine.text = 'XIO I don\'t know';

    _controllerStrategy.text = hdbasicdata.strategy!;
    _controllerAuthority.text = hdbasicdata.authority!;
    _controllerType.text = hdbasicdata.type!;
    _controllerSentence.text = hdbasicdata.sentence!;
    //_controllercoinfirsttext.text = hdbasicdata.coinname!;
    _controllercoin.jumpToPage(hexNamesList.indexOf(hdbasicdata.coinname!) + 1);
    //_currenttop = hexNamesList.indexOf(hdbasicdata.coinname!);
  }

  void _setgatesState() {
    int tempdesigngate = 0, temppersongate = 0, tempcolorgatewheel = 0;
    //revwheelgatescolor = wheelgatescolor.reversed.toList();

    //reversedHexagramsWheel


    for (var i = 0; i < _planetsdesignList.length; i++) {
      tempdesigngate = _planetsdesignList[i].gate!;
      if (gatestatelist[tempdesigngate] == 0) {
        gatestatelist[tempdesigngate] = 1;
        _isBoldList[tempdesigngate] = true;

        // set color of gate on wheel
        //coins384List[
        //(coins384List.indexOf(_planethex.gate!) + _planethex.line!)];
        //revwheelgatescolor[tempdesigngate] = reversedtopcoincolor[tempdesigngate];
        tempcolorgatewheel = reversedHexagramsWheel.indexOf(tempdesigngate);
      setState(() {
        wheelgatescolor[tempcolorgatewheel] = complexrevtopcoincolor[tempcolorgatewheel].withValues(alpha:1);
        //wheelgatescolor[tempcolorgatewheel] = reversedtopcoincolor[tempcolorgatewheel];
        //wheelgatescolor[tempcolorgatewheel] = wheelgatescolor[tempcolorgatewheel].withValues(alpha:1);
      });
      }
    }

    for (var i = 0; i < _planetspersonList.length; i++) {
      temppersongate = _planetspersonList[i].gate!;
      _isBoldList[temppersongate] = true;

      tempcolorgatewheel = reversedHexagramsWheel.indexOf(temppersongate);
      //wheelgateopacity = 1.0;
      setState(() {
        wheelgatescolor[tempcolorgatewheel] = complexrevtopcoincolor[tempcolorgatewheel].withValues(alpha:1);
        //wheelgatescolor[tempcolorgatewheel] = reversedtopcoincolor[tempcolorgatewheel];
        //wheelgatescolor[tempcolorgatewheel] = wheelgatescolor[tempcolorgatewheel].withValues(alpha:1);
      });


      if (gatestatelist[temppersongate] == 0) {
        gatestatelist[temppersongate] = 2;
      } else {
        if (gatestatelist[temppersongate] == 1) {
          gatestatelist[temppersongate] = 3;
        }
      }
    }
  }

  void _settransitgatesState() {
    int temppersongate = 0;
    //_planetspersonList[0].
    //_planetsdesignList[0].

    for (var i = 0; i < _planetspersonList.length; i++) {
      temppersongate = _planetspersonList[i].gate!;
      gatestatelist[temppersongate] = 2;
      _isBoldList[temppersongate] = true;
    }
  }

  void _resetgatesState() {
    for (var i = 0; i < gatestatelist.length; i++) {
      gatestatelist[i] = 0;
      _isBoldList[i] = false;

      setState(() {
        for (var i = 0; i < wheelgatescolor.length; i++) {
          //wheelgatescolor[i] = reversedtopcoincolor[i].withValues(alpha:0.1);
          wheelgatescolor[i] = complexrevtopcoincolor[i];
          wheelgatescolor[i] = wheelgatescolor[i].withValues(alpha:0.1);
        }
      });

    }
  }

  void _resetcentersState() {
    setState(() {
      headstate = 3;
      ajnastate = 3;
      throatstate = 3;
      gstate = 3;
      sacralstate = 3;
      rootstate = 3;
      heartstate = 3;
      spleenstate = 3;
      solarstate = 3;
    });
  }

  controlCollor(int colorcoin) {
    Color finalcolor;
    switch (colorcoin) {
      //case 'silence':
      //case 0:
      case 3:
        finalcolor = Colors.red;
        break;
      //case 'Breath':
      //case 1:
      case 2:
        finalcolor = Colors.yellow;
        break;
      //case 'Simple':
      //case 2:
      case 1:
        finalcolor = Colors.green;
        break;
      //case 'COMPLEX':
      //case 3:
      case 0:
        finalcolor = Colors.blue;
        break;
      default:
        finalcolor = Colors.black;
        break;
    }
    return finalcolor;
  }

  void controlSetTime(bool newsetupdown) async {
    if (_controllerSetTime.text.isEmpty) {
      _newts = int.parse('1');
    } else {
      _newts = int.parse(_controllerSetTime.text);
    }

    if (newsetupdown) {
      switch (_settimestamp) {
        case 'שניות':
          _personTime = _personTime.add(Duration(seconds: _newts));
          break;
        case 'דקות':
          _personTime = _personTime.add(Duration(minutes: _newts));
          break;
        case 'שעות':
          _personTime = _personTime.add(Duration(hours: _newts));
          break;
        case 'ימים':
          _personTime = DateTime(
              _personTime.year,
              _personTime.month,
              _personTime.day + _newts,
              _now.hour,
              _personTime.minute,
              _personTime.second);
          break;
        case 'שבועות':
          _personTime = DateTime(
              _personTime.year,
              _personTime.month,
              (_personTime.day + _newts * 7),
              _personTime.hour,
              _personTime.minute,
              _personTime.second);
          break;
        case 'חודשים':
          _personTime = DateTime(
              _personTime.year,
              _personTime.month + _newts,
              _personTime.day,
              _personTime.hour,
              _personTime.minute,
              _personTime.second);
          break;
        case 'שנים':
          _personTime = DateTime(
              _personTime.year + _newts,
              _personTime.month,
              _personTime.day,
              _personTime.hour,
              _personTime.minute,
              _personTime.second);
          break;
        default:
          _personTime = _personTime.add(Duration(minutes: _newts));
          break;
      }
    } else {
      switch (_settimestamp) {
        case 'שניות':
          _personTime = _personTime.subtract(Duration(seconds: _newts));
          break;
        case 'דקות':
          _personTime = _personTime.subtract(Duration(minutes: _newts));
          break;
        case 'שעות':
          _personTime = _personTime.subtract(Duration(hours: _newts));
          break;
        case 'ימים':
          _personTime = DateTime(
              _personTime.year,
              _personTime.month,
              _personTime.day - _newts,
              _personTime.hour,
              _personTime.minute,
              _personTime.second);
          break;
        case 'שבועות':
          _personTime = DateTime(
              _personTime.year,
              _personTime.month,
              (_personTime.day - _newts * 7),
              _personTime.hour,
              _personTime.minute,
              _personTime.second);
          break;
        case 'חודשים':
          _personTime = DateTime(
              _personTime.year,
              _personTime.month - _newts,
              _personTime.day,
              _personTime.hour,
              _personTime.minute,
              _personTime.second);
          break;
        case 'שנים':
          _personTime = DateTime(
              _personTime.year - _newts,
              _personTime.month,
              _personTime.day,
              _personTime.hour,
              _personTime.minute,
              _personTime.second);
          break;
        default:
          _personTime = _personTime.subtract(Duration(minutes: _newts));
          break;
      }
    }

    //setState(() async {
    _planetsfullpersonList = await PlanetsServices.getCurrentData(_personTime);
    _planetsfulldesignList = _planetsfullpersonList;

    //emulate design time to now time to prevent blank
    //_planetsfulldesignList = await PlanetsServices.getCurrentData(_personTime);

    //  Navigator.of(context).pop();
    //});
    _chironhex = _planetsfullpersonList.last;

    //_planetspersonList = _planetsfullpersonList;
    //_planetsdesignList = _planetsfulldesignList;

    for (int i = 0; _planetsfullpersonList.length - 1 > i; i++) {
      _planetspersonList[i] = _planetsfullpersonList[i];
      _planetsdesignList[i] = _planetsfulldesignList[i];
    }

    //_planetspersonList.removeLast();

    resetChartColor();
    _resetgatesState();
    _settransitgatesState();
    _channelsList = HDServices.getHDChannelsJustNow(_planetspersonList);

    _personchannelsList = [];
    _designchannelsList = [];

    //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

    hdfinaldata = HDServices.getHDBasicData(_channelsList);
    //_controlHDData(hdbasicdata);
    _controlHDData(hdfinaldata);

    _centers = HDServices.getHDCenters(_channelsList);
    //_fearSentence = HDServices.getHDDefinedFears(_centers);
    //_selfreminderSentence = HDServices.getSelfReminder();
    //_selfreminder = _timeselfreminder;

    _setDateTime(_personTime);

    _planetsfulldisplayList = _planetspersonList;
    _planethex = _planetsfulldisplayList[0];

    _setCoins();

    _controllerlinetext.text = _planethex.line!.toString();
    _controllergatelinestory.text = coins384List[
        (coins384List.indexOf(_planethex.gate!) + _planethex.line!)];

    switch (_previousPlanetIndex) {
      case -1:
        _previousPlanetIndex = 0;
        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
        break;
      default:
        _isPlanetSelectedList[_previousPlanetIndex] =
            !_isPlanetSelectedList[_previousPlanetIndex];
        _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
        _previousPlanetIndex = 0;
    }

    switch (_currentconstate) {
      case 0:
        _controllerconstate.jumpToPage(1);
        _controllerconstate.jumpToPage(0);
        _controllerrotationstate.jumpToPage(0);
        break;
      case 1:
        _controllerconstate.jumpToPage(0);
        break;
      default:
        _controllerconstate.jumpToPage(0);
        break;
    }
    _setChart(_centers);
    _setEvolutionCoin();
  }

  Widget _buildGatesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('ארנקים'),
      content: SizedBox(
          width: screenwidth * 0.8,
          child: ListView.builder(
            reverse: false,
            itemCount: 13,
            itemBuilder: (context, index) => ListTile(
              title: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Colors.transparent,
                        foregroundImage: AssetImage(planetsimagelist[index])),
                    Text(
                      _planetsfulldisplayList[index].gate!.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      coins64List[_planetsfulldisplayList[index].gate!],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          )),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildLinesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('מטבעות'),
      content: SizedBox(
          width: screenwidth * 0.8,
          child: ListView.builder(
            reverse: false,
            itemCount: 13,
            itemBuilder: (context, index) => ListTile(
              title: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Colors.transparent,
                        foregroundImage: AssetImage(planetsimagelist[index])),
                    Text(
                      _planetsfulldisplayList[index].gateline!.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      coins384List[(_planetsfulldisplayList[index].gate! * 7) +
                          _planetsfulldisplayList[index].line!],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          )),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildPlanetDialog(BuildContext context, String matchtext) {
    return AlertDialog(
      title: const Text('Story'),
      content: SizedBox(
        width: screenwidth,
        height: screenheight / 4,
        child: Text(matchtext,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal)),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  void _controlPlanetHexagramData(List<Hexagram> planetDisplayList) {
    _sunhex = _planetspersonList[0];
    _earthhex = _planetspersonList[1];
    _northnodehex = _planetspersonList[2];
    _southnodehex = _planetspersonList[3];
    _moonhex = _planetspersonList[4];
    _mercuryhex = _planetspersonList[5];
    _venushex = _planetspersonList[6];
    _marshex = _planetspersonList[7];
    _jupiterhex = _planetspersonList[8];
    _saturnhex = _planetspersonList[9];
    _uranushex = _planetspersonList[10];
    _neptunehex = _planetspersonList[11];
    _plutohex = _planetspersonList[12];
    _chironhex = _planetsfullpersonList[13];

    _sundesignhex = _planetsdesignList[0];
    _earthdesignhex = _planetsdesignList[1];
    _northnodedesignhex = _planetsdesignList[2];
    _southnodedesignhex = _planetsdesignList[3];
    _moondesignhex = _planetsdesignList[4];
    _mercurydesignhex = _planetsdesignList[5];
    _venusdesignhex = _planetsdesignList[6];
    _marsdesignhex = _planetsdesignList[7];
    _jupiterdesignhex = _planetsdesignList[8];
    _saturndesignhex = _planetsdesignList[9];
    _uranusdesignhex = _planetsdesignList[10];
    _neptunedesignhex = _planetsdesignList[11];
    _plutodesignhex = _planetsdesignList[12];
    _chirondesignhex = _planetsfulldesignList[13];

    _controllerSunText.text = _sunhex.linename!;
    _controllerEarthText.text = _earthhex.linename!;
    _controllerNorthNodeText.text = _northnodehex.linename!;
    _controllerSouthNodeText.text = _southnodehex.linename!;
    _controllerMoonText.text = _moonhex.linename!;
    _controllerMercuryText.text = _mercuryhex.linename!;
    _controllerVenusText.text = _venushex.linename!;
    _controllerMarsText.text = _marshex.linename!;
    _controllerJupiterText.text = _jupiterhex.linename!;
    _controllerSaturnText.text = _saturnhex.linename!;
    _controllerUranusText.text = _uranushex.linename!;
    _controllerNeptuneText.text = _neptunehex.linename!;
    _controllerPlutoText.text = _plutohex.linename!;

    _controllerSunGate.text = _sunhex.gatelinecolortonebase!;
    _controllerEarthGate.text = _earthhex.gatelinecolortonebase!;
    _controllerNorthNodeGate.text = _northnodehex.gatelinecolortonebase!;
    _controllerSouthNodeGate.text = _southnodehex.gatelinecolortonebase!;
    _controllerMoonGate.text = _moonhex.gatelinecolor!;
    _controllerMercuryGate.text = _mercuryhex.gatelinecolor!;
    _controllerVenusGate.text = _venushex.gatelinecolor!;
    _controllerMarsGate.text = _marshex.gatelinecolor!;
    _controllerJupiterGate.text = _jupiterhex.gatelinecolor!;
    _controllerSaturnGate.text = _saturnhex.gatelinecolor!;
    _controllerUranusGate.text = _uranushex.gatelinecolor!;
    _controllerNeptuneGate.text = _neptunehex.gatelinecolor!;
    _controllerPlutoGate.text = _plutohex.gatelinecolor!;
    _controllerChironGate.text = _chironhex.gatelinecolor!;

    _controllerDesignSunGate.text = _sundesignhex.gatelinecolortonebase!;
    _controllerDesignEarthGate.text = _earthdesignhex.gatelinecolortonebase!;
    _controllerDesignNorthNodeGate.text =
        _northnodedesignhex.gatelinecolortonebase!;
    _controllerDesignSouthNodeGate.text =
        _southnodedesignhex.gatelinecolortonebase!;
    _controllerDesignMoonGate.text = _moondesignhex.gatelinecolor!;
    _controllerDesignMercuryGate.text = _mercurydesignhex.gatelinecolor!;
    _controllerDesignVenusGate.text = _venusdesignhex.gatelinecolor!;
    _controllerDesignMarsGate.text = _marsdesignhex.gatelinecolor!;
    _controllerDesignJupiterGate.text = _jupiterdesignhex.gatelinecolor!;
    _controllerDesignSaturnGate.text = _saturndesignhex.gatelinecolor!;
    _controllerDesignUranusGate.text = _uranusdesignhex.gatelinecolor!;
    _controllerDesignNeptuneGate.text = _neptunedesignhex.gatelinecolor!;
    _controllerDesignPlutoGate.text = _plutodesignhex.gatelinecolor!;
    _controllerDesignChironGate.text = _chirondesignhex.gatelinecolor!;

    // set tonal values
    tonallist = [
      _sundesignhex.tone!,
      _northnodedesignhex.tone!,
      _sundesignhex.tone!,
      _northnodehex.tone!
    ];
  }

  void _setDateTime(DateTime timedata) {
    //_formattedDate = DateFormat('MM/dd/yyyy').format(timedata);
    //_formattedDate = DateFormat('זמן: dd MMMM yyyy', 'he').format(timedata);
    _formattedDate = _formatDate(timedata);
    //DateFormat.MMMMd(locale).format(now);

    _formattedTime = DateFormat.Hms().format(timedata);

    //print (timedata);

    //_controllerTime.text = '$_formattedTime $_formattedDate';
    //_controllerTime.text = '$_formattedTime $_formattedDate';
    _controllerDatePick.text = _formattedDate;
    _controllerTimePick.text = _formattedTime;
  }

  _formatDate(DateTime formatdata) {
    //_formattedDate = DateFormat('MM/dd/yyyy').format(timedata);
    //_formattedDate = DateFormat('זמן: dd MMMM yyyy', 'he').format(formatdata);
    _formattedDate = DateFormat('dd MM yyyy', 'he').format(formatdata);

    return _formattedDate;
  }

  void _setLongitude() {
    _sunhex = _planetspersonList[0];
    _earthhex = _planetspersonList[1];
    _northnodehex = _planetspersonList[2];
    _southnodehex = _planetspersonList[3];
    _moonhex = _planetspersonList[4];
    _mercuryhex = _planetspersonList[5];
    _venushex = _planetspersonList[6];
    _marshex = _planetspersonList[7];
    _jupiterhex = _planetspersonList[8];
    _saturnhex = _planetspersonList[9];
    _uranushex = _planetspersonList[10];
    _neptunehex = _planetspersonList[11];
    _plutohex = _planetspersonList[12];

    _sundesignhex = _planetsdesignList[0];
    _earthdesignhex = _planetsdesignList[1];
    _northnodedesignhex = _planetsdesignList[2];
    _southnodedesignhex = _planetsdesignList[3];
    _moondesignhex = _planetsdesignList[4];
    _mercurydesignhex = _planetsdesignList[5];
    _venusdesignhex = _planetsdesignList[6];
    _marsdesignhex = _planetsdesignList[7];
    _jupiterdesignhex = _planetsdesignList[8];
    _saturndesignhex = _planetsdesignList[9];
    _uranusdesignhex = _planetsdesignList[10];
    _neptunedesignhex = _planetsdesignList[11];
    _plutodesignhex = _planetsdesignList[12];

    _controllerSunGate.text = _sunhex.longitude.toString();
    _controllerEarthGate.text = _earthhex.longitude.toString();
    _controllerNorthNodeGate.text = _northnodehex.longitude.toString();
    _controllerSouthNodeGate.text = _southnodehex.longitude.toString();
    _controllerMoonGate.text = _moonhex.longitude.toString();
    _controllerMercuryGate.text = _mercuryhex.longitude.toString();
    _controllerVenusGate.text = _venushex.longitude.toString();
    _controllerMarsGate.text = _marshex.longitude.toString();
    _controllerJupiterGate.text = _jupiterhex.longitude.toString();
    _controllerSaturnGate.text = _saturnhex.longitude.toString();
    _controllerUranusGate.text = _uranushex.longitude.toString();
    _controllerNeptuneGate.text = _neptunehex.longitude.toString();
    _controllerPlutoGate.text = _plutohex.longitude.toString();
    _controllerChironGate.text = _chironhex.longitude.toString();

    _controllerDesignSunGate.text = _sundesignhex.longitude.toString();
    _controllerDesignEarthGate.text = _earthdesignhex.longitude.toString();
    _controllerDesignNorthNodeGate.text =
        _northnodedesignhex.longitude.toString();
    _controllerDesignSouthNodeGate.text =
        _southnodedesignhex.longitude.toString();
    _controllerDesignMoonGate.text = _moondesignhex.longitude.toString();
    _controllerDesignMercuryGate.text = _mercurydesignhex.longitude.toString();
    _controllerDesignVenusGate.text = _venusdesignhex.longitude.toString();
    _controllerDesignMarsGate.text = _marsdesignhex.longitude.toString();
    _controllerDesignJupiterGate.text = _jupiterdesignhex.longitude.toString();
    _controllerDesignSaturnGate.text = _saturndesignhex.longitude.toString();
    _controllerDesignUranusGate.text = _uranusdesignhex.longitude.toString();
    _controllerDesignNeptuneGate.text = _neptunedesignhex.longitude.toString();
    _controllerDesignPlutoGate.text = _plutodesignhex.longitude.toString();
    _controllerDesignChironGate.text = _chirondesignhex.longitude.toString();
  }

  void _setCoins() {
    _hexalignedList = hexagramAlignment(_planethex.gate!);

    _controllertop.jumpToPage(_hexalignedList[0]);
    _controllermid.jumpToPage(_hexalignedList[1]);
    _controllerbot.jumpToPage(_hexalignedList[2]);
  }

  void _setChart(List<hdCenter> updatecenters) {
    headstate = 3;
    ajnastate = 3;
    throatstate = 3;
    gstate = 3;
    sacralstate = 3;
    rootstate = 3;
    heartstate = 3;
    spleenstate = 3;
    solarstate = 3;

    headstate = updatecenters[0].state!;
    ajnastate = updatecenters[1].state!;
    throatstate = updatecenters[2].state!;
    gstate = updatecenters[3].state!;
    heartstate = updatecenters[4].state!;
    spleenstate = updatecenters[5].state!;
    sacralstate = updatecenters[6].state!;
    solarstate = updatecenters[7].state!;
    rootstate = updatecenters[8].state!;

  }

  void _setEvolutionCoin() {
    // sun earth nodes design
    if (_planetsdesignList[0].tone! > 3) {
      //_inbodyalign = 'right';
      //_inbodycolor = Colors.red;
      _inbodyicon = Icons.arrow_circle_right;
      if (_planetsdesignList[2].tone! > 3) {
        _colorinsilence = Colors.red;
        //_exbodyalign = 'right';
        //_exbodycolor = Colors.yellow;
        _exbodyicon = Icons.arrow_circle_right;
      } else {
        _colorinsilence = Colors.green;
        //_exbodyalign = 'left';
        //_exbodycolor = Colors.green;
        _exbodyicon = Icons.arrow_circle_left;
      }
    } else {
      //_inbodyalign = 'left';
      //_inbodycolor = Colors.blue;
      _inbodyicon = Icons.arrow_circle_left;
      if (_planetsdesignList[2].tone! > 3) {
        _colorinsilence = Colors.yellow;
        //_exbodyalign = 'right';
        //_exbodycolor = Colors.yellow;
        _exbodyicon = Icons.arrow_circle_right;
      } else {
        _colorinsilence = Colors.blue;
        //_exbodyalign = 'left';
        //_exbodycolor = Colors.green;
        _exbodyicon = Icons.arrow_circle_left;
      }
    }

    // sun earth nodes person
    if (_planetspersonList[0].tone! > 3) {
      //_inpersonalign = 'right';
      //_inpersoncolor = Colors.blue;
      _inpersonicon = Icons.arrow_circle_right;
      if (_planetspersonList[2].tone! > 3) {
        _colorincomplex = Colors.red;
        //_expersonalign = 'right';
        //_expersoncolor = Colors.yellow;
        _expersonicon = Icons.arrow_circle_right;
      } else {
        _colorincomplex = Colors.green;
        //_expersonalign = 'left';
        //_expersoncolor = Colors.green;
        _expersonicon = Icons.arrow_circle_left;
      }
    } else {
      //_inpersonalign = 'left';
      //_inpersoncolor = Colors.blue;
      _inpersonicon = Icons.arrow_circle_left;
      if (_planetspersonList[2].tone! > 3) {
        _colorincomplex = Colors.yellow;
        //_expersonalign = 'right';
        //_expersoncolor = Colors.yellow;
        _expersonicon = Icons.arrow_circle_right;
      } else {
        _colorincomplex = Colors.blue;
        //_expersonalign = 'left';
        //_expersoncolor = Colors.green;
        _expersonicon = Icons.arrow_circle_left;
      }
    }

    // nodes person design
    if (_planetsdesignList[2].tone! > 3) {
      if (_planetspersonList[2].tone! > 3) {
        _colorinbreath = Colors.red;
      } else {
        _colorinbreath = Colors.yellow;
      }
    } else {
      if (_planetspersonList[2].tone! > 3) {
        _colorinbreath = Colors.green;
      } else {
        _colorinbreath = Colors.blue;
      }
    }

    //sun earth person design
    if (_planetsdesignList[0].tone! > 3) {
      if (_planetspersonList[0].tone! > 3) {
        _colorinsimple = Colors.red;
      } else {
        _colorinsimple = Colors.yellow;
      }
    } else {
      if (_planetspersonList[0].tone! > 3) {
        _colorinsimple = Colors.green;
      } else {
        _colorinsimple = Colors.blue;
      }
    }
  }

  void _changeTextLevels(String textlevel) {
    switch (textlevel) {
      case 'complex':
        //_controllerPlanetSubType.text = 'COMPLEX';
        _controllerPlanetSubType.text = 'מורכב';

        _controllerSunGate.text = _sunhex.gatelinecolortonebase!;
        _controllerEarthGate.text = _earthhex.gatelinecolortonebase!;
        _controllerNorthNodeGate.text = _northnodehex.gatelinecolortonebase!;
        _controllerSouthNodeGate.text = _southnodehex.gatelinecolortonebase!;
        _controllerMoonGate.text = _moonhex.gatelinecolor!;
        _controllerMercuryGate.text = _mercuryhex.gatelinecolor!;
        _controllerVenusGate.text = _venushex.gatelinecolor!;
        _controllerMarsGate.text = _marshex.gatelinecolor!;
        _controllerJupiterGate.text = _jupiterhex.gatelinecolor!;
        _controllerSaturnGate.text = _saturnhex.gatelinecolor!;
        _controllerUranusGate.text = _uranushex.gatelinecolor!;
        _controllerNeptuneGate.text = _neptunehex.gatelinecolor!;
        _controllerPlutoGate.text = _plutohex.gatelinecolor!;
        _controllerChironGate.text = _chironhex.gatelinecolor!;

        _controllerDesignSunGate.text = _sundesignhex.gatelinecolortonebase!;
        _controllerDesignEarthGate.text =
            _earthdesignhex.gatelinecolortonebase!;
        _controllerDesignNorthNodeGate.text =
            _northnodedesignhex.gatelinecolortonebase!;
        _controllerDesignSouthNodeGate.text =
            _southnodedesignhex.gatelinecolortonebase!;
        _controllerDesignMoonGate.text = _moondesignhex.gatelinecolor!;
        _controllerDesignMercuryGate.text = _mercurydesignhex.gatelinecolor!;
        _controllerDesignVenusGate.text = _venusdesignhex.gatelinecolor!;
        _controllerDesignMarsGate.text = _marsdesignhex.gatelinecolor!;
        _controllerDesignJupiterGate.text = _jupiterdesignhex.gatelinecolor!;
        _controllerDesignSaturnGate.text = _saturndesignhex.gatelinecolor!;
        _controllerDesignUranusGate.text = _uranusdesignhex.gatelinecolor!;
        _controllerDesignNeptuneGate.text = _neptunedesignhex.gatelinecolor!;
        _controllerDesignPlutoGate.text = _plutodesignhex.gatelinecolor!;
        _controllerDesignChironGate.text = _chirondesignhex.gatelinecolor!;

        break;
      case 'simple':
        _controllerPlanetSubType.text = 'פשוט';

        _controllerSunGate.text = _sunhex.gateline!;
        _controllerEarthGate.text = _earthhex.gateline!;
        _controllerNorthNodeGate.text = _northnodehex.gateline!;
        _controllerSouthNodeGate.text = _southnodehex.gateline!;
        _controllerMoonGate.text = _moonhex.gateline!;
        _controllerMercuryGate.text = _mercuryhex.gateline!;
        _controllerVenusGate.text = _venushex.gateline!;
        _controllerMarsGate.text = _marshex.gateline!;
        _controllerJupiterGate.text = _jupiterhex.gateline!;
        _controllerSaturnGate.text = _saturnhex.gateline!;
        _controllerUranusGate.text = _uranushex.gateline!;
        _controllerNeptuneGate.text = _neptunehex.gateline!;
        _controllerPlutoGate.text = _plutohex.gateline!;
        _controllerChironGate.text = _chironhex.gateline!;

        _controllerDesignSunGate.text = _sundesignhex.gateline!;
        _controllerDesignEarthGate.text = _earthdesignhex.gateline!;
        _controllerDesignNorthNodeGate.text = _northnodedesignhex.gateline!;
        _controllerDesignSouthNodeGate.text = _southnodedesignhex.gateline!;
        _controllerDesignMoonGate.text = _moondesignhex.gateline!;
        _controllerDesignMercuryGate.text = _mercurydesignhex.gateline!;
        _controllerDesignVenusGate.text = _venusdesignhex.gateline!;
        _controllerDesignMarsGate.text = _marsdesignhex.gateline!;
        _controllerDesignJupiterGate.text = _jupiterdesignhex.gateline!;
        _controllerDesignSaturnGate.text = _saturndesignhex.gateline!;
        _controllerDesignUranusGate.text = _uranusdesignhex.gateline!;
        _controllerDesignNeptuneGate.text = _neptunedesignhex.gateline!;
        _controllerDesignPlutoGate.text = _plutodesignhex.gateline!;
        _controllerDesignChironGate.text = _chirondesignhex.gateline!;

        break;
      case 'breath':
        _controllerPlanetSubType.text = 'נשימה';

        _controllerSunGate.text = 'Exhale';
        _controllerEarthGate.text = 'Inhale';
        _controllerNorthNodeGate.text = 'BREATHE';
        _controllerSouthNodeGate.text = 'BREATH';
        _controllerMoonGate.text = 'Exhale';
        _controllerMercuryGate.text = 'Exhale';
        _controllerVenusGate.text = 'Exhale';
        _controllerMarsGate.text = 'Exhale';
        _controllerJupiterGate.text = 'Inhale';
        _controllerSaturnGate.text = 'Inhale';
        _controllerUranusGate.text = 'Inhale';
        _controllerNeptuneGate.text = 'Inhale';
        _controllerPlutoGate.text = 'Inhale';
        _controllerChironGate.text = 'Inhale';

        _controllerDesignSunGate.text = 'Exhale';
        _controllerDesignEarthGate.text = 'Inhale';
        _controllerDesignNorthNodeGate.text = 'BREATHE';
        _controllerDesignSouthNodeGate.text = 'BREATH';
        _controllerDesignMoonGate.text = 'Exhale';
        _controllerDesignMercuryGate.text = 'Exhale';
        _controllerDesignVenusGate.text = 'Exhale';
        _controllerDesignMarsGate.text = 'Exhale';
        _controllerDesignJupiterGate.text = 'Inhale';
        _controllerDesignSaturnGate.text = 'Inhale';
        _controllerDesignUranusGate.text = 'Inhale';
        _controllerDesignNeptuneGate.text = 'Inhale';
        _controllerDesignPlutoGate.text = 'Inhale';
        _controllerDesignChironGate.text = 'Inhale';

        break;
      case 'silence':
        _controllerPlanetSubType.text = 'שתיקה';

        _controllerSunGate.text = '';
        _controllerEarthGate.text = '';
        _controllerNorthNodeGate.text = '';
        _controllerSouthNodeGate.text = '';
        _controllerMoonGate.text = '';
        _controllerMercuryGate.text = '';
        _controllerVenusGate.text = '';
        _controllerMarsGate.text = '';
        _controllerJupiterGate.text = '';
        _controllerSaturnGate.text = '';
        _controllerUranusGate.text = '';
        _controllerNeptuneGate.text = '';
        _controllerPlutoGate.text = '';
        _controllerChironGate.text = '';

        _controllerDesignSunGate.text = '';
        _controllerDesignEarthGate.text = '';
        _controllerDesignNorthNodeGate.text = '';
        _controllerDesignSouthNodeGate.text = '';
        _controllerDesignMoonGate.text = '';
        _controllerDesignMercuryGate.text = '';
        _controllerDesignVenusGate.text = '';
        _controllerDesignMarsGate.text = '';
        _controllerDesignJupiterGate.text = '';
        _controllerDesignSaturnGate.text = '';
        _controllerDesignUranusGate.text = '';
        _controllerDesignNeptuneGate.text = '';
        _controllerDesignPlutoGate.text = '';
        _controllerDesignChironGate.text = '';

        break;
      default:
        break;
    }
  }
}
