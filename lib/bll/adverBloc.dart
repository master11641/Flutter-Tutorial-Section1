import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class Adver {
  String title;
  String abstarct;
  String username;
  Adver(this.title, this.abstarct, this.username);
}

class CounterBloc {
  List<Adver> initialList =
      []; //if the data is not passed by paramether it initializes with 0
  BehaviorSubject<List<Adver>> _subjectCounter;

  CounterBloc({this.initialList}) {
    _subjectCounter = new BehaviorSubject<List<Adver>>.seeded(
        this.initialList); //initializes the subject with element already
  }

  Observable<List<Adver>> get counterObservable => _subjectCounter.stream;

  void increment() {
    var adver = new Adver("آگهی جدید ", "خلاصه آگهی", "علیرضا کیانی مقدم");
    var advers = initialList.add(adver);
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
}
