import 'package:flutter/material.dart';
import 'package:post_maker/Data/Modal_class.dart';

import 'package:stories_editor/stories_editor.dart';

class InstaGram extends StatefulWidget {
  const InstaGram({Key? key}) : super(key: key);

  @override
  State<InstaGram> createState() => _InstaGramState();
}

class _InstaGramState extends State<InstaGram> {
  List<Color> colorList = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.pinkAccent,

    Colors.green,
    Colors.grey,
    Colors.amber,
    Colors.blue,
    Colors.purple,
    Colors.lightGreenAccent,
    Colors.orange,
    Colors.cyanAccent,
    Colors.indigo,
    Colors.yellowAccent
  ];
  List<List<Color>> grediantcolorList=[
    [Colors.pink,Colors.deepPurple],
    [Colors.blue,Colors.amber],
    [Colors.white,Colors.grey],
    [Colors.deepPurple,Colors.blue],
    [Colors.black,Colors.teal],
    [Colors.red,Colors.pinkAccent],
    [Colors.indigo,Colors.purple],
    [Colors.grey,Colors.black],
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: StoriesEditor(
              giphyKey: 'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
              onDone:(p0) {
              },
            colorList: colorList ,
            gradientColors: grediantcolorList,
          )
      ),
    );
  }
}
