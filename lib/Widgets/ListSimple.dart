import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleList extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SimpleList> {
  var myList = ["علیرضا کیانی مقدم", "مریم رمضانی", "مهدی کیانی مقدم"];
  var style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black38,
      fontFamily: "IRANSansMobile");
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('لیست ساده'),
      ),
      body: new Container(
        
        child: new ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {       
            return Card(
              child: Container(
                alignment: Alignment.topRight,
                child: Row(
                  children: <Widget>[
                    Padding(
                      child: Text(
                        myList[index],
                        textDirection: TextDirection.rtl,
                        style: style,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                    )
                  ],
                  textDirection: TextDirection.rtl,
                ),
              ),
              elevation: 5,
            );
          },
        ),
      ),
    ));
  }
}
