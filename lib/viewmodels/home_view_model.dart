import 'dart:async';
import 'dart:convert';

import 'package:dummy_transformation/viewmodels/base_model.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends BaseModel{
  BuildContext context ;
  Timer timetracker;
  var t_main = [];
  var t_detail = [];
  HomeViewModel(BuildContext _context){
    this.context = _context;
  }

  void getTimeTracker()async{

    timetracker = new Timer.periodic(Duration(seconds: 10), (timer)async{
//      final data = await _apiService.getAllTracker();
//      Datum datum = new Datum();
      List<List> list_filter = new List();
//      var filter_data = data.data.where((element) => element.name == "BUS RAPID TRANSIT (BRT)").forEach((element) {
//        datum = new Datum();
//        list_filter.add(element);
//      });
      print("ini data list");
      print(list_filter[0]);
//      list_filter.add(filter_data);
      if(t_detail.length>0){
        t_detail.clear();
      }


      if(t_main.length != 9){
        t_main.add(json.encode(list_filter));
      }else{

        t_main.insert(0, json.encode(list_filter));
        t_main.removeLast();
        print(t_main);
      }
      print("length t");
      print(t_main.length);
      print(t_main.toString());
//      _write(t_main.toString());

    });
  }
}