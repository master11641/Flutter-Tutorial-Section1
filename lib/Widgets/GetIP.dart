import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:progress_hud/progress_hud.dart';

class GetIp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatefulWidget();
  }
}

class _StatefulWidget extends State<GetIp> {
  ProgressHUD _progressHUD;
  String ip = "";
  @override
  void initState() {
    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      loading: false,
      text: 'Loading...',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'گرفتن آی پی از سرور',
      home: Scaffold(
        appBar: AppBar(
          title: Text('گرفتن آی پی از سرور',style: TextStyle(fontFamily: 'IRANSansMobile'),),
          actions: <Widget>[
            
          ],
        ),
        body: Stack(
          children: <Widget>[
            _progressHUD,
            Column(
             // mainAxisAlignment: MainAxisAlignment.center,               
              crossAxisAlignment: CrossAxisAlignment.center,           
              children: <Widget>[      
                SizedBox(height: 20,)    , 
                Center(child:Text("$ip",style: TextStyle(color: Color(0xFFf67280),fontFamily: 'IRANSansMobile'),) ,)  ,            
                SizedBox(height: 20,)    , 
                Material(
                  color: Color(0xFFf67280),
                  shadowColor: Colors.redAccent,
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(20.0),
                  
                  child:     MaterialButton(
                    minWidth: 200,
                  child: Text('Get IP'),
                  onPressed: () async {
                    _progressHUD.state.show();
                    Map map = await getIp();
                    _progressHUD.state.dismiss();
                    //  ip = map['ip'];
                    setState(() {
                      ip = map['ip'];
                    });
                  },
                ) ,
                ),
           
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Map> getIp() async {
    var url = "http://ip.jsontest.com/";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
//   Future<Post> fetchPost() async {
//   final response =
//   await http.get('https://jsonplaceholder.typicode.com/posts/1');

//   if (response.statusCode == 200) {
//   // If the call to the server was successful, parse the JSON
//   return Post.fromJson(json.decode(response.body));
//   } else {
//     // If that call was not successful, throw an error.
//     throw Exception('Failed to load post');
//   }
// }
}
