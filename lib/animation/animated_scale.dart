import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedScaleWidget extends BasefulWidget {
  AnimatedScaleWidget(super.title, {super.key});

  @override
  State<AnimatedScaleWidget> createState() => AnimatedScaleState();
}

class AnimatedScaleState extends State<AnimatedScaleWidget> {
  double scale = 1.0;

  void _changeScale() {
    setState(() => scale = scale == 1.0 ? 3.0 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _changeScale,
              child: const Text('Scale Logo'),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedScale(
                scale: scale,
                curve: Curves.easeInOutQuart,
                duration: const Duration(seconds: 1),
                child: const FlutterLogo(size: 100,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}