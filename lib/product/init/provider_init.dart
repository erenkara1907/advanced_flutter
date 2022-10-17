import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../main.dart';
import '../global/resource_context.dart';
import '../global/theme_notifier.dart';

class ProviderInit {
  List<SingleChildWidget> providers = [];

  Widget multiProvider = MultiProvider(
    providers: [
      Provider<ResourceContext>(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => const MyApp(),
  );
}
