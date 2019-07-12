import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:progress_hud/progress_hud.dart';

class Video {
  final int xLevel;
  final int xId;
  final int xVideoType;
  final String xdescription;
  final bool xisDeleted;
  final int xsizeInKilobyte;
  final String xtitle;
  final String xvideoUrl;
  final String xthumbnailImageUrl;
  Video(
      {this.xLevel,
      this.xId,
      this.xVideoType,
      this.xdescription,
      this.xisDeleted,
      this.xsizeInKilobyte,
      this.xtitle,
      this.xvideoUrl,
      this.xthumbnailImageUrl});
  factory Video.fromJson(Map<String, dynamic> parsedJson) {
    return Video(
      xLevel: parsedJson['xLevel'],
      xId: parsedJson['xId'],
      xVideoType: parsedJson['xVideoType'],
      xdescription: parsedJson['xdescription'],
      xisDeleted: parsedJson['xisDeleted'],
      xsizeInKilobyte: parsedJson['xsizeInKilobyte'],
      xtitle: parsedJson['xtitle'],
      xvideoUrl: parsedJson['xvideoUrl'],
      xthumbnailImageUrl: parsedJson['xthumbnailImageUrl'],
    );
  }
}

class VideoRecord {
  final bool hasMmore;
  final int page;
  final int total;
  final List<Video> items;
  VideoRecord({this.hasMmore, this.page, this.total, this.items});
  factory VideoRecord.fromJson(Map<String, dynamic> parsedJson) {
    return VideoRecord(
      hasMmore: parsedJson['has_more'],
      page: parsedJson['page'],
      total: parsedJson['total'],
      items:
          (parsedJson['items'] as List).map((i) => Video.fromJson(i)).toList(),
    );
  }
}

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  Map map;
  List<Video> videoesList = new List<Video>();
  ProgressHUD _progressHUD;
  ScrollController _controller = ScrollController();
  VideoRecord currenrRecord;
  var isLoading = false;
  var currentPage = 1;
  @override
  void initState() {
    //**Initial ProgressHUD**/
    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      loading: true,
      text: 'درحال بارگذاری...',
    );
    //**Add listener for ScrollController that use for infinit scroll**/
    _controller.addListener(() {
      double maxScroll = _controller.position.maxScrollExtent;
      double currentScroll = _controller.position.pixels;
      double delta = 300.0; // or something else..
      if (maxScroll - currentScroll <= delta) {
           if (currenrRecord.hasMmore && !isLoading) {
          isLoading = true;
          fetchData();          
        }
      }
      if (_controller.position.atEdge) {
        // if (_controller.position.pixels > 500)
        //   print("At extreme top");
        // else
        //   print("At extreme bottom");
        // if (currenrRecord.hasMmore && !isLoading) {
        //   isLoading = true;
        //   fetchData();          
        // }
      }
    });
    //**Fetch data in first load */
    fetchData();
  }

  void fetchData() {
    getVideoes().then((result) {
      _progressHUD.state.show();
      setState(() {
        map = result;
        // var list = map['items'] as List;
        // videoesList.addAll(list.map((i) => Video.fromJson(i)).toList());
        currenrRecord = VideoRecord.fromJson(map);
        videoesList.addAll(VideoRecord.fromJson(map).items);
        // print(list.runtimeType);
        // print(map['items'][0]['xdescription']);
        print(videoesList[0].xvideoUrl);
        _progressHUD.state.dismiss();
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('لیست ویدیوهای آنلاین'),
        ),
        body: Stack(
          children: <Widget>[
            _progressHUD,
            Container(
              decoration: new BoxDecoration(color: Colors.black12),
              child: ListView.builder(
                controller: _controller,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                        child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Image.network(
                            'http://tagweb.ir/${videoesList[index].xthumbnailImageUrl}',
                          ),
                        ),
                        Container(
                          height: 200,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 150,
                                child: Text(
                                  '${videoesList[index].xtitle}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: 150,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${videoesList[index].xdescription}',
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'IRANSansMobile',
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  );
                },
                itemCount: videoesList.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Update Text',
          child: Icon(Icons.update),
        ),
      ),
    );
  }

  Future<Map> getVideoes() async {
    var currentPage = 1;
    if (currenrRecord != null) {
      currentPage = currenrRecord.page + 1;
    }
    var url =
        "http://tagweb.ir/leitner/intract/getvideoes?itemsInPage=5&pageNumber=$currentPage";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}
