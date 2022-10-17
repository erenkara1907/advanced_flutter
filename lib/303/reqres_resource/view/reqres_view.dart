import 'package:flutter/material.dart';
import '../../../202/image_learn_202.dart';
import '../service/reqres_service.dart';
import '../viewModel/reqres_provider.dart';
import '../../../product/extension/string_extension.dart';
import '../../../product/global/resource_context.dart';
import '../../../product/global/theme_notifier.dart';
import '../../../product/service/project_dio_mixin.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _ReqresViewState createState() => _ReqresViewState();
}

// class _ReqresViewState extends ReqResViewModel {
class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading
                ? const CircularProgressIndicator.adaptive()
                : null,
            actions: const [
              _SaveAndNavigateWidget(),
            ],
          ),
          body: Column(
            children: [
              const _TempPlaceholder(),
              Expanded(
                child: _resourceListView(
                  context,
                  context.watch<ReqresProvider>().resources,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: Text(items[index].name ?? ''),
        );
      },
    );
  }
}

class _SaveAndNavigateWidget extends StatelessWidget {
  const _SaveAndNavigateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<ReqresProvider>()
              .saveToLocale(context.read<ResourceContext>());
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ImageLearn()));
        },
        icon: const Icon(Icons.add));
  }
}

class _TempPlaceholder extends StatelessWidget {
  const _TempPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(
      builder: (context, value, child) {
        return value ? const Placeholder() : const Text('data');
      },
      selector: (context, provider) {
        return provider.isLoading;
      },
    );
  }
}
