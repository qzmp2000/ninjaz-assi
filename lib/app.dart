import 'package:assignment/ui/home.dart';
import 'package:assignment/utils/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CApp extends StatelessWidget {
  CApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateTitle: (context) {
          return localized()?.appTitle ?? "";
        },
        home: HomeWidget(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false);
  }
}
