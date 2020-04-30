import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:package_info/package_info.dart';

import '../../app_store.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo.version);
    return Future.value(packageInfo.version);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: store.gradientColors,
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/icon/icon.png'),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      l10n.appName,
                      style: Theme.of(context).textTheme.body1,
                    ),
                    FutureBuilder(
                      future: _getAppVersion(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data,
                            style: Theme.of(context).textTheme.caption,
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 60),
            _MenuItem(icon: Icon(Icons.favorite_border), title: 'アプリを評価'),
            const SizedBox(height: 20),
            _MenuItem(icon: Icon(Icons.share), title: 'アプリを共有'),
            const SizedBox(height: 20),
            Divider(color: Colors.black45),
            const SizedBox(height: 20),
            _MenuItem(icon: Icon(Icons.settings), title: '設定'),
            const SizedBox(height: 20),
            _MenuItem(icon: Icon(Icons.mail_outline), title: 'フィードバック'),
            const SizedBox(height: 20),
            _MenuItem(icon: Icon(Icons.lock_outline), title: 'プライバシーポリシー'),
            const SizedBox(height: 20),
            _MenuItem(icon: Icon(Icons.copyright), title: 'ライセンス'),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({Key key, @required this.icon, @required this.title})
      : super(key: key);

  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: icon,
        ),
        Expanded(
          flex: 4,
          child: Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ),
      ],
    );
  }
}
