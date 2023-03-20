import 'package:flutter/material.dart';
import '../design/widgets/buttons.dart';
import '../design/widgets/text_field.dart';
import '../design/widgets/texts.dart';
import '../home_page/home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  width: 400,
                  controller: nameController,
                  labelText: 'Имя',
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
                      MaterialPageRoute(builder: (context)=> LoginPage()), (route) => false
                    );
                  },
                  child: const CustomLinkText(text: 'Войти', size: 20),
                ),
                const SizedBox(height: 16),
                CustomFilledButton(
                  width: 400,
                  text: 'Зарегистрироваться', 
                  onTap: (){
                    // RequestsAuthorization.registerRequest(
                    //   nameController.text,
                    //   passwordController.text
                    // );
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