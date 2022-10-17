import 'package:flutter/material.dart';

class LocalizationInit {
  final List<Locale> supportedLocales = [const Locale('en', 'US')];
  final String localizationPath = 'assets/translations';
  final Locale fallBackLocale = const Locale('en', 'US');
}
