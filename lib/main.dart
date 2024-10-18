import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacktoberxmlsa_app/providers/userProfile.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';
import 'package:hacktoberxmlsa_app/views/homePage.dart';
import 'package:hacktoberxmlsa_app/views/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (context) => const HomePage(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}
