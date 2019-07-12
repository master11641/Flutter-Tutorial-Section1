import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget{
  final String name ;
  MyWidget(this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),      
      alignment: Alignment.center,      
      child: Text(
        '$name',
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 22),
        
        ),
    );
  }

}