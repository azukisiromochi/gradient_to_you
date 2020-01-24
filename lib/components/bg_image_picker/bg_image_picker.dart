import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
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
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text(
          'Gradient to you',
          style: AppThemeUtils.appBarStyle(widget.store.themeNo),
        ),
        backgroundColorStart:
            widget.store.gradientColors.first.withOpacity(0.6),
        backgroundColorEnd: widget.store.gradientColors.last.withOpacity(0.6),
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
        child: Icon(Icons.collections),
      ),
    );
  }
}
