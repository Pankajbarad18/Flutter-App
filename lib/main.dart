// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:app/Pages/CartPage.dart';
import 'package:app/Pages/Homedetail.dart';
import 'package:app/Pages/Store.dart';
import 'package:app/Pages/loginpage.dart';
import 'package:app/utils/Widgets/themes.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/homepage.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), interceptors: [], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner:
          false, //so aftere completion please flase it.. if false then side upper debug logo will be erase

      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.home: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.homedetail: (uri, _) {
          final catalog = (VxState.store as MyStore)
              .catalog
              .getbyId(int.parse(uri.queryParameters["id"]!));
          return MaterialPage(
              child: HomeDetailPage(
            catalog: catalog,
          ));
        },
        MyRoutes.login: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.cart: (_, __) => MaterialPage(child: MyCart()),
      }),
      //initialRoute: MyRoutes.login,
      // routes: {
      //   "/": (context) => HomePage(),
      //   MyRoutes.home: (context) => HomePage(),
      //   MyRoutes.login: (context) => LoginPage(),
      //   MyRoutes.cart: (context) => MyCart(),
      // },
    );
  }
}
