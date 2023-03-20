import 'package:flutter/material.dart';

import '../home_page/home_page.dart';
import 'authorization_requests.dart';
import 'login_page.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: RequestsAuthorization.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          if (snapshot.data){
            return HomePage();
          }
          else{
            return LoginPage();
          }
        }
        return Container();
      }
    );
  }
}