import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_flutter/screens/splash_screen/intro_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with  SingleTickerProviderStateMixin{
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = Duration(seconds: 3);
    return  Timer(_duration, navigationPage);
  }

  void navigationPage() {
    //Navigator.of(context).pushReplacementNamed();
    Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen()));
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Image.network(
                  'https://i.pinimg.com/736x/b3/8a/a1/b38aa1b21050b0e769a97eb751d12829.jpg',
                  height: 25.0,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://i.pinimg.com/736x/b3/8a/a1/b38aa1b21050b0e769a97eb751d12829.jpg',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

