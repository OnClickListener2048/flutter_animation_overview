import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedSwitcher"),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: buildTransition,
              layoutBuilder: buildLayout,
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: Text(
                "$a",
                key: UniqueKey(),
                style: TextStyle(fontSize: 30),
              ),
              // layoutBuilder: (Widget? currentChild, List<Widget> previousChildren){
              //   return currentChild?? ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         isSelected = !isSelected;
              //       });
              //     },
              //
              //     child: const Text("AnimatedSwitcher"),
              //   );
              // },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                var nextInt = Random(1000);
                setState(() {
                  a = ++a;
                });
              },
              child: Text("change"))
        ],
      ),
    );
  }

  Widget buildTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,)
              .animate(animation),
          child: child,
        ),
      ),
    );
  }

  Widget buildLayout(Widget? currentChild, List<Widget> previousChildren) {
    return Container(
      color: Colors.amber,
      child: Row(
        children: [

          if (currentChild != null) currentChild,
          ...previousChildren,
        ],
      ),
    );
  }
}
