import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/design/widgets/app_bar.dart';

import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomAppBar(
                backBotton: false,
                title: 'Домашняя страница',
                right: IconButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => const ProfilePage()))
                    );
                  }, 
                  icon: Icon(
                    Icons.person,
                    color: CustomAppTheme.mainTextColor,
                    size: 40,
                  )
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}