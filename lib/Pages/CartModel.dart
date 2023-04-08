// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:app/Models/App.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;
  late Model _catalog;
  final List<int> _itemIds = [];
  Model get catalog => _catalog;

  set catalog(Model newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  num get totalcost => items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
