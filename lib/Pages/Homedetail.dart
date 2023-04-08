// ignore_for_file: deprecated_member_use

import 'package:app/Models/App.dart';
import 'package:app/utils/Widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl4.red800.bold.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          context.theme.buttonColor,
                        ),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add To Cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(children: [
                        catalog.name.text.xl3.color(context.accentColor).make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle)
                            .bold
                            .make(),
                        6.heightBox,
                        "Thank you for sharing your feedback with us and we apologize for the experience you have had.You can exchange the product for a new one or collect a complete refund if you are entirely unhappy.To initiate the process, you can write to care.india@decathlon.com or visit the nearest store to you."
                            .text
                            .bold
                            .sm
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ]).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
