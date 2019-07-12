import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/Widgets/GetIP.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: new Login(),
        appBar: AppBar(title: Text('فرم لاگین'),),
        ),
      
    );
  }
}

class Login extends StatelessWidget{
  final userController = TextEditingController();
   final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: userController,
            decoration: InputDecoration(hintText: "نام کاربری",prefixIcon: Icon(Icons.person)),
          ),
        ),
           Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: passController,
            decoration: InputDecoration(hintText: "پسورد",prefixIcon:Icon(Icons.lock) ),
            
            obscureText: true,
          ),
        ),
        RaisedButton(
          onPressed: (){        
        // Alert(context: context, title: "نام کاربری", desc: userController.text).show();
         Navigator.push(context, new MaterialPageRoute(builder: (context)=>new GetIp()));
        },
        child: Text("ثبت نام"),   
         color: Colors.blue,
         textColor: Colors.white,
          
        )
        
      ],
    );
  }

}