import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../models/user_model.dart';

class RequestsAuthorization{

  static registerRequest(String username, String password, String email)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var postUri = Uri.parse('http://$UserApi/email/register');
    var response = await http.post(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json", "Access-Control-Allow-Origin": "*"},
      body: json.encode(
        {
          'username': username,
          'password': password,
          'email': email
        }
      )
    );
    if (response.statusCode == 201){
      if (jsonDecode(response.body)['email_account']['is_verified']){}
      else{
        var postUri2 = Uri.parse('http://$UserApi/email/request-verify/$email');
        var response2 = await http.post(
          postUri2, 
          headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
        );
        if (response2.statusCode == 202){
          User userModel = User.fromJson(jsonDecode(response.body));
          Map userJson = userModel.toJson();
          prefs.setString('userData', jsonEncode(userJson));
        }
      }
      //RequestsAuthorization.loginRequest(username, password);
    }
  }
  

  static loginRequest(String name, String password)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var postUri = Uri.parse('http://$UserApi/email/login');
    var response = await http.post(
      postUri, 
      headers:  {"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8", "accept": "application/json"},
      body: 
        {
        'grant_type': 'password',
        'scope': '',
        'client_id': '',
        'client_secret': '',
        'username': name,
        'password': password
        }
    );
    // print('STUUUUS'+response.statusCode.toString());
    if (response.statusCode == 200){
      // print('BODY'+response.body);
      prefs.setString(
        'userTokens', 
        json.encode(
          {
            'access': json.decode(response.body)['access'], 
            'refresh': json.decode(response.body)['refresh'],
          }
        )
      );
      return true;
    }
    return false;
  }

  static sendLink(email)async{
    var postUri2 = Uri.parse('http://$UserApi/email/request-verify/$email');
    var response2 = await http.post(
      postUri2, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
    );
    return response2;
  }

  static verifyUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usdata = prefs.getString('userData');
    Map userData;
    if (usdata != null){
      userData = jsonDecode(usdata);
    }
    else{
      userData = {};
    }
    String token = 'http://host/verify/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1d3VAcy5ydSIsImV4cCI6MTY3OTQzMTY5M30.txwIQvPyAboJ9Z5O-0HhaCOoAwpCh01r5xDU_ltrgoY';//html.window.location.pathname.toString();
    Uri uri = Uri.parse(token);
    List pathSeg = uri.pathSegments; 
    token = pathSeg[pathSeg.length-1];
    var postUri = Uri.parse('http://$UserApi/email/verify');
    var response = await http.patch(
      postUri, 
      headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json"},
      body: json.encode(
        {
          'token': token
        }
      )
    );
    if (response.statusCode == 204){
      if (userData['name'] != null && userData['password'] != null){
        bool res = await RequestsAuthorization.loginRequest(userData['name'], userData['password']);
        if (res){
          return {
            'logined': false,
            'data': 'successful_verif'
          };
        }
        else{
            return {
            'logined': false,
            'data': 'something_wrong'
          };
        }
      }
      else{
        return {
            'logined': false,
            'data': 'need_login'
          };
      }
    }
    else if(response.statusCode == 422){
      return {
        'logined': false,
        'data': 'something_wrong'
      };
    }
    else if(response.statusCode == 400){
      if(jsonDecode(response.body)['code'] == 'INVALID_TOKEN'){
        return {
          'logined': false,
          'data': 'time_out'
        };
      }
      else if(jsonDecode(response.body)['code'] == 'READONLY_DATA'){
        return {
          'logined': false,
          'data': 'blocked'
        };
      }
      else if(jsonDecode(response.body)['code'] == 'ALREADY_DONE'){
        return {
          'logined': false,
          'data': 'already_done'
        };
      }
    }
    else{
      return {
        'logined': false,
        'data': 'something_wrong'
      };
    }
  }

  static getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //return true;
    if (prefs.getString('userTokens') != null){
      Map usTokens = jsonDecode(prefs.getString('userTokens').toString());
      String token = usTokens['refresh'];
      var postUri = Uri.parse('http://$UserApi/tokens/authenticated');
      var response = await http.get(
        postUri, 
        headers:  {"Content-Type": "application/json; charset=UTF-8", "accept": "application/json", "Authorization": "Bearer "+ token},
      );
      if (response.statusCode == 200){
        User userdata = User.fromJson(jsonDecode(response.body));
        prefs.setString('userData', jsonEncode(userdata.toJson()));
        return true;
      } 
      else{
        print('error');
      }
    }
    return false;
  } 
  static isLogined()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userTokens') == null){
      return false;
    }
    return true;
  }
}