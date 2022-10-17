// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _SharedLearnState createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initalize();
  }

  Future<void> _initalize() async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    int? _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                )
              : const SizedBox.shrink(),
        ],
        title: Text(_currentValue.toString()),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          const SizedBox(width: 10.0),
          _removeValueButton(),
        ],
      ),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
      child: const Icon(Icons.remove),
    );
  }
}

//

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
