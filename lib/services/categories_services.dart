import 'dart:convert';

import 'package:store/models/porduct_model.dart';
import 'package:http/http.dart' as http;

import '../helpers/api.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProduct(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productslist = [];
    for (int i = 0; i < data.length; i++) {
      productslist.add(ProductModel.fromJson(data[i]));
    }
    return productslist;
  }
}
