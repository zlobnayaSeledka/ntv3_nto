import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/buttons.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

import '../../home_pages/Home_page.dart';

class SuccessfulVerifcationPage extends StatelessWidget {
  const SuccessfulVerifcationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTitleText(text: 'Email подтверждён', size: 30,),
              const SizedBox(height: 16),
              const CustomTitleText(text: 'Можете пользоваться сервисом', size: 25),
              const SizedBox(height: 16),
              CustomFilledButton(
                width: MediaQuery.of(context).size.width*0.3,
                text: 'На главную', 
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => HomePage()
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