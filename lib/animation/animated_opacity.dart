import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends BasefulWidget {
  AnimatedOpacityWidget(super.title, {super.key});

  @override
  State<AnimatedOpacityWidget> createState() => AnimatedOpacityState();
}

class AnimatedOpacityState extends State<AnimatedOpacityWidget> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(size: 100,),
            ),
            ElevatedButton(
              onPressed: _changeOpacity,
              child: const Text('Fade Logo'),
            ),
          ],
        ),
      ),
    );
  }
}