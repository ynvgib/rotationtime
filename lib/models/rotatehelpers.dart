import 'package:window_manager/window_manager.dart';
import 'package:finallyicanlearn/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

bool _isFullScreen = false;

void toggleFullScreen() async {
  _isFullScreen = !_isFullScreen;
  await windowManager.setFullScreen(_isFullScreen); // The L5 Transition
}

Timer? forceResetTimer;
void showResetAlert(BuildContext context) {
  // 58. (Time shall Neglect Aliveness) - The final warning

  // Start the final countdown to the 64. Completion
  forceResetTimer = Timer(const Duration(seconds: 30), () {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop(); // Close the alert
    }
    hibernateEngine(context); // 0. Final Landing in RotateMain
  });

  showDialog(
    context: context,
    barrierDismissible: false, // User must choose or wait for the Camel to land
    builder: (ctx) => AlertDialog(
      title: const Text('Reset אתחול'),
      content: const Text("אתחול מתבצע Reset in Progress"),
      actions: [
        TextButton(
          onPressed: () {
            forceResetTimer?.cancel(); // Cancel the death of the state
            Navigator.of(ctx).pop();
          },
          child: const Text("X"),
        ),
      ],
    ),
  );
}

void hibernateEngine(BuildContext context) {
  // 58. Neglecting Aliveness
  // print("zmansi.WHITE@CAMEL.bob triggers a restart.");

  // The 'Simple;' way to restart a Flutter app to the Home Screen
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const RotateMain()),
    (Route<dynamic> route) => false,
  );
}
