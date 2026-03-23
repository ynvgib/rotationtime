import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/zb/data/zb_extensions.dart';
import 'package:finallyicanlearn/zb/ui/zb_helpers.dart';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/zb_data.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_cleanwidgets.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sweph/sweph.dart';
import 'dart:ui' as ui;

class RotateComplex extends StatefulWidget {
  const RotateComplex({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RotateComplexState();
  }
}

class _RotateComplexState extends State<RotateComplex>
    with SingleTickerProviderStateMixin {
  // 1. GLOBAL UI & SEMANTIC STRINGS
  String _textlevel = '',
      _planettext = '',
      _formattedDate = '',
      _formattedTime = '',
      _settimestamp = 'דקות',
      cardstate = 'zb',
      silenceText = 'שתיקה',
      breathText = 'נשימה',
      simpleText = 'פשוט',
      complexText = 'מורכב',
      silenceBottomText = 'גוף',
      breathBottomText = 'גופוף',
      simpleBottomText = 'ווף',
      complexBottomText = 'ניגוף',
      bitchText = '.',
      octopussyText = ',',
      octocaText = ';',
      dogText = '"';

  // 2. VISIBILITY, LAYOUT & TOGGLES
  bool _setupdown = true,
      isSilenceText = true,
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

  double wheelgateopacity = 0.3, opacityLevel = 1.0, opacityMainLevel = 1.0;

  // 3. LOGIC, CALCULATION & TIME STATE
  int _currentmain = 0,
      _currentsub = 0,
      _currenttop = 0,
      _currentmid = 0,
      _currentbot = 0,
      _currentconstate = 0,
      _currentrotationstate = 0,
      _chosenhex = 1,
      _hexagramVal = 0,
      _carouselvalueindex = 0,
      _previousPlanetIndex = 0,
      _currentnote = 1,
      _linesListplace = 0,
      _gatesListplace = 0;

  final DateTime _now = DateTime.now();
  DateTime _personTime = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now();
  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  // 4. HUMAN DESIGN CENTERS & COLOR LOGIC
  int headstate = 3,
      ajnastate = 3,
      throatstate = 3,
      gstate = 3,
      sacralstate = 3,
      rootstate = 3,
      heartstate = 3,
      spleenstate = 3,
      solarstate = 3;

  int zbheadstate = 3,
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

  Color grampacolor = Colors.black,
      papacolor = Colors.black,
      soncolor = Colors.black,
      daughtercolor = Colors.black,
      mamacolor = Colors.black,
      grannycolor = Colors.black,
      colorindex = Colors.blue,
      cardcolor = Colors.black,
      timecolor = Colors.white,
      pickedColor = Colors.green;

  // final List<int> _gatestatelist = List.filled(65, 0, growable: false);
  List<int> tonallist = List.filled(4, 1, growable: false);

  List<String> coins64List = rtminmic65List,
      topcoinnamelist = zbzoo4namesHeb,
      midcoinnamelist = newcoinsHeb4lst,
      botcoinnamelist = coinsHeb4lst,
      maincoin = zbrussianames;

  ZBWallet _sunhex = ZBWallet(wallet: 1),
      _earthhex = ZBWallet(wallet: 1),
      _northnodehex = ZBWallet(wallet: 1),
      _southnodehex = ZBWallet(wallet: 1),
      _moonhex = ZBWallet(wallet: 1),
      _mercuryhex = ZBWallet(wallet: 1),
      _venushex = ZBWallet(wallet: 1),
      _marshex = ZBWallet(wallet: 1),
      _jupiterhex = ZBWallet(wallet: 1),
      _saturnhex = ZBWallet(wallet: 1),
      _uranushex = ZBWallet(wallet: 1),
      _neptunehex = ZBWallet(wallet: 1),
      _plutohex = ZBWallet(wallet: 1),
      _chironhex = ZBWallet(wallet: 1),
      _planethex = ZBWallet(wallet: 1);

  ZBWallet _sundesignhex = ZBWallet(wallet: 2),
      _earthdesignhex = ZBWallet(wallet: 2),
      _northnodedesignhex = ZBWallet(wallet: 2),
      _southnodedesignhex = ZBWallet(wallet: 2),
      _moondesignhex = ZBWallet(wallet: 2),
      _mercurydesignhex = ZBWallet(wallet: 2),
      _venusdesignhex = ZBWallet(wallet: 2),
      _marsdesignhex = ZBWallet(wallet: 2),
      _jupiterdesignhex = ZBWallet(wallet: 2),
      _saturndesignhex = ZBWallet(wallet: 2),
      _uranusdesignhex = ZBWallet(wallet: 2),
      _neptunedesignhex = ZBWallet(wallet: 2),
      _plutodesignhex = ZBWallet(wallet: 2),
      _chirondesignhex = ZBWallet(wallet: 2);

  List<ZBWallet> _planetsdesignList = List.generate(
    13,
    (index) => ZBWallet(
      wallet: 2, // Design Base
      note: 1,
    ),
  );

  List<ZBWallet> _planetspersonList = List.generate(
    13,
    (index) => ZBWallet(
      wallet: 1, // Personality Base
      note: 1,
    ),
  );

  List<ZBWallet> _planetsfulldisplayList = List.generate(
    14,
    (index) => ZBWallet(
      wallet: 1, // Defaulting to 1, will be overwritten by sync logic
      note: 1,
    ),
    growable: true,
  );

  // 6. LATE INITIALIZED CONTROLLERS
  late final TextEditingController _controllerType,
      _controllerAuthority,
      _controllerStrategy,
      _controllerSentence,
      _controllerFinalLine,
      _controllerDefinition,
      _controllerSetTime,
      _controllerPersonTime,
      _controllerDesignTime,
      _controllerTimePick,
      _controllerDatePick,
      _controllermaintext,
      _controllernotestory,
      _controllerwallettext,
      _controllernotetext;

  late final TextEditingController _controllerSunHex,
      _controllerSunText,
      _controllerSunGate,
      _controllerEarthHex,
      _controllerEarthText,
      _controllerEarthGate,
      _controllerMoonHex,
      _controllerMoonText,
      _controllerMoonGate,
      _controllerNorthNodeHex,
      _controllerNorthNodeText,
      _controllerNorthNodeGate,
      _controllerSouthNodeHex,
      _controllerSouthNodeText,
      _controllerSouthNodeGate,
      _controllerMercuryHex,
      _controllerMercuryText,
      _controllerMercuryGate,
      _controllerVenusHex,
      _controllerVenusText,
      _controllerVenusGate,
      _controllerMarsHex,
      _controllerMarsText,
      _controllerMarsGate,
      _controllerJupiterHex,
      _controllerJupiterText,
      _controllerJupiterGate,
      _controllerSaturnHex,
      _controllerSaturnText,
      _controllerSaturnGate,
      _controllerUranusHex,
      _controllerUranusText,
      _controllerUranusGate,
      _controllerNeptuneHex,
      _controllerNeptuneText,
      _controllerNeptuneGate,
      _controllerPlutoHex,
      _controllerPlutoText,
      _controllerPlutoGate,
      _controllerChironGate;

  late final TextEditingController _controllerDesignSunGate,
      _controllerDesignEarthGate,
      _controllerDesignMoonGate,
      _controllerDesignNorthNodeGate,
      _controllerDesignSouthNodeGate,
      _controllerDesignMercuryGate,
      _controllerDesignVenusGate,
      _controllerDesignMarsGate,
      _controllerDesignJupiterGate,
      _controllerDesignSaturnGate,
      _controllerDesignUranusGate,
      _controllerDesignNeptuneGate,
      _controllerDesignPlutoGate,
      _controllerDesignChironGate;

  late final TextEditingController _controllerwalletstory,
      _controllercointopfirsttext,
      _controllercointopsecondtext,
      _controllercointopthirdtext,
      _controllercoinmidfirsttext,
      _controllercoinmidsecondtext,
      _controllercoinmidthirdtext,
      _controllercoinbotfirsttext,
      _controllercoinbotsecondtext,
      _controllercoinbotthirdtext,
      _controllerPlanetType,
      _controllerPlanetSubType,
      _controllergrampatxt,
      _controllerpapaptxt,
      _controllersontxt,
      _controllerdaughtertxt,
      _controllermamatxt,
      _controllergrannytxt,
      _controllersavetxt,
      _controllerchartname,
      country,
      state,
      city;

  late final CarouselSliderController _controllercoin,
      _controllersubcoin,
      _controllerconstate,
      _controllerrotationstate,
      _controllertop,
      _controllermid,
      _controllerbot,
      _controlEvolutionContainerSlider,
      _controlComplexSlider,
      _controlSimpleSlider,
      _controlBreathSlider,
      _controlSilenceSlider;

  // --- 7. ADDITIONAL UI STATE & MISSING LISTS ---
  final List<bool> _isPlanetSelectedList = List<bool>.filled(
    13,
    false,
    growable: false,
  );
  final List<bool> _isBoldList = List<bool>.filled(65, false, growable: false);
  List<int> _hexalignedList = [0, 0, 0];

  List<ZBWallet> _planetsfullpersonList = List.filled(
        14,
        ZBWallet(wallet: 1),
        growable: true,
      ),
      _planetsfulldesignList =
          List.filled(14, ZBWallet(wallet: 1), growable: true);

  List coins384List = rtmix390lstHeb;
  List coinssidenamelist = rt6HEbcoins;
  List<Color> wheelwalletscolor = List.filled(
    64,
    Colors.black26,
    growable: false,
  );
  List<Color> complexrevtopcoincolor = List.generate(
    64,
    (index) => getWalletLayerColor(index, 'top', isReversed: true),
  );
  // --- 8. MODE COLORS & DIRECTION ICONS ---
  Color firstcolor = Colors.blue,
      secondcolor = Colors.blue,
      thirdcolor = Colors.blue,
      _colorinsilence = Colors.red,
      _colorinbreath = Colors.yellow,
      _colorinsimple = Colors.green,
      _colorincomplex = Colors.blue,
      _inbodycolor = Colors.red,
      _exbodycolor = Colors.yellow,
      _inpersoncolor = Colors.blue,
      _expersoncolor = Colors.green;

  IconData _inbodyicon = Icons.arrow_circle_right,
      _exbodyicon = Icons.arrow_circle_right,
      _inpersonicon = Icons.arrow_circle_left,
      _expersonicon = Icons.arrow_circle_left;

// zb new var for hd chart
  final double chartWidth = 350.0;
  final double chartHeight = 608.0;
  List<int> _walletstatelist = List.filled(65, 0, growable: false);
  int tmpdesignwallet = 1, tmppersonwallet = 1;
  ZBAccount? _currentActiveAccount;
  Color pickedcolor = Colors.white;
  String _selected64Category = 'סיבוב ארנקים',
      _selected384Category = 'סיבוב קווים'; // Default
  bool _isSyncing = false;
  ZBTheme _zbTheme = ZBTheme.zb;

  final Map<String, String> mstTranslator = {
    'CCG': 'Center Channel Gate',
    'CTW': 'Counter Transaction Wallet',
    'Center': 'Counter',
    'Channel': 'Transaction',
    'Gate': 'Wallet',
    'ST': 'Story Telling',
    'ZBS': 'Zmansi Bob Story'
  };

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    WidgetsFlutterBinding.ensureInitialized();
    await Sweph.init(
      // modulePath: 'sweph', // where to load module from.
      epheAssets: [
        //'packages/sweph/lib/zb/data/assets/ephe/seas_18.se1']);
        // 'packages/sweph/lib/zb/data/assets/ephe/seas_18.se1',
        // 'packages/sweph/lib/zb/data/assets/ephe/seas_12.se1',
        // 'packages/sweph/lib/zb/data/assets/ephe/sepl_12.se1',
        // 'packages/sweph/lib/zb/data/assets/ephe/sepl_18.se1'
        'assets/ephe/seas_18.se1',
        'assets/ephe/seas_12.se1',
        'assets/ephe/sepl_12.se1',
        'assets/ephe/sepl_18.se1',
        'assets/ephe/semo_12.se1',
        'assets/ephe/semo_18.se1',
      ],
    );
    super.setState(() {}); // to update widget data
  }

