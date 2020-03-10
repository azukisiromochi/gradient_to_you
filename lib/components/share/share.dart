import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app_store.dart';

class Share extends StatelessWidget {
  const Share({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _save() async {
    final buffer = store.pngImage.buffer;

    final permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    print(permissions);

    final picturesPath = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_PICTURES);
    final dirPath = '$picturesPath/gradient2u';
    await Directory(dirPath).create(recursive: true);
    final filePath = '$dirPath/${timestamp()}.png';

    print(filePath);

    await File(filePath).writeAsBytes(buffer.asUint8List());
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            title: new Text("Save device"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            title: new Text("Share"),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              {
                _save();
              }
              break;

            case 1:
              {}
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
