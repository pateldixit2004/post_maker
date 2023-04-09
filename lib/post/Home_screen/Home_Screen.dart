import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Post Maker"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body : Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {

                Navigator.pushNamed(context, 'data');

              }, child: Text("Likidin"),style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),),
              ElevatedButton(onPressed: () {

                Navigator.pushNamed(context, 'instagram');

              }, child: Text("Instagram"),style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),),

            ],
          ),
        )
      ),
    );
  }



}
