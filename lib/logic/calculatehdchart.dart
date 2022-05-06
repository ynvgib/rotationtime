import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';

class HDServices {
  static List<HDChannel> getHDChannels(
      List<Hexagram> _personalityplanets, _designplanets) {
    List<String> _channelidList = [];
    List<int> _uniquegatesList = [];
    Set<int> _setgates;
    String _channelid = '';
    List<HDChannel> _hdchannelsList = [];

    for (int i = 0; _personalityplanets.length > i; i++) {
      _uniquegatesList.add(_personalityplanets[i].gate!);
      _uniquegatesList.add(_designplanets[i].gate!);
    }
    _setgates = _uniquegatesList.toSet();
    _uniquegatesList = _setgates.toList();
    _uniquegatesList.sort();
    //print (_uniquegatesList);

    if (_uniquegatesList.isNotEmpty) {
      for (int i = 0; _uniquegatesList.length - 1 > i; i++) {
        for (int y = 1; _uniquegatesList.length - i > y; y++) {
          _channelid = _uniquegatesList[i].toString() +
              '.' +
              _uniquegatesList[y + i].toString();
          if (hdchannelsList.contains(_channelid)) {
            _channelidList.add(_channelid);
          }
        }
      }
      //print (_channelidList);

      for (int i = 0; _channelidList.length > i; i++) {
        _hdchannelsList.add(mapHDChannel(_channelidList[i]));
      }
    }
    return _hdchannelsList;
  }

  static List<String> getHDDefinedCenters(List<HDChannel> _channelids) {
    List<String> _centers = [];
    //int _channelidx;
    Set<String> _centersset;

    if (_channelids.isNotEmpty) {
      for (int i = 0; _channelids.length > i; i++) {
        _centers.add(_channelids[i].firstcenter!);
        _centers.add(_channelids[i].secondcenter!);
      }
      _centersset = _centers.toSet();
      _centers = _centersset.toList();
      //print(_centers);
    }
    return _centers;
  }

