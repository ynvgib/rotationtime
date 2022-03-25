
import 'package:flutter/material.dart';

List<Widget> items = [
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
          AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),

  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
          AssetImage('assets/simplein.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Simple'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
          AssetImage('assets/breathout.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Breath'),
    subtitle: Text('Body'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
          AssetImage('assets/silencedown.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Silence'),
    subtitle: Text('Body'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),

  // Mutation 2
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/simplein.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Simple'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),

  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/simplein.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Simple'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/simplein.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Simple'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/breathout.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Breath'),
    subtitle: Text('Body'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/simplein.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Simple'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/silencedown.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Silence'),
    subtitle: Text('Body'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/simplein.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Simple'),
    subtitle: Text('Mind'),
  ),
  const ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage('assets/complexup.png'), // no matter how big it is, it won't overflow
    ),
    title: Text('Complex'),
    subtitle: Text('Mind'),
  ),


];

class WheelNew extends StatefulWidget {
  const WheelNew({Key? key}) : super(key: key);

  @override
  _WheelNewState createState() => _WheelNewState();
}

class _WheelNewState extends State<WheelNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("I Do Not Know Meditation"),
        backgroundColor: Colors.blue,
      ),
      body: ListWheelScrollView(
        itemExtent: 60,
        //squeeze: 2.0,
        //useMagnifier: true,
        //magnification: 1.2,
        children: items,
      ),
    );
  }
}
