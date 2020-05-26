import 'package:flutter/material.dart';
import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_store.dart';

class BgImagePicker extends StatefulWidget {
  const BgImagePicker({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _BgImagePickerState createState() => _BgImagePickerState();
}

class _BgImagePickerState extends State<BgImagePicker> {
  Future _getImage({bool forceUpdate = false}) async {
    if (forceUpdate || widget.store.bgImage == null) {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      final croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: widget.store.baseColor,
            toolbarWidgetColor: widget.store.baseTextColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1,
        ),
      );

      setState(() {
        widget.store.setBgImage(croppedFile, MediaQuery.of(context).size);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final background = widget.store.bgImage;
    final themeColor = widget.store.baseTextColor;

    return Scaffold(
      appBar: ColorAppBar(
        store: widget.store,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.collections, color: themeColor),
            onPressed: () => _getImage(forceUpdate: true),
          ),
        ],
      ),
      body: Center(
        child: background == null
            ? GestureDetector(
                onTap: _getImage,
                child: Icon(
                  Icons.collections,
                  color: widget.store.baseColor,
                  size: 100,
                ),
              )
            : ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 400,
                ),
                child: Image.file(background),
              ),
      ),
      floatingActionButton: background == null
          ? null
          : FloatingActionButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/gradient_filter'),
              tooltip: l10n.tooltipTextSelectImage,
              backgroundColor: widget.store.baseColor,
              child: Icon(Icons.check, color: themeColor),
            ),
    );
  }
}
