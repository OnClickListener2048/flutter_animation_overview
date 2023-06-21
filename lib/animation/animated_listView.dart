import 'package:animation_overview/BasefulWidget.dart';
import 'package:flutter/material.dart';

class AnimatedListViewWidget extends BasefulWidget {
  AnimatedListViewWidget(super.title, {super.key});

  @override
  State<AnimatedListViewWidget> createState() => AnimatedListViewWidgetState();
}

class AnimatedListViewWidgetState extends State<AnimatedListViewWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<int> _list;

  @override
  void initState() {
    super.initState();
    _list = [1, 2, 3];
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 1))
                .animate(animation),
        child: Text(
          "${_list[index]}",
          style: const TextStyle(fontSize: 50),
        ));
  }

  void _insert() {
    var i = (_list.last+1);
    _list.add(i);
    _listKey.currentState?.insertItem(_list.length-1);
  }

  void _remove() {
    var removeLast = _list.removeLast();
    _listKey.currentState?.removeItem(
        _list.length+1,
        (context, animation) => FadeTransition(
            opacity: animation,
            child:  Text(
              "$removeLast",
              style: const TextStyle(fontSize: 50),
            )));
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedList'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'insert a new item',
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: _remove,
              tooltip: 'remove the selected item',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedList(
            padding: EdgeInsets.zero,
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }
}
