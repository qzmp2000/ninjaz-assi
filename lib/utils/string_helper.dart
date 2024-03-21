import 'package:assignment/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations? localized() {
  if (CApp.navigatorKey.currentContext == null) {
    return null;
  }
  return AppLocalizations.of(CApp.navigatorKey.currentContext!);
}
