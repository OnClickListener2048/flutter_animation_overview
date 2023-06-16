import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/material.dart';

class AnimatedSizeWidget extends BasefulWidget {
  AnimatedSizeWidget(super.title, {super.key});


  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  bool expand = false;

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
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: expand ? 200 : 100,
                  height: expand ? 200 : 100,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  child: Text(expand ? "shrink" : "expand"))
            ],
          ),
        ),
      ),
    );
  }
}
