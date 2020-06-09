import 'package:flutter/material.dart';
import 'package:gradient_to_you/common/app_icon.dart';
import 'package:gradient_to_you/common/app_name.dart';
import 'package:gradient_to_you/common/gradient_container.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return GradientContainer(
      store: store,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                AppIcon(),
                AppName(),
              ],
            ),
            const SizedBox(height: 60),
            _MenuItem(
                icon: Icon(Icons.favorite_border), title: l10n.sideMenuRate),
            const SizedBox(height: 20),
            _MenuItem(icon: Icon(Icons.share), title: l10n.sideMenuShare),
            const SizedBox(height: 20),
            Divider(color: Colors.black45),
            const SizedBox(height: 20),
            _MenuItem(
                icon: Icon(Icons.settings), title: l10n.sideMenuPreferences),
            const SizedBox(height: 20),
            _MenuItem(
                icon: Icon(Icons.mail_outline), title: l10n.sideMenuFeedback),
            const SizedBox(height: 20),
            _MenuItem(
                icon: Icon(Icons.lock_outline),
                title: l10n.sideMenuPrivacyPolicy),
            const SizedBox(height: 20),
            _MenuItem(
              icon: Icon(Icons.copyright),
              title: l10n.sideMenuLicenses,
              onTapCallback: () => showLicensePage(context: context),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    Key key,
    @required this.icon,
    @required this.title,
    this.onTapCallback,
  }) : super(key: key);

  final Icon icon;
  final String title;
  final GestureTapCallback onTapCallback;

  /// @deprecated コンテスト用
  void _showNotAvailableDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('使用を制限しています'),
          content: const Text('コンテスト版には『アプリを評価』などの正式リリース後に使用される機能は実装されていません。'),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback ??
              () {
            _showNotAvailableDialog(context);
          },
      child: Row(
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
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
