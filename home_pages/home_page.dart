import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ntv3_cluster/authorization/authorization_requests.dart';
import 'package:ntv3_cluster/authorization/pages/login_page.dart';
import 'package:ntv3_cluster/design/custom_theme.dart';
import 'package:ntv3_cluster/design/widgets/app_bar.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';
import 'package:ntv3_cluster/home_pages/alarms/alarmList.dart';
import 'package:ntv3_cluster/home_pages/alarms/alarm_requests.dart';
import 'package:ntv3_cluster/home_pages/alarms/alarm_widget.dart';
import 'package:ntv3_cluster/home_pages/viewing/viewing_page.dart';
import '../design/widgets/custim_containers.dart';
import '../profile/profile_page.dart';
import 'debuging/debuging_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool debug_page = false;
  List<bool> alarmActive = [true, false, true, false];
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer.periodic(const Duration(seconds: 2), (Timer t) => setState((){}));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AlarmList(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CustomAppBar(
                    backBotton: false,
                    title: 'Лаборатория  8',
                    right: FutureBuilder(
                      future: RequestsAuthorization.isLogined(),
                      builder: (context, snap) {
                        return snap.data==false?IconButton(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: ((context) => const LoginPage()))
                            );
                          }, 
                          icon: Icon(
                            Icons.person,
                            color: CustomAppTheme.mainTextColor,
                            size: 40,
                          )
                        ):Container();
                      }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      debug_page?
                      GestureDetector(
                        child: const CustomDescriptionTitleText(text: 'Просмотр', size: 30),
                        onTap: (){
                          setState(() {
                            debug_page = false;
                          });
                        },
                      ):
                      const CustomTitleText(text: 'Просмотр', size: 30),
                      const CustomTitleText(text: '/', size: 30),
                      !debug_page?
                      FutureBuilder(
                        future: RequestsAuthorization.isLogined(),
                        builder: (context, snap) {
                          return GestureDetector(
                            child: const CustomDescriptionTitleText(text: 'Проверка', size: 30),
                            onTap: (){
                              if (snap.data == true){
                                setState(() {
                                  debug_page = true;
                                });
                              }
                              else{
                                showDialog(
                                  context: context, 
                                  builder: (context){
                                    return const Center(
                                      child: CustomBoxWithShadow(
                                        width: 300,
                                        height: 300,
                                        child: CustomTitleText(
                                          text: 'Осуществлять проверку может только администратор'
                                        )
                                      ),
                                    );
                                  }
                                );
                              }
                            },
                          );
                        }
                      ):
                      const CustomTitleText(text: 'Проверка', size: 30),
                    ],
                  ),
                ),
                !debug_page?
                ViewingPage():DebugingPage()

              ],
            ),
          ),
        )
      ),
    );
  }
}