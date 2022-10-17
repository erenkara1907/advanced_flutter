import 'package:flutter/material.dart';
import '../viewModel/image_upload_view_model.dart';
import '../../../product/constant/lottie_items.dart';
import '../../../product/utility/image_upload_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class MobxImageUploadView extends StatefulWidget {
  const MobxImageUploadView({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _MobxImageUploadViewState createState() => _MobxImageUploadViewState();
}

class _MobxImageUploadViewState extends State<MobxImageUploadView>
    with ImageUploadManager {
  final _imageUploadViewModel = ImageUploadViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _imageUploadViewModel.saveDateToService();
        },
        child: const Icon(Icons.save),
      ),
      appBar: AppBar(
        title: const Text('Image Upload'),
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModel.isLoading
                ? const CircularProgressIndicator.adaptive()
                : const SizedBox.shrink();
          }),
          Observer(builder: (_) {
            return Text(_imageUploadViewModel.downloadText);
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 10.0,
              child: Row(
                children: [
                  Expanded(
                    child: _localImage(),
                  ),
                  Expanded(
                    child: _imageUploadButton(),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 4,
            child: _imageNetwork(),
          ),
        ],
      ),
    );
  }

  Observer _localImage() {
    return Observer(
      builder: (context) {
        return _imageUploadViewModel.file != null
            ? Image.file(_imageUploadViewModel.file!)
            : const SizedBox.shrink();
      },
    );
  }

  FittedBox _imageUploadButton() {
    return FittedBox(
      child: IconButton(
        onPressed: () async {
          _imageUploadViewModel.saveLocalFile(await getFromLibrary());
        },
        icon: Lottie.asset(LottieItems.imageUpload.lottiePath),
      ),
    );
  }

  Observer _imageNetwork() {
    return Observer(builder: (_) {
      return _imageUploadViewModel.imageUrl.isNotEmpty
          ? Image.network(_imageUploadViewModel.imageUrl)
          : const SizedBox.shrink();
    });
  }
}
