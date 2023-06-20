import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/material.dart';

class ColorTweenWidget extends BasefulWidget {
  ColorTweenWidget(super.title, {super.key});

  @override
  State<ColorTweenWidget> createState() => _ColorTweenWidgetState();
}

class _ColorTweenWidgetState extends State<ColorTweenWidget> {
  late ColorTween colorTween;
  late ScrollController controller;
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    colorTween = ColorTween(begin: Colors.blue, end: Colors.amber);
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        print("controller.offset ${controller.offset}");
        scrollOffset = controller.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTween.transform(scrollOffset / 200),
      ),
      body: ListView.builder(
        controller: controller,
        itemBuilder: _itemBuilder,
        itemCount: 100,
      ),
    );
  }

  Widget? _itemBuilder(BuildContext context, int index) {
    return Text(
      "$index",
      style: const TextStyle(fontSize: 50),
    );
  }
}
