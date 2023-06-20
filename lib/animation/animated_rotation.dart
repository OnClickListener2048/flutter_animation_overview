import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/material.dart';

class AnimatedRotationWidget extends BasefulWidget {
   AnimatedRotationWidget(super.title, {super.key});

  @override
  State<AnimatedRotationWidget> createState() => AnimatedRotationState();
}

class AnimatedRotationState extends State<AnimatedRotationWidget> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: _changeRotation,
            child: const Text('Rotate Logo'),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(milliseconds: 300),
              child: const FlutterLogo(size: 100,),
            ),
          ),
        ],
      ),
    );
  }
}