import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

import '../design/widgets/buttons.dart';
import '../design/widgets/text_field.dart';
import '../home_page/home_page.dart';
import 'authorization_requests.dart';
import 'registration_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  width: 400,
                  controller: nameController,
                  labelText: 'e-mail',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  width: 400,
                  controller: passwordController,
                  labelText: 'Пароль',
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap:(){
                    Navigator.pushAndRemoveUntil(
                      context, 
                      MaterialPageRoute(builder: (context)=> const RegisterPage()), (route) => false
                    );
                  },
                  child: const CustomLinkText(text: 'Зарегистрироваться', size: 20),
                ),
                const SizedBox(height: 16),
                CustomFilledButton(
                  width: 400,
                  text: 'Войти', 
                  onTap: (){
                    //RequestsAuthorization.loginRequest(nameController.text, passwordController.text);
                    Navigator.pushAndRemoveUntil(
                      context, 
                      MaterialPageRoute(builder: (context)=> HomePage()), (route) => false
                    );
                  }
                )
              ],
            ),
          ),
        ) 
      ),
    );
  }
}