import 'package:rxdart/rxdart.dart';
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

class CounterBloc {
  List<Video> initialList =  []; 
  BehaviorSubject<List<Video>> _subjectCounter;

  CounterBloc({this.initialList}) {
    _subjectCounter = new BehaviorSubject<List<Video>>.seeded(
        this.initialList); //initializes the subject with element already
  }

  Observable<List<Video>> get counterObservable => _subjectCounter.stream;

  void increment() {
    var video = new Video();
    var Videos = initialList.add(video);
    _subjectCounter.sink.add(initialList);
  }

  void decrement() {
    if (initialList.length != 0) {
      initialList.removeLast();
      _subjectCounter.sink.add(initialList);
    }
    // initialCount--;
    // _subjectCounter.sink.add(initialCount);
  }

  void dispose() {
    _subjectCounter.close();
  }
    Future<Map> getIp() async {
    var url = "tagweb.ir/leitner/intract/getvideoes?itemsInPage=5&pageNumber=12";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
}
