// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, unnecessary_null_comparison

import 'package:velocity_x/velocity_x.dart';

import 'package:app/Models/App.dart';
import 'package:app/Pages/Store.dart';

class CartModel {
  Model _catalog = Model();
  final List<int> _itemIds = [];
  Model get catalog => _catalog;

  set catalog(Model newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  num get totalcost => items.fold(0, (total, current) => total + current.price);

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}