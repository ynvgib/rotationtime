import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';

class HDServices {
  static List<HDChannel> getHDChannels(
      List<Hexagram> personalityplanets, designplanets) {
    List<String> channelidList = [];
    List<int> uniquegatesList = [];
    Set<int> setgates;
    String channelid = '';
    List<HDChannel> hdchannels = [],
        hdcomplexchannels = [],
        hdsimplechannels = [],
        hdbreathchannels = [],
        hdsilencechannels = [];

    HDChannel tempchannel;

    for (int i = 0; personalityplanets.length > i; i++) {
      uniquegatesList.add(personalityplanets[i].gate!);
      uniquegatesList.add(designplanets[i].gate!);
    }
    setgates = uniquegatesList.toSet();
    uniquegatesList = setgates.toList();
    uniquegatesList.sort();

    if (uniquegatesList.isNotEmpty) {
      for (int i = 0; uniquegatesList.length - 1 > i; i++) {
        for (int y = 1; uniquegatesList.length - i > y; y++) {
          channelid = '${uniquegatesList[i]}.${uniquegatesList[y + i]}';
          if (hdchannelsList.contains(channelid)) {
            channelidList.add(channelid);
          }
        }
      }


      for (int i = 0; channelidList.length > i; i++) {
        //tempchannels.add(mapHDChannel(channelidList[i]));
        tempchannel = mapHDChannel(channelidList[i]);

        switch (tempchannel.coin) {
          case 'silence':
            //tempchannel.coin = 'שתיקה';
            hdsilencechannels.add(tempchannel);
            break;
          case 'breath':
            //tempchannel.coin = 'נשימה';
            hdbreathchannels.add(tempchannel);
            break;
          case 'simple':
            //tempchannel.coin = 'פשוט';
            hdsimplechannels.add(tempchannel);
            break;
          case 'complex':
            //tempchannel.coin = 'מורכב';
            hdcomplexchannels.add(tempchannel);
            break;
          default:
            hdcomplexchannels.add(tempchannel);
            break;
        }
      }

      hdchannels.addAll(hdcomplexchannels);
      hdchannels.addAll(hdsimplechannels);
      hdchannels.addAll(hdbreathchannels);
      hdchannels.addAll(hdsilencechannels);
    }
    return hdchannels;
  }

  static List<HDChannel> getHDChannelsJustNow(
      List<Hexagram> personalityplanets) {
    List<String> channelidList = [];
    List<int> uniquegatesList = [];
    Set<int> setgates;
    String channelid = '';
    List<HDChannel> hdchannels = [],
        hdcomplexchannels = [],
        hdsimplechannels = [],
        hdbreathchannels = [],
        hdsilencechannels = [];

    HDChannel tempchannel;

    for (int i = 0; personalityplanets.length > i; i++) {
      uniquegatesList.add(personalityplanets[i].gate!);
    }
    setgates = uniquegatesList.toSet();
    uniquegatesList = setgates.toList();
    uniquegatesList.sort();

    if (uniquegatesList.isNotEmpty) {
      for (int i = 0; uniquegatesList.length - 1 > i; i++) {
        for (int y = 1; uniquegatesList.length - i > y; y++) {
          channelid = '${uniquegatesList[i]}.${uniquegatesList[y + i]}';
          if (hdchannelsList.contains(channelid)) {
            channelidList.add(channelid);
          }
        }
      }


      for (int i = 0; channelidList.length > i; i++) {
        tempchannel = mapHDChannel(channelidList[i]);

        switch (tempchannel.coin) {
          case 'silence':
            //tempchannel.coin = 'שתיקה';
            hdsilencechannels.add(tempchannel);
            break;
          case 'breath':
            //tempchannel.coin = 'נשימה';
            hdbreathchannels.add(tempchannel);
            break;
          case 'simple':
            //tempchannel.coin = 'פשוט';
            hdsimplechannels.add(tempchannel);
            break;
          case 'complex':
            //tempchannel.coin = 'מורכב';
            hdcomplexchannels.add(tempchannel);
            break;
          default:
            hdcomplexchannels.add(tempchannel);
            break;
        }
      }

      hdchannels.addAll(hdcomplexchannels);
      hdchannels.addAll(hdsimplechannels);
      hdchannels.addAll(hdbreathchannels);
      hdchannels.addAll(hdsilencechannels);
    }
    return hdchannels;
  }

  static List<String> getHDDefinedCenters(List<HDChannel> channelids) {
    List<String> centers = [];
    //int _channelidx;
    Set<String> centersset;

    if (channelids.isNotEmpty) {
      for (int i = 0; channelids.length > i; i++) {
        centers.add(channelids[i].firstcenter!);
        centers.add(channelids[i].secondcenter!);
      }
      centersset = centers.toSet();
      centers = centersset.toList();
    }
    return centers;
  }

