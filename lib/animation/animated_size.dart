import 'package:flutter/material.dart';

class AnimatedSizeWidget extends StatefulWidget {
  const AnimatedSizeWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedSize"),
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
                  height: expand ? 100 : 100,
                  color: Colors.amber,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  child: Text(expand ? "expand" : "shrink"))
            ],
          ),
        ),
      ),
    );
  }
}
