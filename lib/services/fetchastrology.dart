import 'dart:convert';
import 'package:finallyicanlearn/models/astrologyjsonmap.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class AstrologyServices {
 static Future<List<int>> getAstrology() async{

   DateTime now = DateTime.now();
   String _formattedDate = DateFormat('yyyy-MM-dd').format(now);
   String _formattedTime = DateFormat('kk:mm:ss').format(now);

   final Astrology astrology;
   final List<int> _signsList;
   final String uri = "http://localhost:3000/horoscope?time="+_formattedDate+"T"+_formattedTime+"Z&latitude=-33.41167&longitude=-70.66647";
   print (uri);
   var response  = await http.get(Uri.parse(uri));
   //var response  = await http.get(Uri.parse("http://localhost:3000/horoscope?time=1993-08-06T20:50:00Z&latitude=-33.41167&longitude=-70.66647"));
     astrology = astrologyFromJson(response.body);
     _signsList = [astrology.data.astros.moon.sign,
       astrology.data.astros.mercury.sign,
       astrology.data.astros.venus.sign,
       astrology.data.astros.mars.sign ];
     return _signsList;

   //return response.statusCode == 200 ? astrology : Exception("API ERROR");
 }
}