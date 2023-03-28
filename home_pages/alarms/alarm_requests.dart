import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/main.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:shared_preferences/shared_preferences.dart';
class AlarmRequests{
  static getAlarmList()async{
    var postUri = Uri.parse('http://$BackendApi/alarms');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(postUri);
    var res = response.body;
    prefs.setString('alarms', response.body);
    return jsonDecode(response.body);
  }

  static changeAlarm(String changedName, bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map labData = jsonDecode(prefs.getString('alarms').toString());
    labData[changedName] = value;
    var postUri = Uri.parse('http://$BackendApi/alarms');
    var response = await http.patch(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
      body: json.encode(labData)
    );
    //print(response.statusCode);
  }
}