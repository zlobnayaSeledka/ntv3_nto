import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class RequestsAuthorization{
  static connectDevice(String uuid)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwt = jsonDecode(prefs.getString('User').toString())['jwt'];
    var postUri = Uri.parse('http://93.190.110.225:10100/devices/connect/'+uuid);
    var response = await http.post(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json", "Authorization": "Bearer "+ jwt},
    );
    return '';
  }
  static registerRequest(String login, String password)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var postUri = Uri.parse('http://93.190.110.225:10100/users');
    var response = await http.post(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
      body: json.encode(
        {
        'name': login,
        'password': password
        }
      )
    );
    if (response.statusCode == 201){
      Map user = {
        'login': login,
        'password': password, 
        'jwt': jsonDecode(response.body)['access_token']
      };
      RequestsAuthorization.loginRequest(login, password);
    }
  }

  static loginRequest(String name, String password)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var postUri = Uri.parse('http://93.190.110.225:10100/users/token');
    var response = await http.post(
      postUri, 
      headers:  {"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8", "accept": "application/json"},
      body: 
        {
        'grant_type': '',
        'scope': '',
        'client_id': '',
        'client_secret': '',
        'username': name,
        'password': password
        }
    );
    print('STUUUUS'+response.statusCode.toString());
    if (response.statusCode == 200){
      print('BODY'+response.body);
      prefs.setString(
        'User', 
        json.encode(
          {
            'name': name, 
            'password': password,
            'jwt': json.decode(response.body)['access_token']
          }
        ));
    }
  }

    static getUser()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var us = prefs.getString('User');
      if (prefs.getString('User') != null){
        return true;
      }
      return false;
    }

    static isConnected()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var postUri = Uri.parse('http://93.190.110.225:10100/users/me');
      String jwt = jsonDecode(prefs.getString('User').toString())['jwt'];
      var response = await http.get(
        postUri, 
        headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json", "Authorization": "Bearer "+ jwt},
      );
      if (response.statusCode == 200){
        if (jsonDecode(response.body)['device'] != null && jsonDecode(response.body)['device']['public_uuid'] != ''){
          return jsonDecode(response.body)['device']['public_uuid'];
        }
        else{
          return false;
        }
      }
      else{
        return false;
      }
    }
  
}