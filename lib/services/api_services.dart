// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  //for allproducts//
  Future gettingAllData() async {
    final allProductsUrl = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProductsUrl);
    return jsonDecode(response.body);
  }

  //for a single product//
  Future singleProductData(int id) async {
    final singleProductUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductUrl);
    return jsonDecode(response.body);
  }

}
