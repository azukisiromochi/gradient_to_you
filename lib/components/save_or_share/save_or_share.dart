import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_to_you/common/my_gradient_app_bar.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app_store.dart';
import '../importer.dart';

class SaveOrShare extends StatelessWidget {
  const SaveOrShare({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final pngBytes = store.pngImage.buffer.asUint8List();

    TutorialCoachMark tutorial;
    const tutorialKey1 = GlobalObjectKey<FormState>('__TUTORIAL1__');
    const tutorialKey2 = GlobalObjectKey<FormState>('__TUTORIAL2__');
    final targets = <TargetFocus>[];
    final prefs = Preferences();

    if (!prefs.isFinishedTutorial(Screen.saveOrShare)) {
      _initTargets(tutorialKey1, tutorialKey2, targets: targets);
      Future.delayed(
        const Duration(milliseconds: 200),
        () => tutorial = _startTutorial(context, targets, prefs),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        tutorial?.hide();
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: MyGradientAppBar(
          store: store,
          appName: l10n.appName,
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
              icon: Icon(Icons.save_alt, key: tutorialKey1),
              title: Text(l10n.buttonSave),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share, key: tutorialKey2),
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
      ),
    );
  }

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

  void _initTargets(GlobalObjectKey tutorialKey1, GlobalObjectKey tutorialKey2,
      {List<TargetFocus> targets}) {
    targets
      ..add(TutorialUtils.makeTargetFocus(
        key: tutorialKey1,
        title: 'おめでとうございます！',
        explanation:
            // ignore: lines_longer_than_80_chars
            'デバイスに保存したい場合はこちらのボタンから',
        align: AlignContent.top,
        shape: ShapeLightFocus.Circle,
      ))
      ..add(TutorialUtils.makeTargetFocus(
        key: tutorialKey2,
        title: 'おめでとうございます！',
        explanation:
            // ignore: lines_longer_than_80_chars
            'シェアしたい場合はこちらのボタンから',
        align: AlignContent.top,
        shape: ShapeLightFocus.Circle,
      ));
  }

  TutorialCoachMark _startTutorial(
      BuildContext context, List<TargetFocus> targets, Preferences prefs) {
    return TutorialUtils.makeTutorial(
      context,
      targets: targets,
      colorShadow: ColorUtils.hslFromHue120.toColor(),
      finish: () => prefs.finishTutorial(Screen.saveOrShare),
    )..show();
  }
}
