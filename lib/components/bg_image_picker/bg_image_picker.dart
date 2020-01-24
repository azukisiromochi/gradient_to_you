import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

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

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _themeColor = widget.store.paletteColor.withLightness(0.2).toColor();

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
            ? const Text('No image selected.')
            : Container(
                child: PhotoView(
                imageProvider: FileImage(_image),
              )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        backgroundColor: widget.store.baseColor,
        child: Icon(Icons.collections, color: _themeColor),
      ),
    );
  }
}