  static List<String> getHDBasicData(
      List<Hexagram> _personalityplanets, _designplanets) {
    List<String> _hdbasicdata = [], _centers = [], _channelsList = [];

    List<HDChannel> _hdchannelsList = [];
    String _channelid = '', _type = '', _authority = '', _strategy = '';

    _hdchannelsList = getHDChannels(_personalityplanets, _designplanets);
    _centers = getHDDefinedCenters(_hdchannelsList);

    for (int i = 0; _hdchannelsList.length > i; i++) {
      _channelid = _hdchannelsList[i].id!;
      _channelsList.add(_channelid);
    }

    //print(_channelsList);
    // first set reflector
    // no channels
    if (_centers.isEmpty) {
      _type = hdtypesList.last;
      _authority = hdauthority.last;
    } else if (_centers.contains('solar')) {
      _authority = 'emotional';
      if (_centers.contains('sacral')) {
        _type = 'generator';
      }
    } else if (_centers.contains('sacral')) {
      _authority = 'sacral';
      _type = 'generator';
    } else if (_centers.contains('spleen')) {
      _authority = 'splenic';
    } else if (_centers.contains('heart')) {
      _authority = 'ego';
    } else if (_centers.contains('self')) {
      _authority = 'self';
      _type = 'projector';
    } else {
      _authority = 'sound board';
      _type = 'projector';
    }

    if (_centers.isEmpty) {
      _type = 'reflector';
    } else {
      if (!_centers.contains('throat')) {
        if (!_centers.contains('sacral')) {
          _type = 'projector';
        } else {
          _type = 'generator';
        }
      }

      if (_channelsList.contains('12.22') ||
          _channelsList.contains('35.36') ||
          _channelsList.contains('21.45')) {
        _type = 'manifestor';
      } else if (_channelsList.contains('16.48') ||
          _channelsList.contains('20.57')) {
        if (_channelsList.contains('26.44') ||
            _channelsList.contains('32.54') ||
            _channelsList.contains('28.38') ||
            _channelsList.contains('18.58')) {
          _type = 'manifestor';
        }
      }

      if (_type != 'manifestor') {
        if (_channelsList.contains('10.20') ||
            _channelsList.contains('7.31') ||
            _channelsList.contains('1.8') ||
            _channelsList.contains('13.33')) {
          if (_channelsList.contains('25.51')) {
            _type = 'manifestor';
          }
        }
      }

      if (_centers.contains('sacral')) {
        if (_type == 'manifestor') {
          _type = 'manifesting generator';
        } else if (_channelsList.contains('20.34')) {
          _type = 'manifesting generator';
        } else if (_channelsList.contains('27.50')) {
          if (_channelsList.contains('16.48') ||
              _channelsList.contains('20.57')) {
            _type = 'manifesting generator';
          } else if (_channelsList.contains('10.57')) {
            if (_channelsList.contains('7.31') ||
                _channelsList.contains('1.8') ||
                _channelsList.contains('13.33')) {
              _type = 'manifesting generator';
            }
          }
        } else if (_channelsList.contains('10.34') ||
            _channelsList.contains('5.15') ||
            _channelsList.contains('2.14') ||
            _channelsList.contains('29.46')) {
          if (_channelsList.contains('10.20') ||
              _channelsList.contains('7.31') ||
              _channelsList.contains('1.8') ||
              _channelsList.contains('13.33')) {
            _type = 'manifesting generator';
          }
        }
      }

      if (_centers.contains('sacral')) {
        if (_type != 'manifesting generator') {
          _type = 'generator';
        }
      } else if (_type != 'manifestor') {
        _type = 'projector';
      }
    }
    _strategy = 'NOT READY YET';

    if (_type == 'manifestor') {
      if (_authority == 'emotional') {
        _strategy = 'inform with emotional clarity';
      } else if (_authority == 'splenic') {
        _strategy = 'inform spontaneously';
      } else {
        _strategy = 'inform at will';
      }
    } else if (_centers.contains('sacral')) {
      if (_authority == 'emotional') {
        _strategy = 'respond with emotional clarity';
      } else {
        _strategy = 'respond in the moment';
      }
    } else if (_type == 'projector') {
      if (_authority == 'emotional') {
        _strategy = 'recognize invitation with emotional clarity';
      } else if (_authority == 'splenic') {
        _strategy = 'recognize spontaneous invitation';
      } else if (_authority == 'ego') {
        _strategy = 'recognize invitation to prove yourself';
      } else if (_authority == 'self') {
        _strategy = 'recognize invitation to express who you are';
      } else {
        _strategy = 'recognize invitation to speak your mind';
      }
    } else {
      _strategy = 'watch the moon cycle';
    }

    _hdbasicdata = [_type, _authority, _strategy];
    //print(_hdbasicdata);

    return _hdbasicdata;
  }

  static HDChannel mapHDChannel(String _channelid) {
    //List<HDChannel> _hdchannelsdata = [];
    HDChannel _hdchannel = HDChannel();
    //String? _id,_firstcenter, _secondcenter, _name, _description, _circuitry, _circuit, _stream;
    int _hdchannelidx;

    _hdchannelidx = hdchannelsList.indexOf(_channelid);
    _hdchannel.id = hdchannelsList[_hdchannelidx];
    _hdchannel.firstcenter = hdchannelsList[_hdchannelidx + 1];
    _hdchannel.secondcenter = hdchannelsList[_hdchannelidx + 2];
    _hdchannel.name = hdchannelsList[_hdchannelidx + 3];
    _hdchannel.description = hdchannelsList[_hdchannelidx + 4];
    _hdchannel.circuitry = hdchannelsList[_hdchannelidx + 5];
    _hdchannel.circuit = hdchannelsList[_hdchannelidx + 6];
    _hdchannel.stream = hdchannelsList[_hdchannelidx + 7];

    return _hdchannel;
  }
}
