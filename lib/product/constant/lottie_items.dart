enum LottieItems { themeChange, imageUpload }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChange:
        return 'theme_change';
      case LottieItems.imageUpload:
        return 'image_upload';
    }
  }

  String get lottiePath => 'assets/lottie/lottie_${_path()}.json';
}
