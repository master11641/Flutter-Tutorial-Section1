import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarouselList extends StatefulWidget {
  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  var myList = ["علیرضا کیانی مقدم", "مریم رمضانی", "مهدی کیانی مقدم"];
  var style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black38,
      fontFamily: "IRANSansMobile");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('لیست چرخشی'),
        ),
        body: new Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.topRight,
                
                child: Row(
                  children: <Widget>[
                    Padding(
                      // child: Text(
                      //   'myList[index]',
                      //   textDirection: TextDirection.rtl,
                      //   style: style,
                      // ),
                      child: Image.asset('assets/images/user.png'),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                    )
                  ],
                  textDirection: TextDirection.rtl,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
