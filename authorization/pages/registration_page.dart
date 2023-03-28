import 'package:flutter/material.dart';
import 'package:ntv3_cluster/authorization/authorization_requests.dart';
import '../../design/widgets/buttons.dart';
import '../../design/widgets/text_field.dart';
import '../../design/widgets/texts.dart';
import 'link_sent_page.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
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
                  hintText: 'Имя пользователя',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  width: 400,
                  controller: emailController,
                  hintText: 'email',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  width: 400,
                  controller: passwordController,
                  hintText: 'Пароль',
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
                  onTap: ()async{
                    await RequestsAuthorization.registerRequest(
                      nameController.text,
                      passwordController.text,
                      emailController.text
                    );
                    Navigator.pushAndRemoveUntil(
                      context, 
                      MaterialPageRoute(builder: (context)=> const LinkSentPage()), (route) => false
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