// ignore_for_file: deprecated_member_use, file_names, prefer_const_constructors

import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:app/Models/App.dart';
import 'package:app/Pages/AddtoCart.dart';
import 'package:app/Pages/CatImage.dart';
import 'package:app/Pages/Homedetail.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: Model.products.length,
            itemBuilder: (context, index) {
              final catalog = Model.products[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetailPage(catalog: catalog),
                      )),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: Model.products.length,
            itemBuilder: (context, index) {
              final catalog = Model.products[index];
              return InkWell(
                  onTap: () => context.vxNav.push(
                      Uri(
                          path: MyRoutes.homedetail,
                          queryParameters: {"id": catalog.id.toString()}),
                      params: catalog),
                  child: CatalogItem(catalog: catalog));
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatImage(image: catalog.image)),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).make(),
            catalog.desc.text.sm.textStyle(context.captionStyle).bold.make(),
            6.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                AddtoCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ).p(context.isMobile ? 0 : 16),
      )
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .roundedLg
        .square(130)
        .make()
        .py16();
  }
}
