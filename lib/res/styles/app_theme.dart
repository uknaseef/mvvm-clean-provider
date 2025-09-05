import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor: Colors.black,
    highlightColor: Colors.white.withAlpha(8),
    splashColor: Colors.white.withAlpha(15),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black38),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          allowEnterRouteSnapshotting: false,
        ),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(
          allowEnterRouteSnapshotting: false,
        ),
      },
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: null,
      systemOverlayStyle:
          Platform.isIOS
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  );

  static Color get barrierColor => Colors.black.withAlpha(128);
}
