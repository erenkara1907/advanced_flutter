import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoading extends StatelessWidget {
  const LottieLoading({Key? key}) : super(key: key);
  final _loadingLottie =
      'https://assets2.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_loadingLottie),
    );
  }
}

class _LottieSpecial {
  
}