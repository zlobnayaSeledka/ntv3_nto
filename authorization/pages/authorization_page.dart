import 'package:flutter/material.dart';
import 'package:ntv3_cluster/authorization/pages/login_page.dart';
import 'package:ntv3_cluster/verify/already_done_page.dart';

import '../../home_pages/home_page.dart';
import '../authorization_requests.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: RequestsAuthorization.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          if (snapshot.data){
            return HomePage();
          }
          else{
            return const LoginPage();
          }
        }
        return Container(
          color: Colors.red,
        );
      }
    );
  }
}