import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:package_info/package_info.dart';

class AppName extends StatelessWidget {
  const AppName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Column(
      children: <Widget>[
        Text(
          l10n.appName,
          style: Theme.of(context).textTheme.bodyText1,
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
    );
  }

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return Future.value(packageInfo.version);
  }
}
