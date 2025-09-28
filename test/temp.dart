import 'dart:html' as html;
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fractal Tree',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double _progress = 0.01;
  Animation<double> animation = 0.0;
  AnimationController controller = ;

  @override
  void initState() {
    super.initState();
    final curve = Cubic(.49, 0, .04, 1);
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    final Animation curveAnimation =
    CurvedAnimation(parent: controller, curve: curve);

    animation = Tween<double>(begin: 0.01, end: 0.26).animate(curveAnimation)
      ..addListener(() => _onSliderChanged(animation.value))
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomPaint(
                  painter: TreePainter(_progress),
                ),
              ),
            ),
            FlatButton.icon(
              textColor: Colors.white,
              icon: Icon(Icons.favorite_border),
              label: Text('Follow me on Twitter'),
              onPressed: () {
                html.window.open('https://twitter.com/a_tarek360', '');
              },
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }

  void _onSliderChanged(double progress) {
    setState(() {
      _progress = progress;
    });
  }
}

class TreePainter extends CustomPainter {
  final double progress;
  static const int _depth = 12;

  TreePainter(this.progress);

  static const degToRed = math.pi / 180.0;
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final lineLength = math.min(size.width, size.height) * 0.008;
    final x = size.width / 2;
    final y = size.height * 0.8;
    _drawTree(canvas, x, y, -90, 90 * progress, _depth, lineLength);
  }

  void _drawTree(Canvas canvas, double x1, double y1, double angle,
      double offset, int depth, double lineLength) {
    if (depth != 0) {
      _paint
        ..strokeWidth = depth * 0.2
        ..color = _colors[(depth % _colors.length)];
      final x2 = x1 + (math.cos(angle * degToRed) * depth * lineLength);
      final y2 = y1 + (math.sin(angle * degToRed) * depth * lineLength);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), _paint);
      _drawTree(canvas, x2, y2, angle - offset, offset, depth - 1, lineLength);
      _drawTree(canvas, x2, y2, angle + offset, offset, depth - 1, lineLength);
    }
  }

  final _colors = [
    Color(0xFF70d6ff),
    Color(0xFFff70a6),
    Color(0xffff006e),
    Color(0xff3a86ff),
    Color(0xffffbe0b),
    Color(0xff39ff14),
  ];

  @override
  bool shouldRepaint(TreePainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
