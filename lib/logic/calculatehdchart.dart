import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';

class HDServices {
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
