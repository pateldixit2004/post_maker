import 'dart:io';

import 'package:flutter/material.dart';
import 'package:post_maker/Data/Data.dart';
import 'package:post_maker/Screen/instagram.dart';
import 'package:post_maker/Screen/linkdin.dart';
import 'package:post_maker/post/Home_screen/Home_Screen.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home_Screen(),
        'data': (context) => Data(),
        'quotes': (context) => Quotes_Screen_(),
        'instagram': (context) => InstaGram(),

      },
    ),
  );
}