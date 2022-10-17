import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/init/localization_init.dart';
import 'package:flutter_full_learn/product/init/provider_init.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();
  final ProviderInit providerInit = ProviderInit();

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
