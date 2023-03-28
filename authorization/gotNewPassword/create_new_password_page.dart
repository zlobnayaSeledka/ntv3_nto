import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/text_field.dart';
import 'package:ntv3_cluster/home_pages/home_page.dart';

import '../../design/widgets/buttons.dart';
import '../../design/widgets/texts.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                width: MediaQuery.of(context).size.width*0.5,
                controller: passwordController,
                hintText: 'Придумайте новый пароль',
              ),   
              const SizedBox(height: 32),
              CustomFilledButton(
                width: MediaQuery.of(context).size.width*0.5,
                text: 'Далее',
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: ((context) => HomePage()))
                  );
                }
              )    
            ],
          ),
        )
      ),
    );
  }
}