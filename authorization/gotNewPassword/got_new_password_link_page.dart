import 'package:flutter/material.dart';
import 'package:ntv3_cluster/authorization/gotNewPassword/create_new_password_page.dart';
import 'package:ntv3_cluster/design/widgets/app_bar.dart';
import 'package:ntv3_cluster/design/widgets/buttons.dart';
import 'package:ntv3_cluster/design/widgets/text_field.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

class GotNewPasswordLinkPage extends StatefulWidget {
  const GotNewPasswordLinkPage({Key? key}) : super(key: key);

  @override
  State<GotNewPasswordLinkPage> createState() => _GotNewPasswordLinkPageState();
}

class _GotNewPasswordLinkPageState extends State<GotNewPasswordLinkPage> {
  String errorText = '';
  bool request = false;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:!request?Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomAppBar(
              backBotton: true,
              title: 'Востановление пароля',
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 4),
                  Column(
                    children: [
                      CustomTextField(
                        width: MediaQuery.of(context).size.width*0.5,
                        controller: emailController,
                        hintText: 'Введите ваш email',
                        errorText: errorText,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const CustomDescriptionText(text: 'Мы вышлем вам ссылку для востановления пароля'),
                  const SizedBox(height: 32),
                  CustomFilledButton(
                    text: 'Далее',
                    onTap: (){
                      if (emailController.text == ''){
                        setState(() {
                          errorText = 'Вы ничего не ввели';
                        });
                      }
                      else if (!emailController.text.contains('@') || !emailController.text.contains('.')){
                        setState(() {
                          errorText = 'Неверный формат ввода данных';
                        });
                      }
                      else{
                        setState(() {
                          errorText = '';
                          request = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> const CreateNewPasswordPage()
                            )
                          );
                        });
                      }
                    },
                    width: MediaQuery.of(context).size.width*0.5,
                  )
                ],
              )
            ),
            Container()
          ],
        ):const Center(
          child: CustomDescriptionText(
            text: 'Мы отправили ссылку для востановления на ваш email', 
            size: 30,
          ),
        ) 
      ),
    );
  }
}