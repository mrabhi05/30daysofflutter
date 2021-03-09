import 'package:flutter/material.dart';
import 'package:flutterapp/pages/cart_page.dart';
import 'package:flutterapp/pages/login_page.dart';
import 'package:flutterapp/pages/home_page.dart';
import 'package:flutterapp/utils/routes.dart';
import 'package:flutterapp/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
