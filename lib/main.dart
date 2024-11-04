import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacktoberxmlsa_app/providers/theme_provider.dart';
import 'package:hacktoberxmlsa_app/providers/userProfile.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';
import 'package:hacktoberxmlsa_app/theme.dart';
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
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
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
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeProvider.currentTheme,
        initialRoute: '/splash',
        routes: {
          '/': (context) => const HomePage(),
          '/splash': (context) => SplashScreen(),
        },
      );
    });
  }
}
