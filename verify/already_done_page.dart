import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/buttons.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

import '../authorization/pages/login_page.dart';

class AlreadyDonePage extends StatelessWidget {
  const AlreadyDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTitleText(text: 'Хм... Такой пользователь уже существует', size: 30,),
              const SizedBox(height: 16),
              const CustomTitleText(text: 'Попробуйте войти в аккаунт', size: 25),
              const SizedBox(height: 16),
              CustomFilledButton(
                width: MediaQuery.of(context).size.width*0.3,
                text: 'Войти', 
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => LoginPage()
                    ), (route) => false
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}