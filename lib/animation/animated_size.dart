import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/material.dart';

class AnimatedSizeWidget extends BasefulWidget {
  AnimatedSizeWidget(super.title, {super.key});


  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  double _size = 50.0;
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSize(
                curve: Curves.bounceIn,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: _size,
                  height: _size,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _size = _large ? 250.0 : 100.0;
                      _large = !_large;
                    });
                  },
                  child: Text("expand"))
            ],
          ),
        ),
      ),
    );
  }
}
