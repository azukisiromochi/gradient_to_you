import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';
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
  File _image;

  Future getImage() async {
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
      _image = croppedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _themeColor = widget.store.baseTextColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: _themeColor),
        title: Text('Gradient to you',
            style:
                AppThemeUtils.appBarStyle(widget.store.themeNo, _themeColor)),
        backgroundColor: widget.store.baseColor,
      ),
      body: Center(
        child: _image == null
            ? GestureDetector(
                onTap: getImage,
                child: Icon(
                  Icons.collections,
                  color: widget.store.baseColor,
                  size: 100,
                ),
              )
            : Image.file(_image),
      ),
      floatingActionButton: _image == null
          ? null
          : FloatingActionButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/gradient_filter'),
              tooltip: 'select!',
              backgroundColor: widget.store.baseColor,
              child: Icon(Icons.check, color: _themeColor),
            ),
    );
  }
}
