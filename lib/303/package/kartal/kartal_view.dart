import 'package:flutter/material.dart';
import '../../../202/image_learn_202.dart';
import 'package:kartal/kartal.dart';

class KartalView extends StatefulWidget {
  const KartalView({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _KartalViewState createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              context.navigateToPage(const ImageLearn(),
                  type: SlideType.BOTTOM);
            },
            child: Text('Kartal', style: context.textTheme.headline1),
          ),
          Icon(context.isIOSDevice ? Icons.ios_share_outlined : Icons.android),
          AnimatedContainer(
            duration: context.durationLow,
            height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.15),
            color: Colors.red,
          ),
          const TextField(),
          Image.network(''.randomImage),
          InkWell(
            onTap: () {
              'erenkaraaa47@gmail.com'.launchEmail;
              'https://github.com/VB10/Flutter-Full-Learn/issues/3'
                  .launchWebsite;
            },
            child: Text('Eren', style: context.textTheme.headline1),
          ).toDisabled(false),
        ],
      ),
    );
  }
}
