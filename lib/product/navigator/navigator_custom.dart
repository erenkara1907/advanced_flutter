// ignore_for_file: curly_braces_in_flow_control_structures, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/main.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

import '../../303/lottie_learn.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name?.isEmpty ?? true)
      return _navigateToNormal(const LottieLearn());

    final _routes = settings.name == NavigatorRoutes.paraf
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(settings.name!.substring(1));

    switch (_routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(const LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(const NavigateHomeview());
      case NavigateRoutes.detail:
        final _id = settings.arguments;
        return _navigateToNormal(
          NavigateHomeDetailView(id: _id is String ? _id : null),
          isFullScreenDialog: true,
        );
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) => child,
    );
  }
}