  @override
  void dispose() {
    // 4.1 Create a list of all your controllers
    final List<TextEditingController> allControllers = [
      _controllerType,
      _controllerAuthority,
      _controllerStrategy,
      _controllerSentence,
      _controllerDefinition,
      _controllerFinalLine,
      _controllerSetTime,
      _controllerPersonTime,
      _controllerDesignTime,
      _controllerTimePick,
      _controllerDatePick,
      _controllermaintext,
      _controllernotestory,
      _controllerwallettext,
      _controllernotetext,
      _controllerwalletstory,
      _controllercointopfirsttext,
      _controllercointopsecondtext,
      _controllercointopthirdtext,
      _controllercoinmidfirsttext,
      _controllercoinmidsecondtext,
      _controllercoinmidthirdtext,
      _controllercoinbotfirsttext,
      _controllercoinbotsecondtext,
      _controllercoinbotthirdtext,
      _controllerNorthNodeHex,
      _controllerNorthNodeText,
      _controllerNorthNodeGate,
      _controllerDesignNorthNodeGate,
      _controllerSunHex,
      _controllerSunText,
      _controllerSunGate,
      _controllerDesignSunGate,
      _controllerMoonHex,
      _controllerMoonText,
      _controllerMoonGate,
      _controllerDesignMoonGate,
      _controllerMarsHex,
      _controllerMarsText,
      _controllerMarsGate,
      _controllerDesignMarsGate,
      _controllerVenusHex,
      _controllerVenusText,
      _controllerVenusGate,
      _controllerDesignVenusGate,
      _controllerMercuryHex,
      _controllerMercuryText,
      _controllerMercuryGate,
      _controllerDesignMercuryGate,
      _controllerJupiterHex,
      _controllerJupiterText,
      _controllerJupiterGate,
      _controllerDesignJupiterGate,
      _controllerSaturnHex,
      _controllerSaturnText,
      _controllerSaturnGate,
      _controllerDesignSaturnGate,
      _controllerUranusHex,
      _controllerUranusText,
      _controllerUranusGate,
      _controllerDesignUranusGate,
      _controllerNeptuneHex,
      _controllerNeptuneText,
      _controllerNeptuneGate,
      _controllerDesignNeptuneGate,
      _controllerPlutoHex,
      _controllerPlutoText,
      _controllerPlutoGate,
      _controllerDesignPlutoGate,
      _controllerChironGate,
      _controllerDesignChironGate,
      _controllerEarthHex,
      _controllerEarthText,
      _controllerEarthGate,
      _controllerDesignEarthGate,
      _controllerSouthNodeHex,
      _controllerSouthNodeText,
      _controllerSouthNodeGate,
      _controllerDesignSouthNodeGate,
      _controllerPlanetType,
      _controllerPlanetSubType,
      _controllergrampatxt,
      _controllerpapaptxt,
      _controllersontxt,
      _controllerdaughtertxt,
      _controllermamatxt,
      _controllergrannytxt,
      _controllersavetxt,
      _controllerchartname,
      country,
      state,
      city,
    ];

    // 4.2 The "Breath" way: Loop and destroy
    for (var controller in allControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Initialize everything in order
    _initTextControllers();
    _initCarouselControllers();

    // Set initial Time to UTC Now (replaces the static 00:00)
    final DateTime nowUtc = DateTime.now().toUtc();
    _selectedtime = TimeOfDay(hour: nowUtc.hour, minute: nowUtc.minute);
    _setDateTime(nowUtc);

    // _applyInitialState3();
    _applyInitialSimpleState();
    // 2. Background Generation
    _initComplexData();

    // Run this when the app starts or when a new chart is injected
    _isPlanetSelectedList.fillRange(0, _isPlanetSelectedList.length, false);
    _isPlanetSelectedList[0] = true; // Light up the Sun
    _previousPlanetIndex = 0; // Set index to Sun
  }

  void _applyInitialSimpleState() {
    setState(() {
      // Fill the 64 wallets with State 3
      _walletstatelist.fillRange(0, _walletstatelist.length, 4);

      // Fill the Global Registry centers with State 3
      ZBData.counterMap.forEach((id, counter) {
        counter.state = 4;
      });
    });
  }

  Future<void> _initComplexData() async {
    await Sweph.init();
    // This uses your fixed helper
    final DateTime initNow = DateTime.now().toUtc();
    _selectedtime = TimeOfDay(hour: initNow.hour, minute: initNow.minute);
    _setDateTime(initNow);
    ZBAccount currentMoment = await ZBHelpers.generateAccount(
      initNow,
      isNow: true,
    );

    if (mounted) {
      setState(() {
        _currentActiveAccount = currentMoment;
        // Now the UI 'snaps' from Yellow to the calculated Birth states
        _syncUIWithAccount(currentMoment);
      });
    }
  }

  void _initTextControllers() {
    // 3.1 Main & Time
    _controllerType = TextEditingController();
    _controllerAuthority = TextEditingController();
    _controllerStrategy = TextEditingController();
    _controllerSentence = TextEditingController();
    _controllerFinalLine = TextEditingController();
    _controllerDefinition = TextEditingController();
    _controllerSetTime = TextEditingController();
    _controllerPersonTime = TextEditingController();
    _controllerDesignTime = TextEditingController();
    _controllerTimePick = TextEditingController();
    _controllerDatePick = TextEditingController();
    _controllermaintext = TextEditingController();
    _controllernotestory = TextEditingController();
    _controllerwallettext = TextEditingController();
    _controllernotetext = TextEditingController();

    // 3.2 Personality Mapping
    _controllerSunHex = TextEditingController();
    _controllerSunText = TextEditingController();
    _controllerSunGate = TextEditingController();
    _controllerEarthHex = TextEditingController();
    _controllerEarthText = TextEditingController();
    _controllerEarthGate = TextEditingController();
    _controllerMoonHex = TextEditingController();
    _controllerMoonText = TextEditingController();
    _controllerMoonGate = TextEditingController();
    _controllerNorthNodeHex = TextEditingController();
    _controllerNorthNodeText = TextEditingController();
    _controllerNorthNodeGate = TextEditingController();
    _controllerSouthNodeHex = TextEditingController();
    _controllerSouthNodeText = TextEditingController();
    _controllerSouthNodeGate = TextEditingController();
    _controllerMercuryHex = TextEditingController();
    _controllerMercuryText = TextEditingController();
    _controllerMercuryGate = TextEditingController();
    _controllerVenusHex = TextEditingController();
    _controllerVenusText = TextEditingController();
    _controllerVenusGate = TextEditingController();
    _controllerMarsHex = TextEditingController();
    _controllerMarsText = TextEditingController();
    _controllerMarsGate = TextEditingController();
    _controllerJupiterHex = TextEditingController();
    _controllerJupiterText = TextEditingController();
    _controllerJupiterGate = TextEditingController();
    _controllerSaturnHex = TextEditingController();
    _controllerSaturnText = TextEditingController();
    _controllerSaturnGate = TextEditingController();
    _controllerUranusHex = TextEditingController();
    _controllerUranusText = TextEditingController();
    _controllerUranusGate = TextEditingController();
    _controllerNeptuneHex = TextEditingController();
    _controllerNeptuneText = TextEditingController();
    _controllerNeptuneGate = TextEditingController();
    _controllerPlutoHex = TextEditingController();
    _controllerPlutoText = TextEditingController();
    _controllerPlutoGate = TextEditingController();

    // 3.3 Design Mapping
    _controllerDesignSunGate = TextEditingController();
    _controllerDesignEarthGate = TextEditingController();
    _controllerDesignMoonGate = TextEditingController();
    _controllerDesignNorthNodeGate = TextEditingController();
    _controllerDesignSouthNodeGate = TextEditingController();
    _controllerDesignMercuryGate = TextEditingController();
    _controllerDesignVenusGate = TextEditingController();
    _controllerDesignMarsGate = TextEditingController();
    _controllerDesignJupiterGate = TextEditingController();
    _controllerDesignSaturnGate = TextEditingController();
    _controllerDesignUranusGate = TextEditingController();
    _controllerDesignNeptuneGate = TextEditingController();
    _controllerDesignPlutoGate = TextEditingController();
    _controllerChironGate = TextEditingController();
    _controllerDesignChironGate = TextEditingController();

    // 3.4 UI & Location
    _controllerwalletstory = TextEditingController();
    _controllercointopfirsttext = TextEditingController();
    _controllercointopsecondtext = TextEditingController();
    _controllercointopthirdtext = TextEditingController();
    _controllercoinmidfirsttext = TextEditingController();
    _controllercoinmidsecondtext = TextEditingController();
    _controllercoinmidthirdtext = TextEditingController();
    _controllercoinbotfirsttext = TextEditingController();
    _controllercoinbotsecondtext = TextEditingController();
    _controllercoinbotthirdtext = TextEditingController();
    _controllerPlanetType = TextEditingController();
    _controllerPlanetSubType = TextEditingController();
    _controllergrampatxt = TextEditingController();
    _controllerpapaptxt = TextEditingController();
    _controllersontxt = TextEditingController();
    _controllerdaughtertxt = TextEditingController();
    _controllermamatxt = TextEditingController();
    _controllergrannytxt = TextEditingController();
    _controllersavetxt = TextEditingController();
    _controllerchartname = TextEditingController();
    country = TextEditingController();
    state = TextEditingController();
    city = TextEditingController();
  }

  void _initCarouselControllers() {
    _controllercoin = CarouselSliderController();
    _controllersubcoin = CarouselSliderController();
    _controllerconstate = CarouselSliderController();
    _controllerrotationstate = CarouselSliderController();
    _controllertop = CarouselSliderController();
    _controllermid = CarouselSliderController();
    _controllerbot = CarouselSliderController();
    _controlEvolutionContainerSlider = CarouselSliderController();
    _controlComplexSlider = CarouselSliderController();
    _controlSimpleSlider = CarouselSliderController();
    _controlBreathSlider = CarouselSliderController();
    _controlSilenceSlider = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    int? imageIndex;
    if (_planethex.wallet > 0 && _planethex.note != null) {
      imageIndex = (_planethex.wallet * 6) - 7 + (_planethex.note ?? 1);
    }
    final buildaccount = _currentActiveAccount;
    if (buildaccount == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
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
          onPressed: () => zbPop(context),
          //onPressed: () => Navigator.pushNamed(context, mainroutes[0]),
        ),
        //backgroundColor: Colors.lightBlue.withValues(alpha:0.2),
        backgroundColor: Colors.transparent,
        actions: const [SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[0]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[1]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[2]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
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
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    //borderRadius: BorderRadius.circular(25),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        dogText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.7,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    //borderRadius: BorderRadius.circular(25),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        octocaText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.7,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        octopussyText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.7,
                        ),
                      ),
                    ),
                    onTap: () {
                      isOctopussyText = !isOctopussyText;
                      setState(() {
                        isOctopussyText == true
                            ? octopussyText = "octopussy,"
                            : octopussyText = ",ג'ולייטה";
                      });
                    },
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5.5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        bitchText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.7,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    //borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white60,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        complexText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.7,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    //borderRadius: BorderRadius.circular(25),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white60,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        simpleText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.8,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        breathText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.9,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                        silenceText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 2.0,
                        ),
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
            const Divider(color: Colors.transparent, thickness: 5),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // 1. Generate the account data using the helper
                    ZBAccount currentMoment = await ZBHelpers.generateAccount(
                      DateTime.now(),
                      isNow: true,
                    );

                    // 2. Sync the UI with the new data
                    _syncUIWithAccount(currentMoment);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'כעט',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                ElevatedButton(
                  onPressed: () async {
                    _selectedtime = await TimeServices.selectTime(context);
                    setState(() {
                      _controllerTimePick.text = _selectedtime.format(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'ושעה',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 5.0),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'תאריך',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 5.0),
                // zb inject time data
                ElevatedButton(
                  onPressed: () async {
                    DateTime personTime = _selectedDate.applied(_selectedtime);

                    // Let the helper handle ALL the math (Personality and 88° Design)
                    ZBAccount birthAccount = await ZBHelpers.generateAccount(
                      personTime,
                      isNow: false,
                    );

                    // One function to rule them all
                    _syncUIWithAccount(birthAccount);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'לפלוט',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10.0),
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
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerTimePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerDatePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.transparent, thickness: 6),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZBSmartImage(
                  id: _currentActiveAccount?.typeid ?? 0,
                  dataMap: ZBData.getTypeMap,
                  size: 120, // Ensure this is static in ZBType class
                ),
                ZBSmartImage(
                  id: _currentActiveAccount?.authid ?? 0,
                  dataMap: ZBData.getAuthMap,
                  size: 70, // Ensure this is static in ZBAuthority class
                ),
              ],
            ),
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
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
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
            // zb new hd chart
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    _zbTheme == ZBTheme.zb ? Icons.adjust : Icons.adjust,
                    color:
                        _zbTheme == ZBTheme.zb ? Colors.amber : Colors.blueGrey,
                    size: 28,
                  ),
                  tooltip: _zbTheme == ZBTheme.zb ? 'ZB' : 'HD',
                  onPressed: () => setState(() {
                    _zbTheme = _zbTheme == ZBTheme.zb ? ZBTheme.hd : ZBTheme.zb;
                  }),
                ),
                SizedBox(
                  width: 300,
                  height: 30,
                  child: AutoSizeTextField(
                    maxLines: 1,
                    minFontSize: 15,
                    maxFontSize: 25,
                    fullwidth: false,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'סיפור בתוך דיאני',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
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
              ],
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: chartWidth,
                    height: chartHeight,
                    decoration: BoxDecoration(
                      // color: cardcolor, // Using your existing variable
                      color: _zbTheme == ZBTheme.zb
                          ? Colors.black
                          : Colors.grey.shade300,

                      border: Border.all(color: Colors.blue, width: 4),
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        width: chartWidth,
                        height: chartHeight,
                        child: RepaintBoundary(
                          child: _currentActiveAccount == null
                              ? const CircularProgressIndicator()
                              : ZBAccountChart(
                                  // 1. The Unique Key (Ensures fresh paint on swipe)
                                  key: ValueKey(
                                      'chart_${buildaccount?.timestamp}_$_zbTheme'),
                                  // 2. The Account (Now pulled from your class-level variable)
                                  account: buildaccount,
                                  // 3. The Data Repositories
                                  registry: ZBData.counterMap,
                                  walletStates: _walletstatelist,
                                  pickedcolor: pickedcolor,
                                  zbtheme: _zbTheme,

                                  // 4. The Wallet Builder (The missing piece)
                                  walletBuilder: (n) {
                                    final int state = _walletstatelist[n];
                                    return ZBStyles.buildWalletText(
                                      n,
                                      state: state,
                                      theme:
                                          _zbTheme, // ✅ ADD THIS: Pass the current theme variable
                                    );
                                  },

                                  // 5. Interactivity
                                  onCounterTap: (id) {
                                    // your tap logic
                                  },
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 150,
                  child: AutoSizeTextField(
                    minFontSize: 16,
                    readOnly: true,
                    decoration: InputDecoration.collapsed(
                      hintText: DateFormat.Hm().format(_now),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerTimePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CarouselSlider(
                    items: boolCoins,
                    carouselController: _controllerconstate,
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 1.3,
                      // Line 2383 - Unified Lens Switch
                      onPageChanged: (indexconstate, reason) {
                        setState(() {
                          _currentconstate = indexconstate;

                          // zb update then delete

                          if (_currentconstate == 0) {
                            // --- 🔵 BLUE (Personality) ---
                            _planetsfulldisplayList = _planetsfullpersonList;
                            _setDateTime(_personTime);
                            _controllerPlanetType.text =
                                'אחר כך לחשוב'; // Think Later

                            _textlevel = 'complex';
                            _controllerrotationstate.jumpToPage(0);
                          } else {
                            // --- 🔴 RED (Design) ---
                            _planetsfulldisplayList = _planetsfulldesignList;
                            _setDateTime(_designTime);
                            _controllerPlanetType.text =
                                'קודם לחיות'; // Live First

                            _textlevel = 'silence';
                            _controllerrotationstate.jumpToPage(3);
                          }

                          // 💡 REFRESH ACTIVE PLANET DATA
                          // Pull the data from the newly selected list (Personality or Design)
                          _planethex =
                              _planetsfulldisplayList[_previousPlanetIndex];

                          // Use local variables to ensure clean integer handling
                          int syncedwallet = _planethex.wallet;
                          int syncednote = _planethex.note ?? 1;

                          // 1. UPDATE NUMERIC CONTROLLERS
                          _controllerwallettext.text = syncedwallet.toString();
                          _controllernotetext.text = syncednote.toString();

                          // 2. UPDATE STORY CONTROLLERS (Using ZBData Bridge)
                          // This prevents the "int is not a subtype of String" error by using the dictionary math
                          _controllerwalletstory.text = ZBData.getWalletStory(
                              syncedwallet, _selected64Category);

                          _controllernotestory.text = ZBData.getWalletNoteStory(
                              syncedwallet, syncednote, _selected384Category);

                          // 3. REFRESH VISUALS
                          _setCoins(); // Updates the visual coin/trigram state
                          _controlPlanetWalletData();
                          // _planetsfulldisplayList); // Re-calculates for the Bodygraph

                          // Force the chart painter to recognize the state change
                          resetChartColor();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 150,
                  child: AutoSizeTextField(
                    minFontSize: 16,
                    readOnly: true,
                    decoration: InputDecoration.collapsed(
                      //hintText: DateFormat('MM/dd/yyyy').format(_now),
                      hintText: _formatDate(_now),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerDatePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // zb new time code update

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BLUE DOG: Reset to current personTime
                IconButton(
                  icon: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      foregroundImage: AssetImage('assets/planets/sun.png')),
                  onPressed: () => _performZBTimeUpdate(_personTime),
                ),
                const SizedBox(width: 5),
                // UP ARROW
                IconButton(
                  icon: const CircleAvatar(
                      foregroundImage: AssetImage('assets/coins/complex.png')),
                  onPressed: () => controlSetTime(true),
                ),
                const SizedBox(width: 5),
                // DOWN ARROW
                IconButton(
                  icon: const CircleAvatar(
                      foregroundImage: AssetImage('assets/coins/silence.png')),
                  onPressed: () => controlSetTime(false),
                ),
                // ... Dropdown and Textfield remain the same ...
                // Inside your Flex row...
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _settimestamp,
                    items: timecoinsDropDownLst, // Your Hebrew timescale list
                    onChanged: (String? newValue) {
                      setState(() {
                        _settimestamp = newValue ?? "דקות";
                      });
                    },
                  ),
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
                    decoration: const InputDecoration.collapsed(
                        hintText: '1'), // Removes underline
                    controller: _controllerSetTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 3,
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
                SizedBox(
                  width: Screen.width / 3,
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
                          _buildTransactionsPopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'תנו לאיות',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    //'Rotate Design',
                    'זמן עיצוב',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            // BLUE WHEEL
            const SizedBox(height: 10),
            Stack(
              children: [
                Center(
                  child: CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: Screen.width / 60,
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
                    innerRadius: Screen.width / 60 + 70,
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
                            image: AssetImage(
                              zodiacSwephImagelist[
                                  (_planetsfullpersonList[index].zodiacid ??
                                      0)],
                            ),
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
                    innerRadius: Screen.width / 60 + 130,
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
                          border: Border.all(width: 1, color: Colors.blue),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            (_planetsfullpersonList[index].walletNote)
                                .toString(),
                            minFontSize: 10,
                            maxFontSize: 12,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerTimePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerDatePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // zb new time code update

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BLUE DOG: Reset to current personTime
                IconButton(
                  icon: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      foregroundImage: AssetImage('assets/planets/sun.png')),
                  onPressed: () => _performZBTimeUpdate(_personTime),
                ),
                const SizedBox(width: 5),
                // UP ARROW
                IconButton(
                  icon: const CircleAvatar(
                      foregroundImage: AssetImage('assets/coins/complex.png')),
                  onPressed: () => controlSetTime(true),
                ),
                const SizedBox(width: 5),
                // DOWN ARROW
                IconButton(
                  icon: const CircleAvatar(
                      foregroundImage: AssetImage('assets/coins/silence.png')),
                  onPressed: () => controlSetTime(false),
                ),
                // ... Dropdown and Textfield remain the same ...
                // Inside your Flex row...
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _settimestamp,
                    items: timecoinsDropDownLst, // Your Hebrew timescale list
                    onChanged: (String? newValue) {
                      setState(() {
                        _settimestamp = newValue ?? "דקות";
                      });
                    },
                  ),
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
                    decoration: const InputDecoration.collapsed(
                        hintText: '1'), // Removes underline
                    controller: _controllerSetTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Stack(
              children: [
                // Center(child: Text('test')),
                Center(
                  child: CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: Screen.width / 60,
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
                    innerRadius: Screen.width / 60 + 70,
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
                            image: AssetImage(
                              zodiacSwephImagelist[
                                  (_planetsfulldesignList[index].zodiacid ??
                                      0)],
                            ),
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
                    innerRadius: Screen.width / 60 + 130,
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
                          border: Border.all(width: 1, color: Colors.red),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            (_planetsfulldesignList[index].walletNote),
                            minFontSize: 10,
                            maxFontSize: 12,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            // zb new complex mandala use
            Center(
              child: ZBMandalaWidget(
                key: ValueKey(
                    'mandala_${_currentActiveAccount?.timestamp ?? 'loading'}'),
                walletsState: _walletstatelist,
                onTapWallet: _handleComplexTap,
              ),
            ),
            const Divider(color: Colors.blue, thickness: 8),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    //'Wallets',
                    'ארנקים',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    //'Coins',
                    'מטבעות',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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

            ToggleButtons(
              direction: Axis.horizontal,
              constraints: BoxConstraints.expand(
                width: Screen.width * 0.9 / 14,
                height: Screen.height * 0.9 / 14,
              ),
              borderWidth: 0.5,
              hoverColor: Colors.black,
              //borderRadius: BorderRadius.circular(20),
              fillColor: Colors.blue,
              isSelected: _isPlanetSelectedList,
              // isSelected: _isPlanetSelectedList.sublist(0, 13),
              onPressed: (int index) {
                setState(() {
                  // 1. Manage Selection List (Clear ALL first to be safe)
                  if (_previousPlanetIndex != -1 &&
                      _previousPlanetIndex < _isPlanetSelectedList.length) {
                    _isPlanetSelectedList[_previousPlanetIndex] = false;
                  }

                  // 2. Set new selection
                  _isPlanetSelectedList[index] = true;
                  _previousPlanetIndex = index;

                  // 3. Grab the data (index is guaranteed 0-12 here)
                  final selectedHex = _planetsfulldisplayList[index];
                  _updateUITextFromPlanet(selectedHex);
                });
              },
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage("assets/planets/sun.png"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage("assets/planets/earth.png"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/planets/northnode.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/planets/southnode.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage("assets/planets/moon.png"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/planets/mercury.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage("assets/planets/venus.png"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage("assets/planets/mars.png"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/planets/jupiter.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/planets/saturn.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/planets/uranus.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/planets/neptune.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: AssetImage("assets/planets/pluto.png"),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.blue),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: zodiacSwephNameHeblist[(_planethex.zodiacid ?? 0)],
                  child: Container(
                    width: 80,
                    height: 80,
                    //margin: const EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(
                          zodiacSwephImagelist[(_planethex.zodiacid ?? 0)],
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          //Colors.purple.shade900,
                          //Colors.purple.shade100,
                          zodiacSwephGradeColorlist[
                              (_planethex.zodiacid ?? 0) * 2],
                          zodiacSwephGradeColorlist[
                              (_planethex.zodiacid ?? 0) * 2 + 1],
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    InkWell(
                      child: Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage(
                              (imageIndex != null &&
                                      imageIndex >= 0 &&
                                      imageIndex < hdplanetexaltimg.length)
                                  ? hdplanetexaltimg[imageIndex]
                                  : 'assets/planets/sun.png', // Fallback for State 3 / Blueprint
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPlanetUpDownDialog(context, 1),
                        );
                        //setState(() {
                        //});
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          ///color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage(
                              (imageIndex != null &&
                                      imageIndex >= 0 &&
                                      imageIndex < hdplanetdetrimentimg.length)
                                  ? hdplanetdetrimentimg[imageIndex]
                                  : 'assets/planets/earth.png', // Fallback for State 3 / Blueprint
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPlanetUpDownDialog(context, 0),
                        );
                        //_buildPlanetUpDownDialog(context, 0);
                        //setState(() {
                        //});
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 35,
                  height: 35,
                  //margin: const EdgeInsets.only(top: 20, left: 40),
                  child: AutoSizeTextField(
                    fullwidth: false,
                    minFontSize: 30,
                    maxFontSize: 35,
                    decoration: const InputDecoration.collapsed(
                      hintText: '1',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      //fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllerwallettext,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  width: 35,
                  height: 35,
                  //margin: const EdgeInsets.only(top: 20, left: 70),
                  child: AutoSizeTextField(
                    fullwidth: false,
                    minFontSize: 20,
                    maxFontSize: 25,
                    decoration: const InputDecoration.collapsed(
                      hintText: '1',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      //fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllernotetext,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.blue),
            SizedBox(
              width: Screen.width,
              height: 270,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstrainedBox(
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

                                      _hexagramVal = ((_currenttop + 1) * 100 +
                                          (_currentmid + 1) * 10 +
                                          (_currentbot + 1));

                                      _carouselvalueindex =
                                          hexCarouselWheelOrderList.indexOf(
                                        _hexagramVal,
                                      );

                                      _chosenhex = orderHexagramsWheel[
                                          _carouselvalueindex];

                                      _controllerwallettext.text =
                                          _chosenhex.toString();

                                      // idonotknow _currentline
                                      //_controllergatelinestory.text = 'test';
                                      _controllernotestory.text =
                                          coins384List[(coins384List.indexOf(
                                                _chosenhex,
                                              ) +
                                              _currentnote)];

                                      _controllerwalletstory.text =
                                          coins64List[_chosenhex];

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
                                  },
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
                                  child: const AutoSizeText(
                                    '6',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: thirdcolor,
                                  child: const AutoSizeText(
                                    '5',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
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
                                    IconData(
                                      rt6iconshex[6],
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    color: thirdcolor,
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                    IconData(
                                      rt6iconshex[5],
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    color: thirdcolor,
                                  ),
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
                                    child: AutoSizeText(
                                      coinssidenamelist[6],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
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
                                  child: AutoSizeText(
                                    coinssidenamelist[5],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstrainedBox(
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

                                      _hexagramVal = ((_currenttop + 1) * 100 +
                                          (_currentmid + 1) * 10 +
                                          (_currentbot + 1));

                                      _carouselvalueindex =
                                          hexCarouselWheelOrderList.indexOf(
                                        _hexagramVal,
                                      );

                                      _chosenhex = orderHexagramsWheel[
                                          _carouselvalueindex];

                                      _controllerwallettext.text =
                                          _chosenhex.toString();

                                      //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

                                      _controllerwalletstory.text =
                                          coins64List[_chosenhex];

                                      _controllernotestory.text =
                                          coins384List[(coins384List.indexOf(
                                                _chosenhex,
                                              ) +
                                              _currentnote)];

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
                                  },
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
                                  child: const AutoSizeText(
                                    '4',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: secondcolor,
                                  child: const AutoSizeText(
                                    '3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
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
                                    IconData(
                                      rt6iconshex[4],
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    color: secondcolor,
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                    IconData(
                                      rt6iconshex[3],
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    color: secondcolor,
                                  ),
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
                                  child: AutoSizeText(
                                    coinssidenamelist[4],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  color: secondcolor,
                                  child: AutoSizeText(
                                    coinssidenamelist[3],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
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
                                            hexCarouselWheelOrderList.indexOf(
                                          _hexagramVal,
                                        );

                                        _chosenhex = orderHexagramsWheel[
                                            _carouselvalueindex];

                                        _controllerwallettext.text =
                                            _chosenhex.toString();

                                        //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

                                        _controllerwalletstory.text =
                                            coins64List[_chosenhex];

                                        _controllernotestory.text =
                                            coins384List[(coins384List.indexOf(
                                                  _chosenhex,
                                                ) +
                                                _currentnote)];

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
                                    },
                                  ),
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
                                  child: const AutoSizeText(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: firstcolor,
                                  child: const AutoSizeText(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
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
                                    IconData(
                                      rt6iconshex[2],
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    shadows: const [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 15.0,
                                      ),
                                    ],
                                    color: firstcolor,
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                  child: Icon(
                                    IconData(
                                      rt6iconshex[1],
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    color: firstcolor,
                                    size: 10,
                                  ),
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
                                  child: AutoSizeText(
                                    coinssidenamelist[2],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  color: firstcolor,
                                  child: AutoSizeText(
                                    coinssidenamelist[1],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.blue,
              //thickness: 20,
            ),
            SizedBox(
              //width: Screen.width / 1.7,
              width: Screen.width / 1.5,
              child: AutoSizeTextField(
                minLines: 2,
                maxLines: 4,
                minFontSize: 18,
                maxFontSize: 18,
                fullwidth: true,
                decoration: const InputDecoration.collapsed(
                  //hintText: LineSentenceList[0],
                  hintText: 'אוכל לאיות',
                  hintStyle: TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                controller: _controllerwalletstory,
                readOnly: false,
              ),
            ),
            const Divider(color: Colors.blue),
            // Text('Gate Line Story'),
            SizedBox(
              //width: Screen.height / 3,
              width: Screen.width / 1.5,
              child: AutoSizeTextField(
                minLines: 3,
                maxLines: 4,
                minFontSize: 15,
                maxFontSize: 15,
                fullwidth: true,
                decoration: const InputDecoration.collapsed(
                  //hintText: 'Rotating Coins Story',
                  hintText: 'תוסף לאיות',
                  hintStyle: TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
                controller: _controllernotestory,
                readOnly: false,
              ),
            ),
            const Divider(color: Colors.blue),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    decoration: InputDecoration.collapsed(
                      hintText: botcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: thirdcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercoinbotthirdtext,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    decoration: InputDecoration.collapsed(
                      hintText: botcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercoinbotsecondtext,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    minFontSize: 10,
                    maxFontSize: 30,
                    decoration: InputDecoration.collapsed(
                      hintText: botcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: firstcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercoinbotfirsttext,
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    decoration: InputDecoration.collapsed(
                      hintText: midcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: thirdcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercoinmidthirdtext,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    decoration: InputDecoration.collapsed(
                      hintText: newcoinsHeb4lst[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercoinmidsecondtext,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    minFontSize: 10,
                    maxFontSize: 30,
                    decoration: InputDecoration.collapsed(
                      hintText: midcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: firstcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercoinmidfirsttext,
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    decoration: InputDecoration.collapsed(
                      hintText: topcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: thirdcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercointopthirdtext,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    decoration: InputDecoration.collapsed(
                      hintText: topcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercointopsecondtext,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: Screen.width * 0.33,
                  child: AutoSizeTextField(
                    minFontSize: 10,
                    maxFontSize: 30,
                    decoration: InputDecoration.collapsed(
                      hintText: topcoinnamelist[0],
                      hintStyle: const TextStyle(color: Colors.blue),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: firstcolor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllercointopfirsttext,
                    readOnly: true,
                  ),
                ),
              ],
            ),

            const Divider(color: Colors.blue),
            // rt evolution
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 10,
                minWidth: 10,
                maxHeight: Screen.height * 0.25,
                maxWidth: Screen.width,
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
                        image: const AssetImage(
                          'assets/camog/zbredog.png',
                        ),
                        colorFilter: ColorFilter.mode(
                          Colors.white.withValues(alpha: 1.0),
                          BlendMode.modulate,
                        ),
                      ),
                    ),
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
                    onPressed: () {},
                  ),
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
                        image: const AssetImage(
                          'assets/camog/zbluedog.png',
                        ),
                        colorFilter: ColorFilter.mode(
                          Colors.white.withValues(alpha: 1.0),
                          BlendMode.modulate,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //  colorinsimple: Colors.green, colorincomplex: Colors.blue)
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 10,
                minWidth: 10,
                maxHeight: Screen.height * 0.25,
                maxWidth: Screen.width,
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
                        image: const AssetImage(
                          'assets/camog/zbyellowoctopussy.png',
                        ),
                        colorFilter: ColorFilter.mode(
                          Colors.white.withValues(alpha: 1.0),
                          BlendMode.modulate,
                        ),
                      ),
                    ),
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
                    onPressed: () {},
                    //onPressed: () => Navigator.pushNamed(context, mainroutes[0]),
                  ),
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color:
                            Colors.green, //                   <--- border color
                        width: 3.0,
                      ),
                      image: DecorationImage(
                        //image: AssetImage(newminmaxcoins[index]),
                        image: const AssetImage(
                          'assets/camog/zbgreenoctopus.png',
                        ),
                        colorFilter: ColorFilter.mode(
                          Colors.white.withValues(alpha: 1.0),
                          BlendMode.modulate,
                        ),
                      ),
                    ),
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
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerTimePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                    controller: _controllerDatePick,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BLUE DOG: Reset to current personTime
                IconButton(
                  icon: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      foregroundImage: AssetImage('assets/planets/sun.png')),
                  onPressed: () => _performZBTimeUpdate(_personTime),
                ),
                const SizedBox(width: 5),
                // UP ARROW
                IconButton(
                  icon: const CircleAvatar(
                      foregroundImage: AssetImage('assets/coins/complex.png')),
                  onPressed: () => controlSetTime(true),
                ),
                const SizedBox(width: 5),
                // DOWN ARROW
                IconButton(
                  icon: const CircleAvatar(
                      foregroundImage: AssetImage('assets/coins/silence.png')),
                  onPressed: () => controlSetTime(false),
                ),
                // ... Dropdown and Textfield remain the same ...
                // Inside your Flex row...
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _settimestamp,
                    items: timecoinsDropDownLst, // Your Hebrew timescale list
                    onChanged: (String? newValue) {
                      setState(() {
                        _settimestamp = newValue ?? "דקות";
                      });
                    },
                  ),
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
                    decoration: const InputDecoration.collapsed(
                        hintText: '1'), // Removes underline
                    controller: _controllerSetTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignSunGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _sunhex.notename ?? "";
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
                    foregroundImage: AssetImage(
                      'assets/planets/sun.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
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
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignEarthGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _earthhex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/earth.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerEarthGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignNorthNodeGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _northnodehex.notename ?? "";
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
                    foregroundImage: AssetImage(
                      'assets/planets/northnode.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
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
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignSouthNodeGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _southnodehex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/southnode.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerSouthNodeGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignMoonGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _moonhex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/moon.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerMoonGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignMercuryGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _mercuryhex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/mercury.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerMercuryGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignVenusGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _venushex.notename ?? "";                          break;
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
                    backgroundImage: AssetImage(
                      'assets/planets/venus.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerVenusGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignMarsGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _marshex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/mars.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerMarsGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignJupiterGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _jupiterhex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/jupiter.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerJupiterGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignSaturnGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _saturnhex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/saturn.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerSaturnGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignUranusGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _uranushex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/uranus.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerUranusGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignNeptuneGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _neptunehex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/neptune.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerNeptuneGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignPlutoGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _plutohex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/pluto.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerPlutoGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
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
                              _setTextLevels(_textlevel);
                              break;
                            case 1:
                              _textlevel = 'simple';
                              _setTextLevels(_textlevel);
                              break;
                            case 2:
                              _textlevel = 'breath';
                              _setTextLevels(_textlevel);
                              break;
                            case 3:
                              _textlevel = 'silence';
                              _setTextLevels(_textlevel);
                              break;
                            default:
                              _textlevel = 'complex';
                              _setTextLevels(_textlevel);
                              break;
                          }
                        });
                      },
                    ),
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
                  width: Screen.width / 3,
                  child: AutoSizeTextField(
                    fullwidth: false,
                    readOnly: true,
                    textAlign: TextAlign.right,
                    decoration:
                        //const InputDecoration.collapsed(hintText: 'Sentence'),
                        const InputDecoration.collapsed(hintText: 'משפטי'),
                    controller: _controllerPlanetSubType,
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: Screen.width / 3,
                  child: AutoSizeTextField(
                    fullwidth: false,
                    textAlign: TextAlign.left,
                    readOnly: true,
                    decoration:
                        //const InputDecoration.collapsed(hintText: 'Rotation'),
                        const InputDecoration.collapsed(hintText: 'סיבוב'),
                    controller: _controllerPlanetType,
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerDesignChironGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
                      case 0:
                        //_planettext = _plutohex.notename ?? "";
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
                    backgroundImage: AssetImage(
                      'assets/planets/chiron.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.width / 4,
                  child: AutoSizeTextField(
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    textAlign: TextAlign.center,
                    controller: _controllerChironGate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Screen.width / 2,
              child: AutoSizeTextField(
                readOnly: false,
                decoration: const InputDecoration.collapsed(
                  hintText: 'מחזיק מטבע לרגע',
                ),
                textAlign: TextAlign.center,
                controller: _controllersavetxt,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            const Divider(color: Colors.blue),
            SizedBox(
              height: 300,
              width: 350,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.2,
                  crossAxisCount: 5, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: const EdgeInsets.all(4.0), // padding around the grid
                itemCount: 20, // total number of items
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(rtimgcoins[index]),
                        colorFilter: ColorFilter.mode(
                          Colors.white.withValues(alpha: 1.0),
                          BlendMode.modulate,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(color: Colors.blue),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[0]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[1]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(zoo4lst[2]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: Screen.height / 8,
                  width: Screen.width / 6,
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      '"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.7,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4.5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      ';',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.7,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      ',',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.7,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 5.5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      '.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.7,
                      ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        complexBottomText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.7,
                        ),
                      ),
                      onTap: () {
                        isComplexBotText = !isComplexBotText;
                        setState(() {
                          isComplexBotText == true
                              ? complexBottomText = '"ניגוף"'
                              : complexBottomText = '"מר חה אות"';
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 4.5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        simpleBottomText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.8,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        breathBottomText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.9,
                        ),
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
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      child: AutoSizeText(
                        silenceBottomText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 2.0,
                        ),
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
            const Divider(color: Colors.blue),

            Stack(
              children: [
                Align(
                  alignment: AlignmentGeometry.center,
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 2.2,
                    height: 200,
                    width: 200,
                    //width: MediaQuery.of(context).size.width / 2.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          //'assets/mink/minkluzluz.webp',
                          'assets/mink/minkpinklok.png',
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 0,
                  end: 0,
                  top: 50,
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 2.2,
                    height: 110,
                    width: 110,
                    //width: MediaQuery.of(context).size.width / 2.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/mink/minkluzluz.webp',
                          //'assets/mink/minkpinklok.png',
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.blue),

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

  Widget _buildCountersPopUp(BuildContext context) {
    // 💡 Extract the 'state' from each HDCenter object
    final List<int> ppstates = _currentActiveAccount?.zbcounters
            .map((center) => center.state ?? 4) // Map Object to Int
            .toList() ??
        List<int>.filled(9, 4); // Fallback to Int list
    return AlertDialog(
      title: const Text('טחן-אות'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 300,
          height: Screen.height,
          child: Flex(
            direction: Axis.vertical,
            children: [
              const Divider(color: Colors.transparent),
              CircleAvatar(
                minRadius: 5,
                maxRadius: 13,
                foregroundImage: AssetImage(coins4lst[0]),
              ),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: ZBStory.zbColors[zbsolarstate],
                  borderRadius: BorderRadius.circular(15),
                ),
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
                  border: Border.all(width: 3, color: Colors.black),
                  //color: Colors.blue[100],
                  color: ZBStory.zbColors[zbheartstate],
                  borderRadius: BorderRadius.circular(15),
                ),
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
                foregroundImage: AssetImage(coins4lst[1]),
              ),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: ZBStory.zbColors[zbthroatstate],
                  borderRadius: BorderRadius.circular(15),
                ),
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
                foregroundImage: AssetImage(coins4lst[2]),
              ),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: ZBStory.zbColors[zbheadstate],
                  borderRadius: BorderRadius.circular(15),
                ),
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
                  border: Border.all(width: 3, color: Colors.black),
                  //color: Colors.blue[100],
                  // color: ajnacolor,
                  color: ZBStory.zbColors[zbajnastate],
                  borderRadius: BorderRadius.circular(15),
                ),
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
                  border: Border.all(width: 3, color: Colors.black),
                  // color: gcolor,
                  color: ZBStory.zbColors[zbgstate],
                  borderRadius: BorderRadius.circular(15),
                ),
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
                  border: Border.all(width: 3, color: Colors.black),
                  color: ZBStory.zbColors[zbspleenstate],
                  // color: spleencolor,
                  borderRadius: BorderRadius.circular(15),
                ),
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
                  border: Border.all(width: 3, color: Colors.black),
                  // color: rootcolor,
                  color: ZBStory.zbColors[zbrootstate],
                  borderRadius: BorderRadius.circular(15),
                ),
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
                foregroundImage: AssetImage(coins4lst[3]),
              ),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: ZBStory.zbColors[zbsacralstate],
                  // color: sacralcolor,
                  borderRadius: BorderRadius.circular(15),
                ),
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
            zbPop(context);
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildTransactionsPopUp(BuildContext context) {
    // 1. Get IDs from the current account
    final accountTXs = _currentActiveAccount?.zbtransactions ?? [];

    // 2. Map IDs to the full ZBTransaction objects from your static list
    final List<ZBTransaction> activeTX = accountTXs.map((accChannel) {
      // Look up the full data (Hebrew names, etc.) from your new 36-item list
      return ZBData.getzbtransactions.firstWhere(
        (t) => t.id == accChannel.id,
        orElse: () => ZBTransaction(
          id: accChannel.id ?? '0.0',
          name: accChannel.name,
          zbhebname: accChannel.zbhebname,
          // Pass other fields if necessary
          zbstate: 4, // Default to 'Simple' if not found
        ),
      );
    }).toList();

    // 3. Filter by zbstate for the different sections
    // State 2 = Silence (Design/Red), 3 = Breath (Personality/Yellow), 5 = Complex (Blue)
    final designTX = activeTX.where((t) => t.zbstate == 2).toList();
    final personalityTX =
        activeTX.where((t) => t.zbstate == 3 || t.zbstate == 5).toList();

    return Directionality(
      textDirection:
          ui.TextDirection.rtl, // Ensures Hebrew alignment is correct
      child: AlertDialog(
        title: const Text('תנו לאיות', textAlign: TextAlign.right),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // 🔵 Header: All (Complex/Blue)
                _buildFrequencyHeader(ZBStory.getfrequency(5), "כל התנועות"),
                _buildZBTransactionList(context, activeTX),

                const Divider(height: 32),

                // 🟢 Header: Simple (Green)
                _buildFrequencyHeader(ZBStory.getfrequency(4), "פשוט"),
                const SizedBox(height: 8),

                const Divider(height: 32),

                // 🟡 Header: Personality (Breath/Yellow)
                _buildFrequencyHeader(ZBStory.getfrequency(3), "אישיות"),
                personalityTX.isEmpty
                    ? const Text("אין תנועות אישיות",
                        style: TextStyle(color: Colors.grey))
                    : _buildZBTransactionList(context, personalityTX),

                const Divider(height: 32),

                // 🔴 Header: Design (Silence/Red)
                _buildFrequencyHeader(ZBStory.getfrequency(2), "עיצוב"),
                designTX.isEmpty
                    ? const Text("אין תנועות עיצוב",
                        style: TextStyle(color: Colors.grey))
                    : _buildZBTransactionList(context, designTX),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
    );
  }

// 💡 Helper for the list items
  Widget _buildZBTransactionList(
      BuildContext context, List<ZBTransaction> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, i) {
        final tx = list[i];
        // Handles the int? to int conversion safely
        final freq = ZBStory.getfrequency(tx.zbstate ?? 0);

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: freq.zbcolor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Text(
            // tx.id ?? '',
            tx.zbhebname ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // Flip text color to white for dark backgrounds (Red/Blue)
              color: (freq.zbcolor == Colors.blue || freq.zbcolor == Colors.red)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        );
      },
    );
  }

// 💡 Helper for the Headers

// 💡 Supporting Header Widget
  Widget _buildFrequencyHeader(ZBFrequency freq, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.transparent,
            // Note: ensure path matches your project structure
            foregroundImage: AssetImage('assets/coins/${freq.zbcoinimg}'),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: freq.zbcolor == Colors.transparent
                  ? Colors.black
                  : freq.zbcolor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'זמן עיצוב',
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
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
              color: Colors.white,
            ),
          ),
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
              color: Colors.white,
            ),
          ),
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
              color: Colors.white,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            readOnly: true,
            minLines: 1,
            maxLines: 2,
            decoration: const InputDecoration.collapsed(hintText: 'Definition'),
            controller: _controllerDefinition,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            readOnly: true,
            minLines: 1,
            maxLines: 2,
            decoration: const InputDecoration.collapsed(
              hintText: 'I don\'t know',
            ),
            controller: _controllerFinalLine,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
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
                child: const Text(
                  'חלי-פה',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildCountersPopUp(context),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  'טחן-אות',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildTransactionsPopUp(context),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  'תנו לאיות',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            zbPop(context);
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
                foregroundImage: AssetImage(minmaxcoins[0]),
              ),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _planetspersonList[0].note.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'מקסימום איות מורכב',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    rt6profile[_planetspersonList[0].note ?? 0].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.transparent),
              CircleAvatar(
                minRadius: 20,
                maxRadius: 30,
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(minmaxcoins[3]),
              ),
              const Divider(color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _planetsdesignList[0].note.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'מינימום אישה שתיקה',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    rt6profile[_planetsdesignList[0].note ?? 0].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            zbPop(context);
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
        ? Colors.black.withValues(alpha: 0.2)
        : Colors.black;

    timecolor = timecolor == Colors.white ? Colors.black : Colors.white;
  }

  void setSilenceOnly() {
    for (var g in _walletstatelist) {
      g = 0;
    }

    if (cardstate == 'zb') {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tmpdesignwallet = _planetsdesignList[i].wallet;
        if (_walletstatelist[tmpdesignwallet] == 3) {
          _walletstatelist[tmpdesignwallet] = 1;
          _isBoldList[tmpdesignwallet] = true;
        } else if (_walletstatelist[tmpdesignwallet] == 0 ||
            _walletstatelist[tmpdesignwallet] == 2) {
          _walletstatelist[tmpdesignwallet] = 1;
          _isBoldList[tmpdesignwallet] = true;
        }
      }

      for (var i = 0; i < _planetspersonList.length; i++) {
        tmppersonwallet = _planetspersonList[i].wallet;
        _isBoldList[tmppersonwallet] = false;

        if (_walletstatelist[tmppersonwallet] == 2) {
          _walletstatelist[tmppersonwallet] = 0;
        } else if (_walletstatelist[tmppersonwallet] == 3) {
          _walletstatelist[tmppersonwallet] = 1;
        }
      }
    } else {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tmpdesignwallet = _planetsdesignList[i].wallet;
        if (_walletstatelist[tmpdesignwallet] == 8) {
          _walletstatelist[tmpdesignwallet] = 1;
          _isBoldList[tmpdesignwallet] = true;
        } else if (_walletstatelist[tmpdesignwallet] == 6 ||
            _walletstatelist[tmpdesignwallet] == 5) {
          _walletstatelist[tmpdesignwallet] = 1;
          _isBoldList[tmpdesignwallet] = true;
        }
      }
      for (var i = 0; i < _planetspersonList.length; i++) {
        tmppersonwallet = _planetspersonList[i].wallet;
        _isBoldList[tmppersonwallet] = false;

        if (_walletstatelist[tmppersonwallet] == 5) {
          _walletstatelist[tmppersonwallet] = 6;
        } else if (_walletstatelist[tmppersonwallet] == 8) {
          _walletstatelist[tmppersonwallet] = 1;
        }
      }
    }
  }

  void setComplexOnly() {
    if (cardstate == 'zb') {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tmpdesignwallet = _planetsdesignList[i].wallet;
        if (_walletstatelist[tmpdesignwallet] == 1) {
          _walletstatelist[tmpdesignwallet] = 0;
          _isBoldList[tmpdesignwallet] = false;
        } else if (_walletstatelist[tmpdesignwallet] == 3) {
          _walletstatelist[tmpdesignwallet] = 2;
          _isBoldList[tmpdesignwallet] = true;
        }
      }
    } else {
      for (var i = 0; i < _planetsdesignList.length; i++) {
        tmpdesignwallet = _planetsdesignList[i].wallet;
        if (_walletstatelist[tmpdesignwallet] == 1) {
          _walletstatelist[tmpdesignwallet] = 6;
          _isBoldList[tmpdesignwallet] = false;
        } else if (_walletstatelist[tmpdesignwallet] == 8) {
          _walletstatelist[tmpdesignwallet] = 5;
          _isBoldList[tmpdesignwallet] = true;
        }
      }
    }
  }

  // void _controlHDData(HumanDesign hdbasicdata) {
  //   _controllerFinalLine.text = 'XIO I don\'t know';

  //   _controllerStrategy.text = hdbasicdata.strategy ?? "";
  //   _controllerAuthority.text = hdbasicdata.authority ?? "";
  //   _controllerType.text = hdbasicdata.type ?? "";
  //   _controllerSentence.text = hdbasicdata.sentence ?? "";
  //   _controllercoin.jumpToPage(hdbasicdata.typeid ?? 0);
  //   _controllersubcoin.jumpToPage(hdbasicdata.authid ?? 0);
  //   _controllerDefinition.text = (hdbasicdata.definition ?? '');
  // }

  void _resetWalletState() {
    setState(() {
      // 1. Establish the "Simple Green" baseline for all 64 wallets
      _walletstatelist.fillRange(0, 65, 4);
      _isBoldList.fillRange(0, 65, false);

      // 2. Set wheel opacity to 10% for that dark UI feel
      for (var i = 0; i < wheelwalletscolor.length; i++) {
        wheelwalletscolor[i] = complexrevtopcoincolor[i].withValues(alpha: 0.1);
      }
    });
  }

  void _setWalletsState() {
    _applyInitialSimpleState(); // Reset _walletstatelist to 4

    for (int i = 0; i < 13; i++) {
      int dGate = _planetsdesignList[i].wallet;
      int pGate = _planetspersonList[i].wallet;

      if (dGate > 0 && dGate < 65) {
        _walletstatelist[dGate] = 2; // Red
        _isBoldList[dGate] = true;
      }
      if (pGate > 0 && pGate < 65) {
        _isBoldList[pGate] = true;
        _walletstatelist[pGate] =
            (_walletstatelist[pGate] == 2) ? 9 : 5; // Striped or Blue
      }
    }

    // Sync the Transactions (Channels)
    for (var tx in ZBData.getzbtransactions) {
      int sA = _walletstatelist[tx.mainWalletId];
      int sB = _walletstatelist[tx.subWalletId];

      // A channel is ONLY active if BOTH ends are defined (not 4 or 0)
      if (sA != 4 && sA != 0 && sB != 4 && sB != 0) {
        if (sA == 9 || sB == 9)
          tx.zbstate = 9;
        else if (sA == 5 && sB == 5)
          tx.zbstate = 5;
        else if (sA == 2 && sB == 2)
          tx.zbstate = 2;
        else
          tx.zbstate = 9; // Mixed Red/Blue = Defined
      } else {
        tx.zbstate = 4; // Off/Green
      }
    }
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

// zb new conteolsettime

  void controlSetTime(bool isIncrementing) async {
    int stepValue = int.tryParse(_controllerSetTime.text) ?? 1;
    DateTime newTime;

    // Perform the DateTime math (your existing switch logic)
    if (isIncrementing) {
      newTime = _calculateShiftedTime(_personTime, stepValue, isForward: true);
    } else {
      newTime = _calculateShiftedTime(_personTime, stepValue, isForward: false);
    }

    // Trigger the unified update
    await _performZBTimeUpdate(newTime);
  }

  Widget _buildGatesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('ארנקים'),
      content: SizedBox(
        width: Screen.width * 0.8,
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
                    foregroundImage: AssetImage(planetsimagelist[index]),
                  ),
                  Text(
                    (_planetsfulldisplayList[index].wallet ?? 0).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    coins64List[_planetsfulldisplayList[index].wallet ?? 0],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            zbPop(context);
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
        width: Screen.width * 0.8,
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
                    foregroundImage: AssetImage(planetsimagelist[index]),
                  ),
                  Text(
                    _planetsfulldisplayList[index].walletNote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    coins384List[((_planetsfulldisplayList[index].wallet) * 7) +
                        (_planetsfulldisplayList[index].note ?? 0)],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            zbPop(context);
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildPlanetUpDownDialog(BuildContext context, int exaltORdeter) {
    String planetString = '';
    int planetLinePos = 1;
    planetLinePos = ((_planethex.wallet ?? 1) * 6 - 7 + (_planethex.note ?? 1));

    switch (exaltORdeter) {
      case 1:
        planetString = hdlinesexalted[planetLinePos];
        break;
      case 0:
        planetString = hdlinesdetriment[planetLinePos];
        break;
      default:
        planetString = hdlinesexalted[planetLinePos];
        break;
    }
    return AlertDialog(
      title: const Text('deep in wallet עמוק בארנק'),
      content: SizedBox(
        width: Screen.width,
        height: Screen.height / 4,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              planetString,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            //const SizedBox(height: 10),
            const Divider(color: Colors.black),
            const Text('כוכב עדיין חופשי ולא מקובע'),
            const SizedBox(height: 10),
            const Text('Planet is still free and not fixed'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            zbPop(context);
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
        width: Screen.width,
        height: Screen.height / 4,
        child: Text(
          matchtext,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            zbPop(context);
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  void _controlPlanetWalletData() {
    // 🛡️ Safety check: Ensure the base 13 planets exist to prevent crashes
    if (_planetspersonList.length < 13 || _planetsdesignList.length < 13)
      return;

    // 1. Map 13 Core Planets (Personality)
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

    // 2. Map 13 Core Planets (Design)
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

    // 3. 🎯 Safely Map Chiron (Index 13) - Only if the full list exists
    if (_planetsfullpersonList.length > 13) {
      _chironhex = _planetsfullpersonList[13];
      _controllerChironGate.text = _chironhex.walletNoteColor ?? "";
    }

    if (_planetsfulldesignList.length > 13) {
      _chirondesignhex = _planetsfulldesignList[13];
      _controllerDesignChironGate.text = _chirondesignhex.walletNoteColor;
    }

    // 4. Update Personality Text Controllers (Sun - Pluto)
    _controllerSunText.text = _sunhex.notename ?? "";
    _controllerEarthText.text = _earthhex.notename ?? "";
    // ... [North Node to Pluto] ...

    // 5. Update Gate Controllers
    _controllerSunGate.text = _sunhex.walletNoteColorToneBase;
    _controllerDesignSunGate.text = _sundesignhex.walletNoteColorToneBase;
    // ... [Continue mapping through Pluto as per your code] ...

    // 6. Set Tonal Values (4-point mapping)
    tonallist = [
      _sundesignhex.tone ?? 0,
      _northnodedesignhex.tone ?? 0,
      _sunhex.tone ?? 0, // Personality Sun
      _northnodehex.tone ?? 0, // Personality Node
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
    // Ensure we have the alignment data first
    _hexalignedList = hexagramAlignment(_planethex.wallet);

    // We check if the data exists before trying to jump
    if (_hexalignedList.length >= 3) {
      try {
        // The CarouselSliderController usually handles internal safety,
        // but wrapping it ensures the "Null check operator" error stops.
        _controllertop.jumpToPage(_hexalignedList[0]);
        _controllermid.jumpToPage(_hexalignedList[1]);
        _controllerbot.jumpToPage(_hexalignedList[2]);
      } catch (e) {
        debugPrint("Carousel not ready yet: $e");
      }
    }
  }

  void _setEvolutionCoin() {
    // sun earth nodes design
    if ((_planetsdesignList[0].tone ?? 0) > 3) {
      //_inbodyalign = 'right';
      //_inbodycolor = Colors.red;
      _inbodyicon = Icons.arrow_circle_right;
      if ((_planetsdesignList[2].tone ?? 0) > 3) {
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
      if ((_planetsdesignList[2].tone ?? 0) > 3) {
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
    if ((_planetsdesignList[2].tone ?? 0) > 3) {
      //_inpersonalign = 'right';
      //_inpersoncolor = Colors.blue;
      _inpersonicon = Icons.arrow_circle_right;
      if ((_planetspersonList[2].tone ?? 0) > 3) {
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
      if ((_planetspersonList[2].tone ?? 0) > 3) {
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
    if ((_planetsdesignList[2].tone ?? 0) > 3) {
      if ((_planetspersonList[2].tone ?? 0) > 3) {
        _colorinbreath = Colors.red;
      } else {
        _colorinbreath = Colors.yellow;
      }
    } else {
      if ((_planetspersonList[2].tone ?? 0) > 3) {
        _colorinbreath = Colors.green;
      } else {
        _colorinbreath = Colors.blue;
      }
    }

    //sun earth person design
    if ((_planetsdesignList[0].tone ?? 0) > 3) {
      if ((_planetspersonList[0].tone ?? 0) > 3) {
        _colorinsimple = Colors.red;
      } else {
        _colorinsimple = Colors.yellow;
      }
    } else {
      if ((_planetspersonList[0].tone ?? 0) > 3) {
        _colorinsimple = Colors.green;
      } else {
        _colorinsimple = Colors.blue;
      }
    }
  }

  void _setTextLevels(String textlevel) {
    switch (textlevel) {
      case 'complex':
        //_controllerPlanetSubType.text = 'COMPLEX';
        _controllerPlanetSubType.text = 'מורכב';

        _controllerSunGate.text = _sunhex.walletNoteColorToneBase;
        _controllerEarthGate.text = _earthhex.walletNoteColorToneBase;
        _controllerNorthNodeGate.text = _northnodehex.walletNoteColorToneBase;
        _controllerSouthNodeGate.text = _southnodehex.walletNoteColorToneBase;
        _controllerMoonGate.text = _moonhex.walletNoteColor;
        _controllerMercuryGate.text = _mercuryhex.walletNoteColor;
        _controllerVenusGate.text = _venushex.walletNoteColor;
        _controllerMarsGate.text = _marshex.walletNoteColor;
        _controllerJupiterGate.text = _jupiterhex.walletNoteColor;
        _controllerSaturnGate.text = _saturnhex.walletNoteColor;
        _controllerUranusGate.text = _uranushex.walletNoteColor;
        _controllerNeptuneGate.text = _neptunehex.walletNoteColor;
        _controllerPlutoGate.text = _plutohex.walletNoteColor;
        _controllerChironGate.text = _chironhex.walletNoteColor;

        _controllerDesignSunGate.text = _sundesignhex.walletNoteColorToneBase;
        _controllerDesignEarthGate.text =
            _earthdesignhex.walletNoteColorToneBase;
        _controllerDesignNorthNodeGate.text =
            _northnodedesignhex.walletNoteColorToneBase;
        _controllerDesignSouthNodeGate.text =
            _southnodedesignhex.walletNoteColorToneBase;
        _controllerDesignMoonGate.text = _moondesignhex.walletNoteColor;
        _controllerDesignMercuryGate.text = _mercurydesignhex.walletNoteColor;
        _controllerDesignVenusGate.text = _venusdesignhex.walletNoteColor;
        _controllerDesignMarsGate.text = _marsdesignhex.walletNoteColor;
        _controllerDesignJupiterGate.text = _jupiterdesignhex.walletNoteColor;
        _controllerDesignSaturnGate.text = _saturndesignhex.walletNoteColor;
        _controllerDesignUranusGate.text = _uranusdesignhex.walletNoteColor;
        _controllerDesignNeptuneGate.text = _neptunedesignhex.walletNoteColor;
        _controllerDesignPlutoGate.text = _plutodesignhex.walletNoteColor;
        _controllerDesignChironGate.text = _chirondesignhex.walletNoteColor;

        break;
      case 'simple':
        _controllerPlanetSubType.text = 'פשוט';

        _controllerSunGate.text = _sunhex.walletNote;
        _controllerEarthGate.text = _earthhex.walletNote;
        _controllerNorthNodeGate.text = _northnodehex.walletNote;
        _controllerSouthNodeGate.text = _southnodehex.walletNote;
        _controllerMoonGate.text = _moonhex.walletNote;
        _controllerMercuryGate.text = _mercuryhex.walletNote;
        _controllerVenusGate.text = _venushex.walletNote;
        _controllerMarsGate.text = _marshex.walletNote;
        _controllerJupiterGate.text = _jupiterhex.walletNote;
        _controllerSaturnGate.text = _saturnhex.walletNote;
        _controllerUranusGate.text = _uranushex.walletNote;
        _controllerNeptuneGate.text = _neptunehex.walletNote;
        _controllerPlutoGate.text = _plutohex.walletNote;
        _controllerChironGate.text = _chironhex.walletNote;

        _controllerDesignSunGate.text = _sundesignhex.walletNote;
        _controllerDesignEarthGate.text = _earthdesignhex.walletNote;
        _controllerDesignNorthNodeGate.text = _northnodedesignhex.walletNote;
        _controllerDesignSouthNodeGate.text = _southnodedesignhex.walletNote;
        _controllerDesignMoonGate.text = _moondesignhex.walletNote;
        _controllerDesignMercuryGate.text = _mercurydesignhex.walletNote;
        _controllerDesignVenusGate.text = _venusdesignhex.walletNote;
        _controllerDesignMarsGate.text = _marsdesignhex.walletNote;
        _controllerDesignJupiterGate.text = _jupiterdesignhex.walletNote;
        _controllerDesignSaturnGate.text = _saturndesignhex.walletNote;
        _controllerDesignUranusGate.text = _uranusdesignhex.walletNote;
        _controllerDesignNeptuneGate.text = _neptunedesignhex.walletNote;
        _controllerDesignPlutoGate.text = _plutodesignhex.walletNote;
        _controllerDesignChironGate.text = _chirondesignhex.walletNote;

        break;
      case 'breath':
        _controllerPlanetSubType.text = 'נשימה';

        _controllerSunGate.text = 'לנשוף';
        _controllerEarthGate.text = 'לשאוף';
        _controllerNorthNodeGate.text = 'נשימה';
        _controllerSouthNodeGate.text = 'נשימה';
        _controllerMoonGate.text = 'לנשוף';
        _controllerMercuryGate.text = 'לנשוף';
        _controllerVenusGate.text = 'לנשוף';
        _controllerMarsGate.text = 'לנשוף';
        _controllerJupiterGate.text = 'לשאוף';
        _controllerSaturnGate.text = 'לשאוף';
        _controllerUranusGate.text = 'לשאוף';
        _controllerNeptuneGate.text = 'לשאוף';
        _controllerPlutoGate.text = 'לשאוף';
        _controllerChironGate.text = 'לשאוף';

        _controllerDesignSunGate.text = 'לנשוף';
        _controllerDesignEarthGate.text = 'לשאוף';
        _controllerDesignNorthNodeGate.text = 'נשימה';
        _controllerDesignSouthNodeGate.text = 'נשימה';
        _controllerDesignMoonGate.text = 'לנשוף';
        _controllerDesignMercuryGate.text = 'לנשוף';
        _controllerDesignVenusGate.text = 'לנשוף';
        _controllerDesignMarsGate.text = 'לנשוף';
        _controllerDesignJupiterGate.text = 'לשאוף';
        _controllerDesignSaturnGate.text = 'לשאוף';
        _controllerDesignUranusGate.text = 'לשאוף';
        _controllerDesignNeptuneGate.text = 'לשאוף';
        _controllerDesignPlutoGate.text = 'לשאוף';
        _controllerDesignChironGate.text = 'לשאוף';

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

  // zb new gemini claude code
  void _syncUIWithAccount(ZBAccount account) {
    setState(() {
      ZBLogic.currentAccount = account;

      // 2. Perform the actual data restoration immediately
      ZBLogic.restoreGlobalRegistry(account);

      _currentActiveAccount = account;

      // 1. High-Precision Mapping
      // Apply .getwalletsub to ensure the UI lists have the corrected
      // Base/Tone/Color from the fixed +58/UTC logic.
      _planetsfullpersonList =
          account.zbpersonality.map((w) => w.getwalletsub).toList();
      _planetsfulldesignList =
          account.zbdesign.map((w) => w.getwalletsub).toList();

      _planetsfulldisplayList = _planetsfullpersonList;

      // 2. Sync Chart Mapping Engine (13 Planets for the Wheel)
      _planetspersonList = _planetsfullpersonList.take(13).toList();
      _planetsdesignList = _planetsfulldesignList.take(13).toList();

      // 3. Update the RAM/Registry States
      // This updates _walletstatelist [2, 5, or 9] and syncs ZBData.getzbtransactions
      _applyInitialSimpleState();
      _setWalletsState();
      _walletstatelist = List<int>.from(_walletstatelist);

      // 4. Map the Active Transactions (Channels)
      // We use the transactions directly from the account object.
      final List<ZBTransaction> activeTX = account.zbtransactions
          .where((t) => t.zbstate != 4 && t.zbstate != 0)
          .toList();

      _updateRegistryFromCounters(activeTX);

      // 5. 🚀 DIRECT NARRATIVE SYNC
      // This handles all TextControllers and the Carousel "Coins"
      _updateUIControllers(account);

      // 6. Time and Navigation Sync
      _personTime = account.timestamp;
      _designTime = account.designtimestamp;
      _setDateTime(account.timestamp);

      // Set initial focus to the Personality Sun (Gate 55.1...)
      _planethex = _planetsfullpersonList[0];
      _updateUITextFromPlanet(_planethex);

      // 7. Force Repaint
      resetChartColor();
    });
  }

  void _updateUIControllers(ZBAccount account) {
    setState(() {
      // 1. Update Text Controllers
      _controllerStrategy.text = account.strategy;
      _controllerAuthority.text = account.authority;
      _controllerType.text = account.type;
      _controllerSentence.text = account.sentence;
      _controllerDefinition.text = account.definition;

      _controllerFinalLine.text =
          account.subtype.isNotEmpty ? account.subtype : account.type;
    });
  }

  void _updateUITextFromPlanet(ZBWallet updWallet) {
    // Use local variables to avoid null issues
    int wallet = updWallet.wallet ?? 1;
    int note = updWallet.note ?? 1;

    _planethex = updWallet; // Sync global state
    _currentnote = note;

    // 1. Numbers
    _controllerwallettext.text = wallet.toString();
    _controllernotetext.text = note.toString();

    // 2. Stories (Mapping from ZBData or your lists)
    _controllerwalletstory.text =
        ZBData.getWalletStory(wallet, _selected64Category);

    // Note: Using your logic from ToggleButtons for the note story
    _controllernotestory.text =
        ZBData.getWalletNoteStory(wallet, note, _selected384Category);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setCoins();
    });
  }

  void _updateRegistryFromCounters(List<ZBTransaction> activeTX) {
    // 1. Reset all Centers to State 0 (or 4)
    for (var counter in ZBData.counterMap.values) {
      counter.state = 4; // Default to Green
    }

    // 2. Inject active transaction states into the Centers
    for (var tx in activeTX) {
      int freq = tx.zbstate ?? 4;
      // We pass the transaction state directly to the center
      _applyFrequencyToRegistry(tx.mainCounterId, freq);
      _applyFrequencyToRegistry(tx.subCounterId, freq);
    }
  }

  void _applyFrequencyToRegistry(String id, int incomingState) {
    var counter = ZBData.counterMap[id.toLowerCase()];
    if (counter == null) return;

    // Rule: State 9 (Both) always wins. Otherwise, keep existing if it's already defined.
    if (incomingState == 9) {
      counter.state = 9;
    } else if (counter.state == 4 || counter.state == 0) {
      counter.state = incomingState;
    }
  }

  Future<void> _performZBTimeUpdate(DateTime targetTime) async {
    try {
      // Treat the "Wander" target as a full birth-style account
      // so we always have Design data available if we want to switch views.
      ZBAccount updatedAccount = await ZBHelpers.generateAccount(
        targetTime,
        isNow: false,
      );

      _syncUIWithAccount(updatedAccount);

      setState(() {
        _personTime = targetTime;
        _designTime = updatedAccount.designtimestamp;
      });
    } catch (e) {
      debugPrint("❌ ZBTimeUpdate Error: $e");
    }
  }

  DateTime _calculateShiftedTime(DateTime baseTime, int value,
      {required bool isForward}) {
    // Use duration math for standard units
    if (isForward) {
      switch (_settimestamp) {
        case 'שניות':
          return baseTime.add(Duration(seconds: value));
        case 'דקות':
          return baseTime.add(Duration(minutes: value));
        case 'שעות':
          return baseTime.add(Duration(hours: value));
        case 'ימים':
          return DateTime(baseTime.year, baseTime.month, baseTime.day + value,
              baseTime.hour, baseTime.minute, baseTime.second);
        case 'שבועות':
          return DateTime(
              baseTime.year,
              baseTime.month,
              baseTime.day + (value * 7),
              baseTime.hour,
              baseTime.minute,
              baseTime.second);
        case 'חודשים':
          return DateTime(baseTime.year, baseTime.month + value, baseTime.day,
              baseTime.hour, baseTime.minute, baseTime.second);
        case 'שנים':
          return DateTime(baseTime.year + value, baseTime.month, baseTime.day,
              baseTime.hour, baseTime.minute, baseTime.second);
        default:
          return baseTime.add(Duration(minutes: value));
      }
    } else {
      // Reverse math for subtraction
      switch (_settimestamp) {
        case 'שניות':
          return baseTime.subtract(Duration(seconds: value));
        case 'דקות':
          return baseTime.subtract(Duration(minutes: value));
        case 'שעות':
          return baseTime.subtract(Duration(hours: value));
        case 'ימים':
          return DateTime(baseTime.year, baseTime.month, baseTime.day - value,
              baseTime.hour, baseTime.minute, baseTime.second);
        case 'שבועות':
          return DateTime(
              baseTime.year,
              baseTime.month,
              baseTime.day - (value * 7),
              baseTime.hour,
              baseTime.minute,
              baseTime.second);
        case 'חודשים':
          return DateTime(baseTime.year, baseTime.month - value, baseTime.day,
              baseTime.hour, baseTime.minute, baseTime.second);
        case 'שנים':
          return DateTime(baseTime.year - value, baseTime.month, baseTime.day,
              baseTime.hour, baseTime.minute, baseTime.second);
        default:
          return baseTime.subtract(Duration(minutes: value));
      }
    }
  }

  // Change this: void _handleComplexTap(int gate)
  // To this:
  void _handleComplexTap(int gate, int state) {
    // Keep your existing logic inside, but now it accepts the second 'state'
    // // _refreshGateStates(gate); // This ensures the grid and mandala stay in sync

    // // setState(() {
    // //   _wallet = gate;
    // //   // ... rest of your PageView/Controller logic
    // });
  }
}
