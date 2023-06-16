import 'package:animation_overview/animation/animated_align.dart';
import 'package:animation_overview/animation/animated_container.dart';
import 'package:animation_overview/animation/animated_padding.dart';
import 'package:animation_overview/animation/animated_positioned.dart';
import 'package:animation_overview/animation/animated_switcher.dart';
import 'package:flutter/material.dart';

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
        return const AnimatedSwitcherWidget();
      },
    };
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
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("AnimatedContainerWidget");
                  },
                  child: const Text("AnimatedContainer")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("AnimatedPaddingWidget");
                  },
                  child: const Text("AnimatedPadding")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("AnimatedPositionedWidget");
                  },
                  child: const Text("AnimatedPositioned")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("AnimatedAlignWidget");
                  },
                  child: const Text("AnimatedAlign")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("AnimatedSwitcherWidget");
                  },
                  child: const Text("AnimatedSwitcher")),
            ],
          )
        ),
      ),
    );
  }
}