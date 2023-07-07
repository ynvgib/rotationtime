import 'dart:math';
import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:teledart/teledart.dart';

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

    List<Hexagram> planetsnowList, planetsdesignList;
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
            teledart.sendMessage(message.chat.id, 'I don\'t know meditation!'));

    // Sick of boilerplates? Reply messages like below, nice and tidy
    // Short hands also available for answer query methods
    teledart.onCommand('qa').listen((message) {
      message.reply(
          'Ido Not Know Questions and Answers . \nPPP. Past Present Pfuture.');
      message.replyPhoto(
          'https://w7.pngwing.com/pngs/467/800/png-transparent-chakra-meditation-spiritual-practice-mindfulness-mantra-meditative-miscellaneous-physical-fitness-leaf-thumbnail.png',
          caption: 'I don\'t know meditation');
      message.reply('www.beidontknow.com');
    });

    teledart.onCommand('bd').listen((message) {
          String lastbirthdata = timeformat.format(now);
      message.reply(
          'Last Date: \n$lastbirthdata');
    });

    teledart.onCommand('account').listen((message) {
      message.replyPhoto(
          'https://w7.pngwing.com/pngs/641/127/png-transparent-casino-chips-poker-cards-gambling-game-deck-yellow-blue-green-thumbnail.png',
          caption: 'I don\'t know meditation');

      message.reply(
          'enter birth date and UTC time in this format: \n1984-02-19 16:58');

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

        planetsnowList = await AstrologyServices.getCurrentData(now);

        designTime = await AstrologyServices.getDesignTime(now);
        planetsdesignList = await AstrologyServices.getCurrentData(designTime);

        channelsList =
            HDServices.getHDChannels(planetsnowList, planetsdesignList);

        //List<String> hdbasicdata = HDServices.getHDBasicData(channelsList);
        hdfinaldata = HDServices.getHDBasicData(channelsList);

        txtcoin = hdfinaldata.coinname!;

        message.reply('you are rich with: $txtcoin');

        switch (txtcoin) {
          case 'COMPLEX':
          //message.replyPhoto(
          //    'https://w7.pngwing.com/pngs/676/937/png-transparent-blue-and-white-check-logo-social-media-verified-badge-facebook-computer-icons-coin-blue-angle-text-thumbnail.png');
          //message.replyPhoto(
          //   'https://w7.pngwing.com/pngs/447/985/png-transparent-circle-cardioid-geometry-rotation-circle-sphere-shape-cardioid-thumbnail.png',
          //  caption: 'Complex Coin');
            message.replyPhoto(
                'https://static.wixstatic.com/media/702c29_e2455749690045c6ae38769eed306472~mv2.png',
                caption: 'Complex Coin');
            break;
          case 'Simple':
          //message.replyPhoto(
          //    'https://w7.pngwing.com/pngs/531/25/png-transparent-bitcoin-cash-cryptocurrency-exchange-trade-blockchain-text-trademark-logo-thumbnail.png');
          //message.replyPhoto(
          //  'https://w7.pngwing.com/pngs/588/586/png-transparent-arrow-cycle-line-refresh-rotate-simple-arrow-icon-thumbnail.png',
          // caption: 'Simple Coin');
            message.replyPhoto(
                'https://static.wixstatic.com/media/702c29_f040fe0a3fbc4098b7aca97c6234748d~mv2.png',
                caption: 'Simple Coin');
            break;
          case 'Breath':
          //message.replyPhoto(
          //  'https://w7.pngwing.com/pngs/300/538/png-transparent-yellow-and-gray-dollar-sign-illustration-dollar-sign-money-yellow-youtube-red-coin-text-number-coins-thumbnail.png');
          //message.replyPhoto(
          //   'https://w7.pngwing.com/pngs/456/935/png-transparent-nose-breath-breathing-smell-breathe-thumbnail.png',
          //  caption: 'Breath Coin');
            message.replyPhoto(
                'https://static.wixstatic.com/media/702c29_707356c770c94f4abb9d21c081c4d17c~mv2.png',
                caption: 'Breath Coin');
            break;
          case 'silence':
          //message.replyPhoto(
          //    'https://w7.pngwing.com/pngs/825/556/png-transparent-casino-token-poker-others-miscellaneous-dice-texas-thumbnail.png');
          //message.replyPhoto(
          //   'https://w7.pngwing.com/pngs/125/789/png-transparent-hotel-fevery-art-silence-quiet-thumbnail.png',
          //  caption: 'Silence Coin');
            message.replyPhoto(
                'https://static.wixstatic.com/media/702c29_70e29b0fadfb46e38235085116e7592a~mv2.png',
                caption: 'Silence Coin');
            break;
          default:
            message.replyPhoto(
              //  io.File('example/dash_paper_plane.png'),
              //'https://w7.pngwing.com/pngs/664/995/png-transparent-youtube-create-signs-symbol-signs-english-text-trademark-thumbnail.png',
              //caption: 'Silence Coin');
                'https://static.wixstatic.com/media/702c29_153bff0fc18844b99999271688b56bc2~mv2.png',
                caption: 'Rotation Coin');
            break;
        }

        message.reply('Type'
            ' \n${hdfinaldata.type!}\n\n'
            'X (strategy)'
            ' \n${hdfinaldata.strategy!}\n\n'
            'I (Inner Authority)'
            ' \n${hdfinaldata.authority!}\n\n'
            'O (Outer Authority later):'
            ' \n${hdfinaldata.sentence!}\n\n'
            'XIO Ido Not Know');
      });

    });

    teledart.onCommand('now').listen((message) async {

      message.replyPhoto(
          'https://w1.pngwing.com/pngs/945/753/png-transparent-diwali-design-kali-mahadeva-durga-puja-mahakali-kali-puja-hinduism-shakti-thumbnail.png');

      txtcoin = 'no coin';

      planetsnowList = await AstrologyServices.getCurrentData(now);

      designTime = await AstrologyServices.getDesignTime(now);
      planetsdesignList = await AstrologyServices.getCurrentData(designTime);

      channelsList =
          HDServices.getHDChannels(planetsnowList, planetsdesignList);

      hdfinaldata = HDServices.getHDBasicData(channelsList);

      txtcoin = hdfinaldata.coinname!;


      message.reply('you are rich with: $txtcoin');

      switch (txtcoin) {
        case 'COMPLEX':
        //message.replyPhoto(
        //    'https://w7.pngwing.com/pngs/676/937/png-transparent-blue-and-white-check-logo-social-media-verified-badge-facebook-computer-icons-coin-blue-angle-text-thumbnail.png');
        //message.replyPhoto(
        //   'https://w7.pngwing.com/pngs/447/985/png-transparent-circle-cardioid-geometry-rotation-circle-sphere-shape-cardioid-thumbnail.png',
        //  caption: 'Complex Coin');
          message.replyPhoto(
              'https://static.wixstatic.com/media/702c29_e2455749690045c6ae38769eed306472~mv2.png',
              caption: 'Complex Coin');
          break;
        case 'Simple':
        //message.replyPhoto(
        //    'https://w7.pngwing.com/pngs/531/25/png-transparent-bitcoin-cash-cryptocurrency-exchange-trade-blockchain-text-trademark-logo-thumbnail.png');
        //message.replyPhoto(
        //  'https://w7.pngwing.com/pngs/588/586/png-transparent-arrow-cycle-line-refresh-rotate-simple-arrow-icon-thumbnail.png',
        // caption: 'Simple Coin');
          message.replyPhoto(
              'https://static.wixstatic.com/media/702c29_f040fe0a3fbc4098b7aca97c6234748d~mv2.png',
              caption: 'Simple Coin');
          break;
        case 'Breath':
        //message.replyPhoto(
        //  'https://w7.pngwing.com/pngs/300/538/png-transparent-yellow-and-gray-dollar-sign-illustration-dollar-sign-money-yellow-youtube-red-coin-text-number-coins-thumbnail.png');
        //message.replyPhoto(
        //   'https://w7.pngwing.com/pngs/456/935/png-transparent-nose-breath-breathing-smell-breathe-thumbnail.png',
        //  caption: 'Breath Coin');
          message.replyPhoto(
              'https://static.wixstatic.com/media/702c29_707356c770c94f4abb9d21c081c4d17c~mv2.png',
              caption: 'Breath Coin');
          break;
        case 'silence':
        //message.replyPhoto(
        //    'https://w7.pngwing.com/pngs/825/556/png-transparent-casino-token-poker-others-miscellaneous-dice-texas-thumbnail.png');
        //message.replyPhoto(
        //   'https://w7.pngwing.com/pngs/125/789/png-transparent-hotel-fevery-art-silence-quiet-thumbnail.png',
        //  caption: 'Silence Coin');
          message.replyPhoto(
              'https://static.wixstatic.com/media/702c29_70e29b0fadfb46e38235085116e7592a~mv2.png',
              caption: 'Silence Coin');
          break;
        default:
          message.replyPhoto(
            //  io.File('example/dash_paper_plane.png'),
            //'https://w7.pngwing.com/pngs/664/995/png-transparent-youtube-create-signs-symbol-signs-english-text-trademark-thumbnail.png',
            //caption: 'Silence Coin');
              'https://static.wixstatic.com/media/702c29_153bff0fc18844b99999271688b56bc2~mv2.png',
              caption: 'Rotation Coin');
          break;
      }
    });

    teledart
        .onMessage(keyword: RegExp(r'\?$', caseSensitive: false))
        .listen((message) => message.reply('I don\'t know'));

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
