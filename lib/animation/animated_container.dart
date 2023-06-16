import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedContainer"),
      ),
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: isSelected ? Colors.amber : Colors.red,
              borderRadius:
                  BorderRadius.all(Radius.circular(isSelected ? 2 : 30))),
          padding:
              isSelected ? const EdgeInsets.all(10) : const EdgeInsets.all(30),
          width: isSelected ? 100 : 200,
          height: isSelected ? 100 : 200,
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
    );
  }
}
