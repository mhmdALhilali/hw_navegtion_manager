import 'package:flutter/material.dart';

class HilaliRouter {
  static final GlobalKey<NavigatorState> navigatorKey = 
      GlobalKey<NavigatorState>();

  static Future<T?> navigateTo<T>(Widget page, 
      {Object? arguments, bool fullscreenDialog = false}) async {
    return await navigatorKey.currentState?.push<T>(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve)
          );
          
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(arguments: arguments),
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  static Future<T?> replaceWith<T>(Widget page, {Object? arguments}) async {
    return await navigatorKey.currentState?.pushReplacement<T, T>(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: arguments),
      ),
    );
  }

  static Future<T?> navigateAndRemoveUntil<T>(Widget page, {Object? arguments}) async {
    return await navigatorKey.currentState?.pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: arguments),
      ),
      (_) => false,
    );
  }

  static void goBack<T>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
  }

  static BuildContext? get currentContext {
    return navigatorKey.currentState?.context;
  }
}




