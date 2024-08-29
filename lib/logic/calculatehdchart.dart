import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';

class HDServices {
  static List<HDChannel> getHDChannels(List<Hexagram> combinedPlanetsList) {
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

    for (int i = 0; combinedPlanetsList.length > i; i++) {
      uniquegatesList.add(combinedPlanetsList[i].gate!);
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
            hdsilencechannels.add(tempchannel);
            break;
          case 'breath':
            hdbreathchannels.add(tempchannel);
            break;
          case 'simple':
            hdsimplechannels.add(tempchannel);
            break;
          case 'complex':
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
            hdsilencechannels.add(tempchannel);
            break;
          case 'breath':
            hdbreathchannels.add(tempchannel);
            break;
          case 'simple':
            hdsimplechannels.add(tempchannel);
            break;
          case 'complex':
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

  static List<hdCenter> getHDCenters(List<HDChannel> channelids) {
    List<hdCenter> centers = [];

    hdCenter headcenter = hdCenter(),
        ajnacenter = hdCenter(),
        throatcenter = hdCenter(),
        selfcenter = hdCenter(),
        heartcenter = hdCenter(),
        spleencenter = hdCenter(),
        sacralcenter = hdCenter(),
        solarcenter = hdCenter(),
        rootcenter = hdCenter();
    //List<bool> centerslist = List.filled(9, false, growable: false);;
    //head 0, ajna 1, throat 2, self 3, heart 4 , spleen 5, sacral 6, solar 7, root 8
    //int _channelidx;
    //Set<String> centersset;

    headcenter.name = 'head';
    ajnacenter.name = 'ajna';
    throatcenter.name = 'throat';
    selfcenter.name = 'self';
    heartcenter.name = 'heart';
    spleencenter.name = 'spleen';
    sacralcenter.name = 'sacral';
    solarcenter.name = 'solar';
    rootcenter.name = 'root';

    headcenter.state = 3;
    ajnacenter.state = 3;
    throatcenter.state = 3;
    selfcenter.state = 3;
    heartcenter.state = 3;
    spleencenter.state = 3;
    sacralcenter.state = 3;
    solarcenter.state = 3;
    rootcenter.state = 3;

    if (channelids.isNotEmpty) {
      for (int i = 0; channelids.length > i; i++) {

        switch (channelids[i].coin) {
          case 'silence':
            if (channelids[i].firstcenter! == 'sacral') {
              sacralcenter.state = 1;
              switch (channelids[i].secondcenter!) {
                case 'root':
                  rootcenter.state = 1;
                  break;
                case 'spleen':
                  spleencenter.state = 1;
                  break;
                case 'self':
                  selfcenter.state = 1;
                  break;
                case 'throat':
                  throatcenter.state = 1;
                  break;
                default:
                  break;
              }
            } else {
              sacralcenter.state = 1;
              solarcenter.state = 1;
            }
            break;
          case 'breath':
            switch (channelids[i].firstcenter!) {
              case 'solar':
                if (solarcenter.state != 3) {
                  if (channelids[i].secondcenter == 'heart') {
                    if (heartcenter.state == 3) {
                      heartcenter.state = 2;
                    }
                  } else {
                    if (rootcenter.state == 3) {
                      rootcenter.state = 2;
                    }
                  }
                }
                //else if (solarcenter.state == 3) {
                else {
                  solarcenter.state = 2;
                  if (channelids[i].secondcenter == 'heart') {
                    if (heartcenter.state == 3) {
                      heartcenter.state = 2;
                    }
                  } else {
                    if (rootcenter.state == 3) {
                      rootcenter.state = 2;
                    }
                  }
                }
                break;
              case 'spleen':
                if (spleencenter.state == 2) {
                  switch (channelids[i].secondcenter!) {
                    case 'root':
                      if (rootcenter.state == 3) {
                        rootcenter.state = 2;
                      }
                      break;
                    case 'heart':
                      if (heartcenter.state == 3) {
                        heartcenter.state = 2;
                      }
                      break;
                    case 'self':
                      if (selfcenter.state == 3) {
                        selfcenter.state = 2;
                      }
                      break;
                    case 'throat':
                      if (throatcenter.state == 3) {
                        selfcenter.state = 2;
                      }
                      break;
                    default:
                      break;
                  }
                }
                else if (spleencenter.state == 3) {
                  spleencenter.state = 2;
                  switch (channelids[i].secondcenter!) {
                    case 'root':
                      if (rootcenter.state == 3) {
                        rootcenter.state = 2;
                      }
                      break;
                    case 'heart':
                      if (heartcenter.state == 3) {
                        heartcenter.state = 2;
                      }
                      break;
                    case 'self':
                      if (selfcenter.state == 3) {
                        selfcenter.state = 2;
                      }
                      break;
                    case 'throat':
                      if (throatcenter.state == 3) {
                        throatcenter.state = 2;
                      }
                      break;
                    default:
                      break;
                  }
                }
                break;
              case 'heart':
                if (heartcenter.state == 2 || heartcenter.state == 4) {
                  if (selfcenter.state == 3){
                    selfcenter.state = 2;
                  }
                }
                else if (heartcenter.state == 3) {
                    heartcenter.state = 2;
                    if (selfcenter.state == 3){
                      selfcenter.state = 2;
                    }
                }
                break;
              case 'self':
                if (selfcenter.state == 2) {
                  if (throatcenter.state == 3){
                    throatcenter.state = 2;
                  }
                }
                else if (selfcenter.state == 3) {
                  selfcenter.state = 2;
                  if (throatcenter.state == 3){
                    throatcenter.state = 2;
                  }
                }
                break;
              case 'throat':
                if (throatcenter.state != 3) {
                    ajnacenter.state = 2;
                }
                else if (throatcenter.state == 3) {
                  throatcenter.state = 2;
                    ajnacenter.state = 2;
                }
                break;
              case 'ajna':
                if (ajnacenter.state == 2) {
                    headcenter.state = 2;
                }
                else if (ajnacenter.state == 3) {
                  ajnacenter.state = 2;
                    headcenter.state = 2;
                }
                break;
              default:
                break;
            }
            break;
          case 'complex':
            switch (channelids[i].firstcenter!) {
              case 'solar':
                if (solarcenter.state == 3) {
                  solarcenter.state = 4;
                  if (throatcenter.state! != 1) {
                    throatcenter.state = 4;
                  }
                }
                break;
              case 'heart':
                if (heartcenter.state == 3) {
                  heartcenter.state = 4;
                  if (throatcenter.state! > 1 && throatcenter.state! < 4) {
                    throatcenter.state = 4;
                  }
                }
                break;
              default:
                break;
            }
            break;
          default:
            break;
        }

      }
    }

    centers = [
      headcenter,
      ajnacenter,
      throatcenter,
      selfcenter,
      heartcenter,
      spleencenter,
      sacralcenter,
      solarcenter,
      rootcenter
    ];

    //for (int i = 0 ; centers.length > i; i++){
    //  print (centers[i].name);
    //  print (centers[i].state);
    //}
    return centers;
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

  static HumanDesign getHDBasicData(List<HDChannel> hdchannels) {
    List<String> hdbasicdata = [], channelsList = [];
    List<hdCenter> centers = [];
    hdCenter headcenter = hdCenter(),
        ajnacenter = hdCenter(),
        throatcenter = hdCenter(),
        selfcenter = hdCenter(),
        heartcenter = hdCenter(),
        spleencenter = hdCenter(),
        sacralcenter = hdCenter(),
        solarcenter = hdCenter(),
        rootcenter = hdCenter();

    HumanDesign hddata = HumanDesign();

    int typeidx = 0;
    //List<HDChannel> hdchannels = [];
    String channelid = '',
        type = '',
        authority = '',
        strategy = '',
        sentence = '',
        coin = '',
        coinname = '';

    //hdchannels = getHDChannels(personalityplanets, designplanets);
    centers = getHDCenters(hdchannels);
    headcenter = centers[0];
    ajnacenter = centers[1];
    throatcenter = centers[2];
    selfcenter = centers[3];
    heartcenter = centers[4];
    spleencenter = centers[5];
    sacralcenter = centers[6];
    solarcenter = centers[7];
    rootcenter = centers[8];

    for (int i = 0; hdchannels.length > i; i++) {
      channelid = hdchannels[i].id!;
      channelsList.add(channelid);
    }

    // first set reflector
    // no channels
    //if (centers.isEmpty) {
    if (hdchannels.isEmpty) {
      type = hdtypesList.last;
      authority = hdauthority.last;
      //} else if (centers.contains('solar')) {
    } else if (solarcenter.state != 3) {
      //authority = 'emotional';
      authority = hdauthority[0];
      //if (centers.contains('sacral')) {
      if (sacralcenter.state != 3) {
        type = hdtypesList[2];
      }
    //} else if (centers.contains('sacral')) {
    } else if (sacralcenter.state != 3) {
      //authority = 'sacral';
      authority = hdauthority[1];
      type = hdtypesList[2];
    //} else if (centers.contains('spleen')) {
    } else if (spleencenter.state != 3) {
      //authority = 'splenic';
      authority = hdauthority[2];
    //} else if (centers.contains('heart')) {
    } else if (heartcenter.state != 3) {
      //authority = 'ego';
      authority = hdauthority[3];
    //} else if (centers.contains('self')) {
    } else if (selfcenter.state != 3) {
      //authority = 'self';
      authority = hdauthority[5];
      type = hdtypesList[3];
    } else {
      //authority = 'sound board';
      authority = hdauthority[6];
      type = hdtypesList[3];
    }

    //if (centers.isEmpty) {
    if (hdchannels.isEmpty) {
      type = hdtypesList[4];
    } else {
      //if (!centers.contains('throat')) {
      if (throatcenter.state == 3) {
        //if (!centers.contains('sacral')) {
        if (sacralcenter.state != 3) {
          type = hdtypesList[3];
        } else {
          type = hdtypesList[2];
        }
      }

      if (channelsList.contains('12.22') ||
          channelsList.contains('35.36') ||
          channelsList.contains('21.45')) {
        //type = 'manifestor';
        type = hdtypesList[0];
      } else if (channelsList.contains('16.48') ||
          channelsList.contains('20.57')) {
        if (channelsList.contains('26.44') ||
            channelsList.contains('32.54') ||
            channelsList.contains('28.38') ||
            channelsList.contains('18.58')) {
          //type = 'manifestor';
          type = hdtypesList[0];
        }
      }

      //if (type != 'manifestor') {
      if (type != hdtypesList[0]) {
        if (channelsList.contains('10.20') ||
            channelsList.contains('7.31') ||
            channelsList.contains('1.8') ||
            channelsList.contains('13.33')) {
          if (channelsList.contains('25.51')) {
            //type = 'manifestor';
            type = hdtypesList[0];
          }
        }
      }

      //if (centers.contains('sacral')) {
      if (sacralcenter.state == 1) {
        //if (type == 'manifestor') {
        if (type == hdtypesList[0]) {
          //type = 'manifesting generator';
          type = hdtypesList[1];
        } else if (channelsList.contains('20.34')) {
          type = hdtypesList[1];
        } else if (channelsList.contains('27.50')) {
          if (channelsList.contains('16.48') ||
              channelsList.contains('20.57')) {
            type = hdtypesList[1];
          } else if (channelsList.contains('10.57')) {
            if (channelsList.contains('7.31') ||
                channelsList.contains('1.8') ||
                channelsList.contains('13.33')) {
              type = hdtypesList[1];
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
            type = hdtypesList[1];
          }
        }
      }

      //if (centers.contains('sacral')) {
      if (sacralcenter.state == 1) {
        if (type != hdtypesList[1]) {
          type = hdtypesList[2];
        }
        //} else if (type != 'manifestor') {
      } else if (type != hdtypesList[0]) {
        type = hdtypesList[3];
      }
    }
    strategy = 'NOT READY YET';

    //if (type == 'manifestor') {
    if (type == hdtypesList[0]) {
      //print (authority);
      //if (authority == 'emotional') {
      if (authority == hdauthority[0]) {
        //strategy = 'inform with emotional clarity';
        strategy = hdstrategyList[0];
        //} else if (authority == 'splenic') {
      } else if (authority == hdauthority[2]) {
        //strategy = 'inform spontaneously';
        strategy = hdstrategyList[1];
      } else {
        //strategy = 'inform at will';
        strategy = hdstrategyList[2];
      }
    //} else if (centers.contains('sacral')) {
    } else if (sacralcenter.state == 1) {
      //if (authority == 'emotional') {
      if (authority == hdauthority[0]) {
        //strategy = 'respond with emotional clarity';
        strategy = hdstrategyList[3];
      } else {
        //strategy = 'respond in the moment';
        strategy = hdstrategyList[4];
      }
    } else if (type == hdtypesList[3]) {
      //if (authority == 'emotional') {
      if (authority == hdauthority[0]) {
        //strategy = 'recognize invitation with emotional clarity';
        strategy = hdstrategyList[5];
        //} else if (authority == 'splenic') {
      } else if (authority == hdauthority[2]) {
        //strategy = 'recognize spontaneous invitation';
        strategy = hdstrategyList[6];
        //} else if (authority == 'ego') {
      } else if (authority == hdauthority[3]) {
        //print(authority);
        //strategy = 'recognize invitation to prove yourself';
        strategy = hdstrategyList[7];
        authority = hdauthority[4];
        //} else if (authority == 'self') {
      } else if (authority == hdauthority[5]) {
        //strategy = 'recognize invitation to express who you are';
        strategy = hdstrategyList[8];
      } else {
        //strategy = 'recognize invitation to conceptualize';
        strategy = hdstrategyList[9];
      }
    } else {
      //strategy = 'watch the moon cycle';
      strategy = hdstrategyList[10];
    }

    typeidx = hdtypesList.indexOf(type);

    switch (typeidx) {
      //case 'manifestor':
      case 0:
        coin = hexBasicMixList[0];
        coinname = hexNamesList[0];
        sentence = 'Impact Positively with Peace';
        break;
      //case 'reflector':
      case 4:
        coinname = hexNamesList[1];
        sentence = 'Balance Oppositions with Surprise';
        break;
      //case 'projector':
      case 3:
        coin = hexBasicMixList[2];
        coinname = hexNamesList[2];
        sentence = 'Align Balance with Success';
        break;
      //case 'generator':
      case 2:
        coin = hexBasicMixList[3];
        coinname = hexNamesList[3];
        sentence = 'Filter Negativity with Satisfaction';
        break;
      //case 'manifesting generator':
      case 1:
        coin = hexBasicMixList[3];
        coinname = hexNamesList[3];
        sentence = 'Filter Negativity with Satisfaction';
        break;
      default:
        sentence = 'I don\'t know';
    }

    //print (strategy);
    //print (authority);
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
