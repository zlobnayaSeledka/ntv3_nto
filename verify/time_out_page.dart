import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ntv3_cluster/authorization/authorization_requests.dart';
import 'package:ntv3_cluster/design/widgets/buttons.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authorization/pages/link_sent_page.dart';

class TimeOutPage extends StatelessWidget {
  const TimeOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTitleText(text: 'Время вышло', size: 30,),
              const SizedBox(height: 16),
              const CustomTitleText(text: 'Ссылка больше не активна', size: 25),
              const SizedBox(height: 16),
              CustomFilledButton(
                width: MediaQuery.of(context).size.width*0.3,
                text: 'Отправить снова', 
                onTap: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  Map data = jsonDecode(prefs.getString('userData').toString());
                  String email = data['email'];
                  await RequestsAuthorization.sendLink(email);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LinkSentPage()), (route) => false);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}