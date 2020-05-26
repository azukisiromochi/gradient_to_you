import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app_store.dart';

class SaveOrShare extends StatelessWidget {
  const SaveOrShare({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _save(String msg, String appName) async {
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    final picturesPath = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_PICTURES);
    final dirPath = '$picturesPath/$appName';
    await Directory(dirPath).create(recursive: true);

    final filePath = '$dirPath/g2u_${timestamp()}.jpg';
    await File(filePath).writeAsBytes(store.pngImage.buffer.asUint8List());

    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 3,
      backgroundColor: Colors.black12,
      textColor: Colors.black,
      fontSize: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final pngBytes = store.pngImage.buffer.asUint8List();

    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text(
          l10n.appName,
          style: AppThemeUtils.appBarStyle(store.themeNo),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColorStart: store.gradientColors.first.withOpacity(0.6),
        backgroundColorEnd: store.gradientColors.last.withOpacity(0.6),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.memory(pngBytes),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            title: Text(l10n.buttonSave),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            title: Text(l10n.buttonShare),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              {
                _save(l10n.toastSave, l10n.appName);
              }
              break;

            case 1:
              {
                Share.file(l10n.appName, 'g2u_${timestamp()}.jpg', pngBytes,
                    'image/jpg');
              }
              break;

            default:
              {}
              break;
          }
        },
      ),
    );
  }
}
