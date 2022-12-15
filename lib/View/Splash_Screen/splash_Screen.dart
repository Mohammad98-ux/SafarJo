import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:safar/lib_orgnaizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset('assets/images/logo.png'),
          ),
          // CircularProgressIndicator(),
          SpinKitDoubleBounce(
            color: Colors.green,
            size: 50.0,
          ),
          SizedBox(height: 5,),
          Expanded(
            flex: 1,
            child: AnimatedSplashScreen.withScreenFunction(
              splash: 'assets/images/logo.png',
              splashIconSize: 0,
              backgroundColor: Colors.black,
              screenFunction: () async {
                var loginState = Prefs.getBooleanValue('loginState') ?? false;
                await delay();
                if (loginState) {
                  return Jordan();
                } else {
                  return Login();
                }
              },
              splashTransition: SplashTransition.fadeTransition,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> delay() async {
  Future.delayed(Duration(seconds: 5));
}