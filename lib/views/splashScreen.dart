import 'dart:async';

import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            color: Colors.black,
            child: Center(
              child: Container(
                width: (300/390)*width,
                height: (300/390)*width,
                child: Image.asset('assets/images/mlsaLogo.png',
                fit: BoxFit.fill,
                ),
              ),
            )
        )
    );
  }
}
