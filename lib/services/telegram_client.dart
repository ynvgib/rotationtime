import 'dart:math';
import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchplanets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:teledart/teledart.dart';

import '../models/lists.dart';

// telegram bot
//https://t.me/idonotknowbot_bot

class TelegramClient {
  final String chatId;
  final String botToken;
  TelegramClient({
    required this.chatId,
    required this.botToken,
  });



  static init() async {
    //final envVars = Platform.environment;
    const username = 'idonotknow_link';
    DateTime now = DateTime.now();
    //DateTime chosentime = DateTime.now();
    DateTime designTime = DateTime.now();
    HumanDesign hdfinaldata = HumanDesign();
    String txtcoin = '';

    List<Hexagram> allplanetsList,planetsnowList, planetsdesignList;
    List<HDChannel> channelsList;
    final timeformat = DateFormat('yyyy-MM-dd HH:mm');

    //final envVars = Platform.environment;
    //final telegramkey =
       // Telegram('6071566670:AAFuNgvHHr-n4CNN14eX_tIyQWqXsQy-BiU');
    //final username = (await Telegram(envVars['6071566670:AAFuNgvHHr-n4CNN14eX_tIyQWqXsQy-BiU']!).getMe()).username;

    // TeleDart uses longpoll by default if no update fetcher is specified.
    var teledart = TeleDart(
        '6071566670:AAFuNgvHHr-n4CNN14eX_tIyQWqXsQy-BiU', Event(username));

    teledart.start();

    // You can listen to messages like this
    teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
        (message) =>
            teledart.sendMessage(message.chat.id, 'זמן להתארגז בים סיבוב'));

    // Sick of boilerplates? Reply messages like below, nice and tidy
    // Short hands also available for answer query methods
    teledart.onCommand('qa').listen((message) {
      message.reply(
          'שאל אות הגמל');
      message.reply(
          '???');
      message.replyPhoto(
          'https://m.media-amazon.com/images/I/713W7mczhvL._AC_UF1000,1000_QL80_.jpg',
          caption: 'הכלב איתך וופווף גופגוף');
      message.reply(
          '!!!');
      message.reply(
          'פששש...בואנה טשמע... זה טואווובבב');
      message.reply(
          'ואיך שהגמל מעביר את החומר הלאה');
      message.reply(
          'והכלב שנבח על הדלעת שחלפה...');
      message.reply(rturlfull[5]);
    });

    teledart.onCommand('bd').listen((message) {
          String lastbirthdata = timeformat.format(now);
      message.reply(
          'מועד אחרון'
              '\n$lastbirthdata');
      message.reply(
          'מטבע אחרון'
              ' \n$txtcoin');
          message.reply(rturlfull[0]);
    });

