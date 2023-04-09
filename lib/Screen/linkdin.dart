import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:post_maker/Data/Modal_class.dart';

class Quotes_Screen_ extends StatefulWidget {
  const Quotes_Screen_({Key? key}) : super(key: key);

  @override
  State<Quotes_Screen_> createState() => _Quotes_Screen_State();
}

class _Quotes_Screen_State extends State<Quotes_Screen_> {
  GlobalKey golbalKey = GlobalKey();

  List<Color> c = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    DataModal d1 = ModalRoute.of(context)!.settings.arguments as DataModal;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Linkdin"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () async {
                    RenderRepaintBoundary? renderBoundry =
                        golbalKey.currentContext!.findRenderObject()
                            as RenderRepaintBoundary;
                    var image = await renderBoundry.toImage();
                    var byteData =
                        await image.toByteData(format: ImageByteFormat.png);
                    Uint8List uint8List = byteData!.buffer.asUint8List();
                    await ImageGallerySaver.saveImage(uint8List);
                  },
                  icon: Icon(Icons.download))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                RepaintBoundary(
                  key: golbalKey,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 500,
                          width: 400,
                          color: Colors.blue,
                          child: Center(
                            child: Row(
                              children: [
                                Container(
                                    height: 180,
                                    width: 180,
                                    color: Colors.green,
                                    child: Column(
                                      children: [
                                        d1.image== null ?

                                        CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/image/a.jpg"),):
                                        CircleAvatar(radius: 60,backgroundImage: FileImage(File("${d1.image}")),) ,


                                        Text(
                                          "${d1.tagLine}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Container(
                                  height: 180,
                                  width: 180,
                                  color: Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                            text: 'Name=',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 10),
                                            children: [
                                              TextSpan(
                                                  text: "${d1.name}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15)),
                                            ]),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                            text: 'Qulification=',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 10),
                                            children: [
                                              TextSpan(
                                                  text: "${d1.qulifaction}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15)),
                                            ]),
                                      ),
                                      SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                            text: 'No=',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 10),
                                            children: [
                                              TextSpan(
                                                  text: "${d1.no}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15)),
                                            ]),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Align(child: ListView.builder(itemBuilder: (context, index) {
                //   return fle(c[index]);
                // },itemCount: c.length,))
              ],
            ),
          )),
    );
  }

// Widget fle(Color c, {Color? c1})
// {
//
//   return Container(height: 20,width: 20,color: c1,);
// }
//
}
