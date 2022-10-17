// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/view/login_view.dart';
import 'package:flutter_full_learn/product/init/product_init.dart';
import 'package:provider/provider.dart';

import '303/lottie_learn.dart';
import 'product/constant/project_items.dart';
import 'product/global/theme_notifier.dart';
import 'product/navigator/navigator_custom.dart';
import 'product/navigator/navigator_manager.dart';

Future<void> main() async {
  final _productInit = ProductInit();

  await _productInit.init();

  runApp(
    EasyLocalization(
      supportedLocales: _productInit.localizationInit.supportedLocales,
      path: _productInit.localizationInit.localizationPath,
      fallbackLocale: _productInit.localizationInit.fallBackLocale,
      child: _productInit.providerInit.multiProvider,
    ),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      theme: context.watch<ThemeNotifier>().currentTheme,
      // initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const LottieLearn());
      },
      // routes: NavigatorRoutes().items,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child ?? const SizedBox.shrink());
      },
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      home: LoginView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
