import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myapp/Widgets/MyHomePage.dart';
import './Widgets/MyWidget.dart';
import './Widgets/ListSimple.dart';
import './Widgets/Login.dart';
import './Widgets/GetIP.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  var myList = ["ios", "java", "android"];
  @override
  Widget build(BuildContext context) {
    StreamSubscription periodicSub;
    periodicSub = new Stream.periodic(const Duration(milliseconds: 500), (v) => v)
      .take(10)
      .listen((count) => print('tick $count'));
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IRANSansMobile',),
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',          
      home: MyHomePage(title: '',)
    );
     }
}
