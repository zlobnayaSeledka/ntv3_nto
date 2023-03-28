import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';
import 'package:ntv3_cluster/verify/already_done_page.dart';
import 'package:ntv3_cluster/verify/successful_verification_page.dart';
import 'package:ntv3_cluster/verify/time_out_page.dart';

import '../authorization/authorization_requests.dart';
import '../authorization/pages/login_page.dart';
import '../home_pages/home_page.dart';
import 'blocked_user_page.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: RequestsAuthorization.verifyUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
             if(snapshot.data['data'] == 'already_done'){
              return const AlreadyDonePage();
            }
            else if(snapshot.data['data'] == 'successful_verif'){
              return const SuccessfulVerifcationPage();
            }
            else if(snapshot.data['data'] == 'time_out'){
              return const TimeOutPage();
            }
            else if(snapshot.data['data'] == 'blocked'){
              return const BlockedUserPage();
            } 
            return const LoginPage();
        }
        return const Center(
          child: CustomTitleText(text: 'Загрузка...'),
        );
      }
    );
  }
}

          //   if(snapshot.data['data'] == 'already_done'){
          //     return const AlreadyDonePage();
          //   }
          //   else if(snapshot.data['data'] == 'successful_verif'){
          //     return const SuccessfulVerifcationPage();
          //   }
          //   else if(snapshot.data['data'] == 'time_out'){
          //     return const TimeOutPage();
          //   }
          //   else if(snapshot.data['data'] == 'blocked'){
          //     return const BlockedUserPage();
          //   } 
          //   return const LoginPage();
          // }