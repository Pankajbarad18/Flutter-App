// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

import 'package:velocity_x/velocity_x.dart';

import 'package:app/Models/App.dart';
import 'package:app/Pages/CartModel.dart';

class MyStore extends VxStore {
  CartModel cart = CartModel();
  Model catalog = Model();
  MyStore() {
    cart.catalog = catalog;
  }
}