  static List<String> getHDDefinedFears(centers) {
    List<String> fears = [];
    List<String> fearsSentence =
        List<String>.filled(3, 'FEAR', growable: false);

    if (centers.contains('spleen')) {
      fears.add('FEAR');
      fearsSentence[0] = 'Fear turns Physical Awareness';
    } else {
      fearsSentence[0] = 'No Fear turns Physical Awareness';
    }

    if (centers.contains('ajna')) {
      fears.add('ANXIETY');
      fearsSentence[1] = 'Anxiety turns Mental Awareness';
    } else {
      fearsSentence[1] = 'No Anxiety turns Mental Awareness';
    }

    if (centers.contains('solar')) {
      fears.add('NERVOUSNESS');
      fearsSentence[2] = 'Nervousness turns Emotional Awareness';
    } else {
      fearsSentence[2] = 'No Nervousness turns Emotional Awareness';
    }

    return fearsSentence;
  }

  static List<String> getSelfReminder() {
    List<String> reminderSentence = List<String>.filled(7, '', growable: false);

    reminderSentence[0] = '++++++';
    reminderSentence[1] = 'The limitation is that what is written is';
    reminderSentence[2] = 'MENTAL';
    reminderSentence[3] = 'Keep That in MIND';
    reminderSentence[4] = 'while BODY is Alive';
    reminderSentence[5] = 'as FEARS turn AWARENESS';
    reminderSentence[6] = '------';

    return reminderSentence;
  }

