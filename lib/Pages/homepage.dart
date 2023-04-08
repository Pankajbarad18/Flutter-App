// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use, prefer_const_constructors, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers
import 'dart:convert';

import 'package:app/Pages/CartModel.dart';
import 'package:app/Pages/CatalogList.dart';
import 'package:app/Pages/Header.dart';
import 'package:app/Pages/Store.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:app/Models/App.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var json = await rootBundle.loadString("assets/Files/Items.json");
    var decode = jsonDecode(json);
    var productsdata = decode["products"];
    Model.products = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final fakeitem = List.generate(25, (index) => Model.products[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          backgroundColor: context.theme.buttonColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cart);
          },
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            size: 20,
            count: _cart.items.length,
            color: Vx.red500,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if (Model.products != null && Model.products.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
