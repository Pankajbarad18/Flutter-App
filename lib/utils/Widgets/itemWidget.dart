// ignore_for_file: file_names, unnecessary_null_comparison, avoid_print, prefer_const_constructors

import 'package:app/Models/App.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        print("${item.name} pressed");
      },
      leading: Image.network(item.image),
      title: Text(item.name),
      subtitle: Text(item.desc),
      trailing: Text(
        "\$${item.price}",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    ));
  }
}
