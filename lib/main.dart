import 'package:app/Pages/CartPage.dart';
import 'package:app/Pages/loginpage.dart';
import 'package:app/utils/Widgets/themes.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'Pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner:
          false, //so aftere completion please flase it.. if false then side upper debug logo will be erase
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.login: (context) => LoginPage(),
        MyRoutes.cart: (context) => MyCart(),
      },
    );
  }
}
