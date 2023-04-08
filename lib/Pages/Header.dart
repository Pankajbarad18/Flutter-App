// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.xl.bold.make(),
      ],
    );
  }
}
