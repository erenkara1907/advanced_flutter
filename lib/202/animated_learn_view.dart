import 'package:flutter/material.dart';

const double kZero = 0.0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _AnimatedLearnViewState createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: _DurationUtility.durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;

  late AnimationController controller;
  void changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeholderWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeVisible();
        controller.animateTo(_isVisible ? 1 : 0);
      }),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              opacity: _isOpacity ? 0.0 : 1.0,
              duration: _DurationUtility.durationLow,
              child: const Text('data'),
            ),
            trailing: IconButton(
              onPressed: changeOpacity,
              icon: const Icon(Icons.person),
            ),
          ),
          AnimatedDefaultTextStyle(
            style: (_isVisible
                    ? context.textTheme().headline1
                    : context.textTheme().subtitle1) ??
                const TextStyle(),
            duration: _DurationUtility.durationLow,
            child: const Text('Eren'),
          ),
          AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
          AnimatedContainer(
            duration: _DurationUtility.durationLow,
            height:
                _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            color: Colors.blue,
            margin: const EdgeInsets.all(10.0),
          ),
          Expanded(
            child: Stack(
              children: const [
                AnimatedPositioned(
                  top: 30.0,
                  duration: _DurationUtility.durationLow,
                  child: Text('data'),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedList(itemBuilder: (context, index, animation) {
              return const Text('data');
            }),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeholderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationUtility.durationLow,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationUtility {
  static const Duration durationLow = Duration(seconds: 1);
}