    teledart.onCommand('account').listen((message) {
      message.replyPhoto(
          'https://w7.pngwing.com/pngs/641/127/png-transparent-casino-chips-poker-cards-gambling-game-deck-yellow-blue-green-thumbnail.png',
          caption: 'זמן להתארגז');

      message.reply(
          'ניתן להכניס מועד לידה לפי שעון אפס כמו: '
              '\n1984-02-19 16:58');

      message.reply(
          'you can convert your time in this link:\n'
              'https://dateful.com/time-zone-converter');

      teledart
          .onMessage(keyword: RegExp(r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'))
          .listen((message) async {
        //print(message.text);
        //DateTime now = DateTime.parse(message.text!), designTime;

        now = DateTime.parse(message.text!);

        txtcoin = 'no coin';

        planetsnowList = await PlanetsServices.getCurrentData(now);

        designTime = await PlanetsServices.getDesignTime(now);
        planetsdesignList = await PlanetsServices.getCurrentData(designTime);

        allplanetsList = planetsnowList + planetsdesignList;
        channelsList =
            HDServices.getHDChannels(allplanetsList);

        //List<String> hdbasicdata = HDServices.getHDBasicData(channelsList);
        hdfinaldata = HDServices.getHDBasicData(channelsList);

        txtcoin = hdfinaldata.coinname!;

        message.reply(' אוצר של $txtcoin');

        switch (txtcoin) {
          case 'מורכב':
            message.replyPhoto(
                'https://img.freepik.com/premium-vector/eggplant-cartoon-character_193274-108.jpg',
                caption: 'חזי בימשו היזם');
            message.reply(rturlcoin[0]);
            break;
          case 'פשוט':
            message.replyPhoto(
                'https://img.freepik.com/premium-vector/cute-avocado-sleep-well-illustration_608812-923.jpg',
                caption: 'אבי בים טיפה בים');
            message.reply(rturlcoin[1]);
            break;
          case 'נשימה':
            message.replyPhoto(
                'https://img.freepik.com/premium-vector/banana-teacher-cartoon-character_193274-3355.jpg',
                caption: 'ביני מתווכת');
            message.reply(rturlcoin[2]);
            break;
          case 'שתיקה':
            message.replyPhoto(
                'https://static.vecteezy.com/system/resources/thumbnails/001/949/336/small_2x/tomato-cartoon-character-with-happy-face-expression-on-white-background-free-vector.jpg',
                caption: 'בטיבטי');
            message.reply(rturlcoin[3]);
            break;
          default:
            message.replyPhoto(
                'https://static.wixstatic.com/media/702c29_153bff0fc18844b99999271688b56bc2~mv2.png',
                caption: 'Rotation Coin');
            break;
        }

        //message.reply('');
      });

    });

    teledart.onCommand('now').listen((message) async {

      txtcoin = 'no coin';

      planetsnowList = await PlanetsServices.getCurrentData(now);

      designTime = await PlanetsServices.getDesignTime(now);
      planetsdesignList = await PlanetsServices.getCurrentData(designTime);

      allplanetsList = planetsnowList + planetsdesignList;
      channelsList =
          HDServices.getHDChannels(allplanetsList);

      hdfinaldata = HDServices.getHDBasicData(channelsList);

      txtcoin = hdfinaldata.coinname!;


      message.reply(' אוצר התניה כעת של $txtcoin');

      switch (txtcoin) {
        case 'מורכב':
          message.replyPhoto(
              'https://img.freepik.com/premium-vector/eggplant-cartoon-character_193274-108.jpg',
              caption: 'חזי בימשו היזם');
          message.reply(rturlcoin[0]);
          break;
        case 'פשוט':
          message.replyPhoto(
              'https://img.freepik.com/premium-vector/cute-avocado-sleep-well-illustration_608812-923.jpg',
              caption: 'אבי בים טיפה בים');
          message.reply(rturlcoin[1]);
          break;
        case 'נשימה':
          message.replyPhoto(
              'https://img.freepik.com/premium-vector/banana-teacher-cartoon-character_193274-3355.jpg',
              caption: 'ביני מתווכת');
          message.reply(rturlcoin[2]);
          break;
        case 'שתיקה':
          message.replyPhoto(
              'https://static.vecteezy.com/system/resources/thumbnails/001/949/336/small_2x/tomato-cartoon-character-with-happy-face-expression-on-white-background-free-vector.jpg',
              caption: 'בטיבטי');
          message.reply(rturlcoin[3]);
          break;
        default:
          message.replyPhoto(
              'https://static.wixstatic.com/media/702c29_153bff0fc18844b99999271688b56bc2~mv2.png',
              caption: 'Rotation Coin');
          break;
      }
    });

    teledart
        .onMessage(keyword: RegExp(r'\?$', caseSensitive: false))
        .listen((message) => message.reply('אני לא יודעת'));

    // You can even filter streams with stream processing methods
    // See: https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream
    teledart
        .onMessage(keyword: 'rotation')
        .where((message) => message.text?.contains('photo') ?? false)
        .listen((message) => message.replyPhoto(
            //  io.File('example/dash_paper_plane.png'),
            'https://png.pngtree.com/png-clipart/20190905/original/pngtree-bald-question-mark-face-png-picture-material-png-image_4533929.jpg',
            caption: 'This is how You don\'t know'));

    //teledart
  }

  // Text of the message to be sent, 1-4096 characters after entities parsing
  // https://core.telegram.org/bots/api#sendmessage
  String _limitMessage(final String message) =>
      message.substring(0, min(4096, message.length));

  Future<http.Response> sendMessage(final String message) {
    final Uri uri = Uri.https(
      "api.telegram.org",
      "/bot$botToken/sendMessage",
      {
        "chat_id": chatId,
        "text": _limitMessage(message),
        "parse_mode": "html",
      },
    );
    return http.get(uri);
  }
}

final TelegramClient telegramClient = TelegramClient(
  chatId: "@idonotknow_link",
  botToken: "6071566670:AAFuNgvHHr-n4CNN14eX_tIyQWqXsQy-BiU",
);
