import 'dart:math';
import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:http/http.dart' as http;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

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

    //final envVars = Platform.environment;
    final telegramkey = Telegram('6071566670:AAFuNgvHHr-n4CNN14eX_tIyQWqXsQy-BiU');
    //final username = (await Telegram(envVars['6071566670:AAFuNgvHHr-n4CNN14eX_tIyQWqXsQy-BiU']!).getMe()).username;

    // TeleDart uses longpoll by default if no update fetcher is specified.
    var teledart = TeleDart('6071566670:AAFuNgvHHr-n4CNN14eX_tIyQWqXsQy-BiU', Event(username));

    // In case you decided to use webhook.
    // var webhook = await Webhook.createHttpsWebhok(
    //     Telegram(envVars['BOT_TOKEN']!),
    //     envVars['HOST_URL']!,
    //     io.File(envVars['CERT_PATH']!),
    //     io.File(envVars['KEY_PATH']!),
    //     port: int.parse(envVars['BOT_PORT']!),
    //     secretToken: envVars['SECRET_TOKEN']!);
    // var teledart = TeleDart(envVars['BOT_TOKEN']!, Event(username!), fetcher: webhook);

    teledart.start();


    // You can listen to messages like this
    teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
            (message) => teledart.sendMessage(message.chat.id, 'I don\'t know meditation!'));

    // Sick of boilerplates? Reply messages like below, nice and tidy
    // Short hands also available for answer query methods
    teledart.onCommand('question').listen((message) => message.reply('I don\'t Know'));

    teledart.onCommand('coin').listen((message)
        {
          message.replyPhoto(
            'https://w7.pngwing.com/pngs/641/127/png-transparent-casino-chips-poker-cards-gambling-game-deck-yellow-blue-green-thumbnail.png',
          caption: 'Welcome to Rotation Time');

          message.reply('enter birth date and UTC time in this format: \n1984-02-19 16:58');


        });

    teledart
        .onMessage(keyword: RegExp(r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'))
        .listen((message) async {
      //print(message.text);
      DateTime now = DateTime.parse(message.text!), designTime;

      List<Hexagram> planetsdesignList = [Hexagram(line: 1)],
      planetsnowList = [Hexagram(line: 1)];

      List<HDChannel> channelsList = [];

      String txtcoin = 'no coin';

      planetsnowList = await AstrologyServices.getCurrentData(now);

      designTime = await AstrologyServices.getDesignTime(now);
      planetsdesignList =
          await AstrologyServices.getCurrentData(designTime);

      channelsList = HDServices.getHDChannels(
          planetsnowList, planetsdesignList);

      List<String> hdbasicdata = HDServices.getHDBasicData(channelsList);

      txtcoin = hdbasicdata[4];

      //print ('txtcoin: $txtcoin');

      message.replyPhoto(
          'https://w7.pngwing.com/pngs/137/466/png-transparent-gold-colored-coins-coin-falling-coins-gold-coin-gold-pill-thumbnail.png');

      message.reply('you are rich with: $txtcoin');

      switch (txtcoin){
        case 'COMPLEX':
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/676/937/png-transparent-blue-and-white-check-logo-social-media-verified-badge-facebook-computer-icons-coin-blue-angle-text-thumbnail.png');
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/447/985/png-transparent-circle-cardioid-geometry-rotation-circle-sphere-shape-cardioid-thumbnail.png',
              caption: 'Complex Coin');
          break;
        case 'Simple':
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/531/25/png-transparent-bitcoin-cash-cryptocurrency-exchange-trade-blockchain-text-trademark-logo-thumbnail.png');
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/588/586/png-transparent-arrow-cycle-line-refresh-rotate-simple-arrow-icon-thumbnail.png',
              caption: 'Simple Coin');
          break;
        case 'Breath':
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/300/538/png-transparent-yellow-and-gray-dollar-sign-illustration-dollar-sign-money-yellow-youtube-red-coin-text-number-coins-thumbnail.png');
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/456/935/png-transparent-nose-breath-breathing-smell-breathe-thumbnail.png',
              caption: 'Breath Coin');
          break;
        case 'silence':
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/825/556/png-transparent-casino-token-poker-others-miscellaneous-dice-texas-thumbnail.png');
          message.replyPhoto(
              'https://w7.pngwing.com/pngs/125/789/png-transparent-hotel-fevery-art-silence-quiet-thumbnail.png',
              caption: 'Silence Coin');
          break;
        default:
          message.replyPhoto(
            //  io.File('example/dash_paper_plane.png'),
              'https://w7.pngwing.com/pngs/664/995/png-transparent-youtube-create-signs-symbol-signs-english-text-trademark-thumbnail.png',
              caption: 'Silence Coin');
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

    // Inline mode.
    teledart.onInlineQuery().listen((inlineQuery) => inlineQuery.answer([
      InlineQueryResultArticle(
          id: 'ping',
          title: 'ping',
          inputMessageContent: InputTextMessageContent(
              messageText: '*pong*', parseMode: 'MarkdownV2')),
      InlineQueryResultArticle(
          id: 'ding',
          title: 'ding',
          inputMessageContent: InputTextMessageContent(
              messageText: '*_dong_*', parseMode: 'MarkdownV2')),
    ]));


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