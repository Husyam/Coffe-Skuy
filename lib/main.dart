//@dart=2.9
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:final_projek/home.dart';
import 'package:final_projek/home_1.dart';
import 'package:final_projek/succes.dart';

void main() {
  runApp(MaterialApp(home: CarouselWithIndicatorDemo()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("header aplikasi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text("Text Boddy"),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
