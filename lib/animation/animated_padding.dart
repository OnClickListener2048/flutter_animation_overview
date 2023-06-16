import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingWidget> createState() =>
      _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedPadding"),
      ),
      body: Center(
        child: Container(
          color: Colors.amber,
          child: AnimatedPadding(
            padding: isSelected ? const EdgeInsets.all(10) : const EdgeInsets.all(30),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: const Text("AnimatedContainer"),
            ),
          ),
        ),
      ),
    );
  }
}
