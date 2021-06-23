import 'package:easy_localization/easy_localization.dart';
import 'package:example1/Home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('de', ''), Locale('en', '')],
      path:
          'assets/translations', // <-- change the path of the translation files
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
      theme: appTheme(),
      darkTheme: darkTheme(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale('en', ''),
    );
  }

  ThemeData appTheme() {
    ThemeData theme = ThemeData.light();
    return theme.copyWith(
      primaryColor: Colors.amber,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
      iconTheme: IconThemeData(color: Colors.indigo, size: 42),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 24,
            color: Colors.grey.shade200,
          ),
        ),
        titleSpacing: 2,
      ),
    );
  }

  ThemeData darkTheme() {
    ThemeData theme = ThemeData.light();
    return theme.copyWith(
      primaryColor: Colors.black,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber, foregroundColor: Colors.blue),
      iconTheme: IconThemeData(color: Colors.indigo, size: 32),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 24,
            color: Colors.grey.shade200,
          ),
        ),
        titleSpacing: 2,
      ),
    );
  }
}
