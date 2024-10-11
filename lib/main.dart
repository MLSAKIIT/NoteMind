import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';
import 'package:hacktoberxmlsa_app/views/homePage.dart';
import 'package:hacktoberxmlsa_app/views/splashScreen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final ThemeData systemDarkTheme = ThemeData.dark();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: systemDarkTheme.copyWith(
          primaryColor: primaryColorDark,
      ),
      initialRoute: '/splash',
      routes: {
        '/':(context) => const HomePage(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}