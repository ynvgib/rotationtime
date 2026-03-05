import 'package:window_manager/window_manager.dart';
import 'package:finallyicanlearn/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

bool _isFullScreen = false;
int userDefinedSeconds = 640;
Timer? forceResetTimer;

void toggleFullScreen() async {
  _isFullScreen = !_isFullScreen;
  await windowManager.setFullScreen(_isFullScreen); // The L5 Transition
}

// L3: Breath, - Pass 'seconds' as a parameter from the user's choice
void showResetAlert(BuildContext context, int seconds) {
  // L1: idk (Black) - The "Aha;" Fix: If it's 0 (Off), we remain silent.
  if (seconds == 0) return;

  // Cancel any existing 'Breath' before starting a new rotation
  forceResetTimer?.cancel();

  // L4: Simple; - Use the dynamic Duration instead of hard-coded 30
  forceResetTimer = Timer(Duration(seconds: seconds), () {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
    hibernateEngine();
  });

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      title: const Text('Reset אתחול'),
      content:
          Text("אתחול מתבצע בעוד $seconds שניות\nReset in $seconds seconds"),
      actions: [
        TextButton(
          onPressed: () {
            forceResetTimer?.cancel();
            Navigator.of(ctx).pop();
          },
          child: const Text("X"),
        ),
      ],
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey mainStateKey = GlobalKey();

void hibernateEngine() {
  // We use the 'navigatorKey' to sail back to the Home Screen
  navigatorKey.currentState?.pushNamedAndRemoveUntil('/', (route) => false);

  print("The White Camel has returned to the 'silence.' of the Beginning.");
}

// L3: Breath, - The Global Listener for every screen 'Rotation'
// L3: Breath, - The Global Listener in your helpers
class MyRouteObserver extends NavigatorObserver {
  // A 'Simple;' callback to notify the UI
  final VoidCallback onNavigation;

  MyRouteObserver({required this.onNavigation});

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    onNavigation(); // Triggers the reset in main.dart
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    onNavigation(); // Triggers the reset when going back
  }
}
