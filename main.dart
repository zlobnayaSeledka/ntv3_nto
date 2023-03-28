import 'package:flutter/material.dart';
import 'package:ntv3_cluster/authorization/pages/authorization_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:ntv3_cluster/verify/verify_page.dart';

const String UserApi = "192.168.43.254";
const String BackendApi = "192.168.43.254:81";

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //TODO
  //Создать страницу verify и перенести туда страницы ошибок
  //создать функция verify
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/verify": (context) => VerifyPage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AuthorizationPage()//LoginPage(),
    );
  }
}
