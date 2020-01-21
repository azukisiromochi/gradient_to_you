import 'dart:async' show Future;
import 'package:gradient_to_you/app_theme_store.dart';
import '../importer.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = AppThemeStore();

    Future<void>.delayed(const Duration(seconds: 3)).then(
        (_) => {Navigator.of(context).pushReplacementNamed('/color_palette')});

    return Scaffold(
      body: FutureBuilder<int>(
        future: store.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // data loaded:
            return Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: store.splashImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
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
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Gradient to you',
                    style: store.logoStyle,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
