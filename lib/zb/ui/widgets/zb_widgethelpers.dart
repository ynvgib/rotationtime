import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p; // Helpful for joining paths correctly

final GlobalKey zbChartBoundaryKey = GlobalKey();

Future<String?> capturePng() async {
  try {
    await Future.delayed(const Duration(milliseconds: 20));

    RenderRepaintBoundary? boundary = zbChartBoundaryKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary?;

    if (boundary == null) return null;

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return null;
    Uint8List pngBytes = byteData.buffer.asUint8List();

    Directory? directory;
    String fileName = 'zb_chart_${DateTime.now().millisecondsSinceEpoch}.png';

    if (Platform.isAndroid) {
      directory = await getApplicationDocumentsDirectory();
    } else if (Platform.isLinux) {
      directory = await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory();
    } else {
      directory = await getTemporaryDirectory();
    }

    final String fullPath = p.join(directory!.path, fileName);
    final File file = File(fullPath);
    await file.writeAsBytes(pngBytes);

    return fullPath;
  } catch (e) {
    debugPrint("Capture failed: $e");
    return null;
  }
}

class ZBExportButton extends StatelessWidget {
  final Color color;
  final double size;

  const ZBExportButton({
    super.key,
    this.color = Colors.blueGrey,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.camera_alt_outlined,
        color: color,
        size: size,
      ),
      tooltip: 'Save PNG',
      onPressed: () async {
        final String? path = await capturePng();

        // Guard against using context if the widget was disposed during the 'await'
        if (!context.mounted) return;

        if (path != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Saved to: $path'),
              duration: const Duration(seconds: 4),
              behavior:
                  SnackBarBehavior.floating, // Looks better on Ubuntu/Android
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save snapshot')),
          );
        }
      },
    );
  }
}
