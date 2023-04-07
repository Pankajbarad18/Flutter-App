import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/Widgets/themes.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyTheme.darkbluishColor).make(),
        "Trending Products".text.xl.bold.make(),
      ],
    );
  }
}