  static HumanDesign getHDBasicData(
      //List<Hexagram> personalityplanets, designplanets, List<HDChannel> hdchannels) {
      List<HDChannel> hdchannels) {
    List<String> hdbasicdata = [], centers = [], channelsList = [];

    HumanDesign hddata = HumanDesign();

    //List<HDChannel> hdchannels = [];
    String channelid = '',
        type = '',
        authority = '',
        strategy = '',
        sentence = '',
        coin = '',
        coinname = '';

    //hdchannels = getHDChannels(personalityplanets, designplanets);
    centers = getHDDefinedCenters(hdchannels);

    for (int i = 0; hdchannels.length > i; i++) {
      channelid = hdchannels[i].id!;
      channelsList.add(channelid);
    }

    // first set reflector
    // no channels
    if (centers.isEmpty) {
      type = hdtypesList.last;
      authority = hdauthority.last;
    } else if (centers.contains('solar')) {
      authority = 'emotional';
      if (centers.contains('sacral')) {
        type = 'generator';
      }
    } else if (centers.contains('sacral')) {
      authority = 'sacral';
      type = 'generator';
    } else if (centers.contains('spleen')) {
      authority = 'splenic';
    } else if (centers.contains('heart')) {
      authority = 'ego';
    } else if (centers.contains('self')) {
      authority = 'self';
      type = 'projector';
    } else {
      authority = 'sound board';
      type = 'projector';
    }

    if (centers.isEmpty) {
      type = 'reflector';
    } else {
      if (!centers.contains('throat')) {
        if (!centers.contains('sacral')) {
          type = 'projector';
        } else {
          type = 'generator';
        }
      }

      if (channelsList.contains('12.22') ||
          channelsList.contains('35.36') ||
          channelsList.contains('21.45')) {
        type = 'manifestor';
      } else if (channelsList.contains('16.48') ||
          channelsList.contains('20.57')) {
        if (channelsList.contains('26.44') ||
            channelsList.contains('32.54') ||
            channelsList.contains('28.38') ||
            channelsList.contains('18.58')) {
          type = 'manifestor';
        }
      }

      if (type != 'manifestor') {
        if (channelsList.contains('10.20') ||
            channelsList.contains('7.31') ||
            channelsList.contains('1.8') ||
            channelsList.contains('13.33')) {
          if (channelsList.contains('25.51')) {
            type = 'manifestor';
          }
        }
      }

      if (centers.contains('sacral')) {
        if (type == 'manifestor') {
          type = 'manifesting generator';
        } else if (channelsList.contains('20.34')) {
          type = 'manifesting generator';
        } else if (channelsList.contains('27.50')) {
          if (channelsList.contains('16.48') ||
              channelsList.contains('20.57')) {
            type = 'manifesting generator';
          } else if (channelsList.contains('10.57')) {
            if (channelsList.contains('7.31') ||
                channelsList.contains('1.8') ||
                channelsList.contains('13.33')) {
              type = 'manifesting generator';
            }
          }
        } else if (channelsList.contains('10.34') ||
            channelsList.contains('5.15') ||
            channelsList.contains('2.14') ||
            channelsList.contains('29.46')) {
          if (channelsList.contains('10.20') ||
              channelsList.contains('7.31') ||
              channelsList.contains('1.8') ||
              channelsList.contains('13.33')) {
            type = 'manifesting generator';
          }
        }
      }

      if (centers.contains('sacral')) {
        if (type != 'manifesting generator') {
          type = 'generator';
        }
      } else if (type != 'manifestor') {
        type = 'projector';
      }
    }
    strategy = 'NOT READY YET';

    if (type == 'manifestor') {
      if (authority == 'emotional') {
        //strategy = 'inform with emotional clarity';
        strategy = 'ליידע בבהירות רגשית';
        authority = 'רגש';
      } else if (authority == 'splenic') {
        //strategy = 'inform spontaneously';
        strategy = 'ליידע בספונטניות';
        authority = 'טחול';
      } else {
        //strategy = 'inform at will';
        strategy = 'ליידע מרצון';
        authority = 'לב';
      }
    } else if (centers.contains('sacral')) {
      if (authority == 'emotional') {
        //strategy = 'respond with emotional clarity';
        strategy = 'להגיב בבהירות רגשית';
        authority = 'רגש';
      } else {
        //strategy = 'respond in the moment';
        strategy = 'להגיב מהבטן';
        authority = 'בטן';
      }
    } else if (type == 'projector') {
      if (authority == 'emotional') {
        //strategy = 'recognize invitation with emotional clarity';
        strategy = 'לזהות הזמנה בבהירות רגשית';
        authority = 'רגש';
      } else if (authority == 'splenic') {
        //strategy = 'recognize spontaneous invitation';
        strategy = 'לזהות הזמנה ספונטנית';
        authority = 'טחול';
      } else if (authority == 'ego') {
        //strategy = 'recognize invitation to prove yourself';
        strategy = 'לזהות הזמנה להוכיח';
        authority = 'לב';
      } else if (authority == 'self') {
        //strategy = 'recognize invitation to express who you are';
        strategy = 'לזהות הזמנה לבטא עצמך';
        authority = 'עצמי';
      } else {
        //strategy = 'recognize invitation to conceptualize';
        strategy = 'לזהות הזמנה לחשוב';
        authority = 'מחשבתי';
      }
    } else {
      //strategy = 'watch the moon cycle';
      strategy = 'לצפות במעגל הירח';
      authority = 'חופשי';
    }
    //print (type);
    switch (type) {
      case 'manifestor':
        type = 'מורכב להגשים';
        coin = hexBasicMixList[0];
        coinname = hexNamesList[0];
        sentence = 'מורכב להשפיע בחיוביות';
        break;
      case 'reflector':
        type = 'פשוט לשקף';
        coinname = hexNamesList[1];
        sentence = 'לדגום הפכים בהפתעה';
        break;
      case 'projector':
        type = 'להקרין נשימה';
        coin = hexBasicMixList[2];
        coinname = hexNamesList[2];
        sentence = 'להתאזן בהצלחה';
        break;
      case 'generator':
        type = 'מחול השתיקה';
        coin = hexBasicMixList[3];
        coinname = hexNamesList[3];
        sentence = 'לסנן שליליות בשתיקה מספקת';
        break;
      case 'manifesting generator':
        type = 'מחול השתיקה המגשימה';
        coin = hexBasicMixList[3];
        coinname = hexNamesList[3];
        sentence = 'לסנן שליליות בשתיקה מספקת';
        break;
      default:
        sentence = 'לא יודעת? שבי על דלעת';
    }

    //hdbasicdata = [type, authority, strategy, sentence, coinname];
    hddata.type = type;
    hddata.authority = authority;
    hddata.strategy = strategy;
    hddata.definition = '';
    hddata.cross = '';
    hddata.profile = '';
    hddata.sentence = sentence;
    hddata.coin = '';
    hddata.coinname = coinname;


    //return hdbasicdata;
    return hddata;
  }

  static HDChannel mapHDChannel(String channelid) {
    HDChannel hdchannel = HDChannel();
    int hdchannelidx, hdchannelsentenceidx;

    hdchannelidx = hdchannelsList.indexOf(channelid);
    hdchannel.id = hdchannelsList[hdchannelidx];
    hdchannel.firstcenter = hdchannelsList[hdchannelidx + 1];
    hdchannel.secondcenter = hdchannelsList[hdchannelidx + 2];
    hdchannel.name = hdchannelsList[hdchannelidx + 3];
    hdchannel.adaptname = hdchannelsList[hdchannelidx + 4];
    hdchannel.coin = hdchannelsList[hdchannelidx + 5];
    hdchannel.description = hdchannelsList[hdchannelidx + 6];
    hdchannel.circuitry = hdchannelsList[hdchannelidx + 7];
    hdchannel.circuit = hdchannelsList[hdchannelidx + 8];
    hdchannel.stream = hdchannelsList[hdchannelidx + 9];

    hdchannelsentenceidx = hdchannelsentenceList.indexOf(channelid);
    hdchannel.sentence = hdchannelsentenceList[hdchannelsentenceidx + 1];

    return hdchannel;
  }
}
