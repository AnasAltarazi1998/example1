// import 'package:example1/Consts.dart';
// import 'package:example1/Gallery.dart';
// import 'package:example1/Home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         "/home": (_) => Home(),
//         "/gallery": (_) => Gallery(),
//       },
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }
import 'package:example1/Gallery.dart';
import 'package:example1/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/home': (_) => Home(), '/gallery': (_) => Gallery()},
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: _buildShrineTheme(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  bool b = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banners'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (b)
            MaterialBanner(
              content: const Text('Error message text'),
              leading: CircleAvatar(child: Icon(Icons.delete)),
              actions: [
                TextButton(
                  child: const Text('ACTION 1'),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('ACTION 2'),
                  onPressed: () {},
                ),
              ],
            ),
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Text('text'),
          )
        ],
      ),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    primaryColorLight: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    errorColor: shrineErrorRed,
    buttonTheme: ButtonThemeData(
      colorScheme: _shrineColorScheme.copyWith(primary: shrinePink400),
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
