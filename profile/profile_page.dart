import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/design/widgets/app_bar.dart';
import 'package:ntv3_cluster/design/widgets/custim_containers.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[
            const CustomAppBar(
              backBotton: true,
              title: "Профиль",
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: CustomBoxWithShadow(
                width: (MediaQuery.of(context).size.height-200)*1.5,
                height: MediaQuery.of(context).size.height-200,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: CustomAppTheme.secondColor
                            ),
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          const CustomTitleText(
                            size: 35,
                            text: 'Имя Фамилия',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CustomDescriptionText(
                        text: 'Email:     email@mail.ru',
                        size: 20,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CustomDescriptionText(
                        text: 'Дата создания:     22.02.2023',
                        size: 20,
                      )
                    ],
                  ),
                ) 
              ),
            )
          ],
        ) 
      ),
    );
  }
}