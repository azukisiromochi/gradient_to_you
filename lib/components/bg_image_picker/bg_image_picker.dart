import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';

import '../../app_store.dart';
import '../importer.dart';

class BgImagePicker extends StatefulWidget {
  const BgImagePicker({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _BgImagePickerState createState() => _BgImagePickerState();
}

class _BgImagePickerState extends State<BgImagePicker> {
  TutorialCoachMark _tutorial1;
  TutorialCoachMark _tutorial2;

  final List<TargetFocus> _targets1 = [];
  final List<TargetFocus> _targets2 = [];

  final GlobalKey _tutorialKey1 = GlobalKey();
  final GlobalKey _tutorialKey2a = GlobalKey();
  final GlobalKey _tutorialKey2b = GlobalKey();

  final Preferences _prefs = Preferences();

  @override
  void initState() {
    _showTutorial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final background = widget.store.bgImage;
    final themeColor = widget.store.baseTextColor;

    if (background != null && !_prefs.isFinishedTutorial(Screen.imagePicker)) {
      Future.delayed(const Duration(milliseconds: 200), _startTutorial2);
    }

    return WillPopScope(
      onWillPop: () async {
        _tutorial1?.hide();
        _tutorial2?.hide();
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: ColorAppBar(
          store: widget.store,
          actions: <Widget>[
            IconButton(
              key: _tutorialKey2a,
              icon: Icon(Icons.collections, color: themeColor),
              onPressed: () => _getImage(forceUpdate: true),
            ),
          ],
        ),
        body: Center(
          child: background == null
              ? GestureDetector(
                  key: _tutorialKey1,
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
                key: _tutorialKey2b,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Screen.gradientFilter.url),
                tooltip: l10n.tooltipTextSelectImage,
                backgroundColor: widget.store.baseColor,
                child: Icon(Icons.check, color: themeColor),
              ),
      ),
    );
  }

  final _picker = ImagePicker();
  final List<CropAspectRatioPreset> _aspectRatioPresets = const [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9
  ];

  Future _getImage({bool forceUpdate = false}) async {
    if (forceUpdate || widget.store.bgImage == null) {
      final image = await _picker.getImage(source: ImageSource.gallery);
      final croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: _aspectRatioPresets,
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

  void _showTutorial() {
    if (!_prefs.isFinishedTutorial(Screen.imagePicker)) {
      _initTargets1();
      _initTargets2();
      WidgetsBinding.instance.addPostFrameCallback(_afterLayout1);
    }
  }

  void _initTargets1() {
    _targets1.add(TutorialUtils.makeTargetFocus(
      key: _tutorialKey1,
      title: '画像を決めよう！',
      explanation:
          // ignore: lines_longer_than_80_chars
          '端末に保存されている画像の一覧が表示されます。\nお気に入りの画像を選択しよう！',
      align: AlignContent.top,
      shape: ShapeLightFocus.Circle,
    ));
  }

  void _startTutorial1() {
    _tutorial1 = TutorialUtils.makeTutorial(
      context,
      targets: _targets1,
      colorShadow: ColorUtils.hslFromHue240.toColor(),
    )..show();
  }

  void _afterLayout1(dynamic _) {
    Future.delayed(const Duration(milliseconds: 200), _startTutorial1);
  }

  void _initTargets2() {
    _targets2
      ..add(TutorialUtils.makeTargetFocus(
        key: _tutorialKey2a,
        title: '画像を変更する場合',
        explanation:
            // ignore: lines_longer_than_80_chars
            '画像を変更したい場合は、右上のボタンからもう一度画像を選択できるよ！',
        shape: ShapeLightFocus.Circle,
      ))
      ..add(TutorialUtils.makeTargetFocus(
        key: _tutorialKey2b,
        title: '画像を決定！',
        explanation:
            // ignore: lines_longer_than_80_chars
            '画像が決まったらグラデーションを重ねてみよう！',
        align: AlignContent.top,
        shape: ShapeLightFocus.Circle,
      ));
  }

  void _startTutorial2() {
    _tutorial2 = TutorialUtils.makeTutorial(
      context,
      targets: _targets2,
      colorShadow: ColorUtils.hslFromHue270.toColor(),
      finish: () => _prefs.finishTutorial(Screen.imagePicker),
    )..show();
  }
}
