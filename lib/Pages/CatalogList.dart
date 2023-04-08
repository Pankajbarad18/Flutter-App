// ignore_for_file: deprecated_member_use

import 'package:app/Models/App.dart';
import 'package:app/Pages/CartModel.dart';
import 'package:app/Pages/CatImage.dart';
import 'package:app/Pages/Homedetail.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    return VxBox(
        child: Row(
      children: [
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
                  _AddtoCart(catalog: catalog)
                ],
              ).pOnly(right: 8)
            ],
          ),
        )
      ],
    )).color(context.cardColor).roundedLg.square(130).make().py16();
  }
}

class _AddtoCart extends StatefulWidget {
  final Item catalog;
  const _AddtoCart({super.key, required this.catalog});

  @override
  State<_AddtoCart> createState() => __AddtoCartState();
}

class __AddtoCartState extends State<_AddtoCart> {
  @override
  bool isAdded = false;
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = Model();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              context.theme.buttonColor,
            ),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isAdded ? Icon(Icons.done) : "Add To Cart".text.make());
  }
}
