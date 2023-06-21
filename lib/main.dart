import 'package:animation_overview/animation/animated_align.dart';
import 'package:animation_overview/animation/animated_container.dart';
import 'package:animation_overview/animation/animated_listView.dart';
import 'package:animation_overview/animation/animated_opacity.dart';
import 'package:animation_overview/animation/animated_padding.dart';
import 'package:animation_overview/animation/animated_positioned.dart';
import 'package:animation_overview/animation/animated_rotation.dart';
import 'package:animation_overview/animation/animated_scale.dart';
import 'package:animation_overview/animation/animated_size.dart';
import 'package:animation_overview/animation/animated_slide.dart';
import 'package:animation_overview/animation/animated_switcher.dart';
import 'package:animation_overview/tween/color_tween.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoute() {
  return {
    "/": (BuildContext context) {
      return const MyHomePage(title: 'Animation Overview');
    },
    "AnimatedContainerWidget": (BuildContext context) {
      return const AnimatedContainerWidget();
    },
    "AnimatedPaddingWidget": (BuildContext context) {
      return const AnimatedPaddingWidget();
    },
    "AnimatedPositionedWidget": (BuildContext context) {
      return const AnimatedPositionedWidget();
    },
    "AnimatedAlignWidget": (BuildContext context) {
      return const AnimatedAlignWidget();
    },
    "AnimatedSwitcherWidget": (BuildContext context) {
      return AnimatedSwitcherWidget("AnimatedSwitcherWidget");
    },
    "AnimatedSlideWidget": (BuildContext context) {
      return AnimatedSlideWidget("AnimatedSlideWidget");
    },
    "AnimatedSizeWidget": (BuildContext context) {
      return AnimatedSizeWidget("AnimatedSizeWidget");
    },
    "AnimatedOpacityWidget": (BuildContext context) {
      return AnimatedOpacityWidget("AnimatedOpacityWidget");
    },
    "AnimatedRotationWidget": (BuildContext context) {
      return AnimatedRotationWidget("AnimatedRotationWidget");
    },
    "AnimatedScaleWidget": (BuildContext context) {
      return AnimatedScaleWidget("AnimatedScaleWidget");
    },
    "ColorTweenWidget": (BuildContext context) {
      return ColorTweenWidget("ColorTweenWidget");
    },
    "AnimatedListViewWidget": (BuildContext context) {
      return AnimatedListViewWidget("AnimatedListView");
    },
  };
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Overview',
      routes: getRoute(),
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: getRoute()
              .keys
              .skip(1)
              .map(
                (e) => ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(e);
                    },
                    child: Text(e)),
              )
              .toList(),
        )),
      ),
    );
  }
}
