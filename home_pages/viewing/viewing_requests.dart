import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/main.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:shared_preferences/shared_preferences.dart';

class ViewingRequests{
  static getMiscData() async{
    var postUri = Uri.parse('http://$BackendApi/lab/misc');
    var response = await http.get(postUri);
    if (response.statusCode == 200){
      var a = response.body;
      return jsonDecode(response.body);
    }
    else{
      print("ERROR GET MISC");
      return {};
    }
  }
  static getCheckData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var postUri = Uri.parse('http://$BackendApi/lab/check');
    var response = await http.get(postUri);
    if (response.statusCode == 200){
      var a = response.body;
      // Map res = jsonDecode(response.body);
      // Map labData = {
      //   "pump_on": res[],
      //   "door_open": true,
      //   "window_open": true,
      //   "light_on": true,
      //   "auto_lighting_on": true,
      //   "fan_on": true
      // }
      // prefs.setString('labCheck',response.body);
      return jsonDecode(response.body);
    }
    else{
      print("ERROR GET MISC");
      return {};
    }
  }

  static getLabCtl() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var postUri = Uri.parse('http://$BackendApi/lab/ctl');
    var response = await http.get(postUri);
    if (response.statusCode == 200){
      var a = response.body;
      prefs.setString('labCheck',response.body);
      return jsonDecode(response.body);
    }
    else{
      print("ERROR GET MISC");
      return {};
    }
  }

  static getWaterData() async{
    var postUri = Uri.parse('http://$BackendApi/lab/water');
    var response = await http.get(postUri);
    if (response.statusCode == 200){
      var a = response.body;
      return jsonDecode(response.body);
    }
    else{
      print("ERROR GET MISC");
      return {};
    }
  }
  static getScannedColor() async{
    var postUri = Uri.parse('http://$BackendApi/lab/scanned-color');
    var response = await http.get(postUri);
    if (response.statusCode == 200){
      if (jsonDecode(response.body) != null){
        String colorName = jsonDecode(response.body)['color'];
        switch (colorName) {
          case 'yellow':
            return Colors.yellow;
          case 'blue':
            return Color.fromARGB(255, 33, 61, 243);
          case 'green':
            return const Color.fromARGB(255, 15, 123, 64);
          case 'black':
            return Color.fromARGB(255, 51, 35, 35);
          default: CustomAppTheme.descriptionTextColor;
        }
      }
    }
    return CustomAppTheme.descriptionTextColor;
  }

  static getRequiredColor() async{
    var postUri = Uri.parse('http://$BackendApi/lab/required-color');
    var response = await http.get(postUri);
    if (response.statusCode == 200){
      if (jsonDecode(response.body) != null){
        String colorName = jsonDecode(response.body)['color'];
        switch (colorName) {
          case 'yellow':
            return Colors.yellow;
          case 'blue':
            return Color.fromARGB(255, 33, 61, 243);
          case 'green':
            return const Color.fromARGB(255, 15, 123, 64);
          case 'black':
            return Color.fromARGB(255, 51, 35, 35);
          default: CustomAppTheme.descriptionTextColor;
        }
      }
    }
    return CustomAppTheme.descriptionTextColor;
  }

  static getAlarms()async{
    var postUri = Uri.parse('http://$BackendApi/lab/required-color');
    var response = await http.get(postUri);
    return jsonDecode(response.body);
  }
  static changeLabCtl(String changedName, bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map labData = jsonDecode(prefs.getString('labCheck').toString());
    labData[changedName] = value;
    var postUri = Uri.parse('http://$BackendApi/lab/ctl');
    var response = await http.patch(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
      body: json.encode(labData)
    );
    //print(response.statusCode);
  }
}