import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:myapp/Widgets/GetIP.dart';
import 'package:myapp/Widgets/Login.dart';
import 'package:myapp/Widgets/carouselList.dart';
import 'package:myapp/Widgets/videoListPage.dart';
import 'ListSimple.dart';
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Home Page')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
                ListTile(
              title: Text('فرم لاگین'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
               
                Navigator.push(context, new MaterialPageRoute(builder: (context)=> new LoginPage()));
              //  Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('لیست ساده'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                print('object');
                Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SimpleList()));
              //  Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('ارتباط با سرور'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                   Navigator.push(context, new MaterialPageRoute(builder: (context)=> new GetIp()));
              },
            ),
               ListTile(
              title: Text('لیست چرخشی'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                   Navigator.push(context, new MaterialPageRoute(builder: (context)=> new CarouselList()));
              },
            ),            
               ListTile(
              title: Text('لیست ویدیوها'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                   Navigator.push(context, new MaterialPageRoute(builder: (context)=> new VideoListPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}