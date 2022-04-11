// To parse this JSON data, do
//
//     final astrology = astrologyFromJson(jsonString);

import 'dart:convert';

Astrology astrologyFromJson(String str) => Astrology.fromJson(json.decode(str));

String astrologyToJson(Astrology data) => json.encode(data.toJson());

class Astrology {
  Astrology({
    required this.data,
  });

  Data data;

  factory Astrology.fromJson(Map<String, dynamic> json) => Astrology(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.astros,
    required this.axes,
    required this.houses,
    required this.aspects,
  });

  Astros astros;
  Aspects axes;
  List<dynamic> houses;
  Aspects aspects;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    astros: Astros.fromJson(json["astros"]),
    axes: Aspects.fromJson(json["axes"]),
    houses: List<dynamic>.from(json["houses"].map((x) => x)),
    aspects: Aspects.fromJson(json["aspects"]),
  );

  Map<String, dynamic> toJson() => {
    "astros": astros.toJson(),
    "axes": axes.toJson(),
    "houses": List<dynamic>.from(houses.map((x) => x)),
    "aspects": aspects.toJson(),
  };
}

class Aspects {
  Aspects();

  factory Aspects.fromJson(Map<String, dynamic> json) => Aspects(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Astros {
  Astros({
    required this.sun,
    required this.northnode,
    required this.moon,
    required this.mercury,
    required this.venus,
    required this.mars,
    required this.jupiter,
    required this.saturn,
    required this.uranus,
    required this.neptune,
    required this.pluto,
    required this.chiron,
    required this.lilith,
    required this.ceres,
    required this.vesta,
    required this.pallas,
    required this.juno,
  });

  Sun sun;
  NorthNode northnode;
  Moon moon;
  Mercury mercury;
  Venus venus;
  Mars mars;
  Jupiter jupiter;
  Saturn saturn;
  Uranus uranus;
  Neptune neptune;
  Pluto pluto;
  Chiron chiron;
  Lilith lilith;
  Ceres ceres;
  Vesta vesta;
  Pallas pallas;
  Juno juno;

  factory Astros.fromJson(Map<String, dynamic> json) => Astros(
    sun: Sun.fromJson(json["sun"]),
    northnode: NorthNode.fromJson(json["northnode"]),
    moon: Moon.fromJson(json["moon"]),
    mercury: Mercury.fromJson(json["mercury"]),
    venus: Venus.fromJson(json["venus"]),
    mars: Mars.fromJson(json["mars"]),
    jupiter: Jupiter.fromJson(json["jupiter"]),
    saturn: Saturn.fromJson(json["saturn"]),
    uranus: Uranus.fromJson(json["uranus"]),
    neptune: Neptune.fromJson(json["neptune"]),
    pluto: Pluto.fromJson(json["pluto"]),
    chiron: Chiron.fromJson(json["chiron"]),
    lilith: Lilith.fromJson(json["lilith"]),
    ceres: Ceres.fromJson(json["ceres"]),
    vesta: Vesta.fromJson(json["vesta"]),
    pallas: Pallas.fromJson(json["pallas"]),
    juno: Juno.fromJson(json["juno"]),
  );

  Map<String, dynamic> toJson() => {
    "sun": sun.toJson(),
    "northnode": northnode.toJson(),
    "moon": moon.toJson(),
    "mercury": mercury.toJson(),
    "venus": venus.toJson(),
    "mars": mars.toJson(),
    "jupiter": jupiter.toJson(),
    "saturn": saturn.toJson(),
    "uranus": uranus.toJson(),
    "neptune": neptune.toJson(),
    "pluto": pluto.toJson(),
    "chiron": chiron.toJson(),
    "lilith": lilith.toJson(),
    "ceres": ceres.toJson(),
    "vesta": vesta.toJson(),
    "pallas": pallas.toJson(),
    "juno": juno.toJson(),
  };
}

class Sun {
  Sun({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Sun.fromJson(Map<String, dynamic> json) => Sun(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}

class NorthNode {
  NorthNode({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory NorthNode.fromJson(Map<String, dynamic> json) => NorthNode(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}

class Moon {
  Moon({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Moon.fromJson(Map<String, dynamic> json) => Moon(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Mercury {
  Mercury({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Mercury.fromJson(Map<String, dynamic> json) => Mercury(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Venus {
  Venus({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Venus.fromJson(Map<String, dynamic> json) => Venus(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Mars {
  Mars({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Mars.fromJson(Map<String, dynamic> json) => Mars(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Jupiter {
  Jupiter({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Jupiter.fromJson(Map<String, dynamic> json) => Jupiter(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Saturn {
  Saturn({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Saturn.fromJson(Map<String, dynamic> json) => Saturn(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Uranus {
  Uranus({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Uranus.fromJson(Map<String, dynamic> json) => Uranus(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Neptune {
  Neptune({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Neptune.fromJson(Map<String, dynamic> json) => Neptune(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Pluto {
  Pluto({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Pluto.fromJson(Map<String, dynamic> json) => Pluto(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Chiron {
  Chiron({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Chiron.fromJson(Map<String, dynamic> json) => Chiron(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Lilith {
  Lilith({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Lilith.fromJson(Map<String, dynamic> json) => Lilith(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Ceres {
  Ceres({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Ceres.fromJson(Map<String, dynamic> json) => Ceres(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Vesta {
  Vesta({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Vesta.fromJson(Map<String, dynamic> json) => Vesta(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Pallas {
  Pallas({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Pallas.fromJson(Map<String, dynamic> json) => Pallas(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}
class Juno {
  Juno({
    required this.name,
    required this.position,
    required this.speed,
    required this.retrograde,
    required this.sign,
    required this.type,
  });

  String name;
  Position position;
  double speed;
  bool retrograde;
  int sign;
  String type;

  factory Juno.fromJson(Map<String, dynamic> json) => Juno(
    name: json["name"],
    position: Position.fromJson(json["position"]),
    speed: json["speed"].toDouble(),
    retrograde: json["retrograde"],
    sign: json["sign"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "position": position.toJson(),
    "speed": speed,
    "retrograde": retrograde,
    "sign": sign,
    "type": type,
  };
}


class Position {
  Position({
    required this.longitude,
    required this.degrees,
    required this.minutes,
    required this.seconds,
  });

  double longitude;
  int degrees;
  int minutes;
  int seconds;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    longitude: json["longitude"].toDouble(),
    degrees: json["degrees"],
    minutes: json["minutes"],
    seconds: json["seconds"],
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "degrees": degrees,
    "minutes": minutes,
    "seconds": seconds,
  };
}
