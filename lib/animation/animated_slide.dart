import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/material.dart';

class AnimatedSlideWidget extends BasefulWidget {
   AnimatedSlideWidget(super.title, {super.key});


  @override
  State<AnimatedSlideWidget> createState() => _AnimatedSlideWidgetState();
}

class _AnimatedSlideWidgetState extends State<AnimatedSlideWidget> {
  bool isSelected = false;

  Offset offset =  Offset.zero;

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
      ),
      body:  Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSlide(
                offset: offset,
                duration: const Duration(milliseconds: 500),
                child:  Text(widget.title),
              ),
              ElevatedButton(onPressed: (){
                setState(() {

                  offset =  const Offset(1.0, 1.0);
                });
              }, child: const Text("slide"))
            ],
          ),
        ),
      ),
    );
  }
}
