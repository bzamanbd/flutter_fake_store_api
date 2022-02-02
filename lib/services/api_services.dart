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

  //for all Categories//
  Future allCategoriesData() async {
    final allCategoriestUrl =
        Uri.parse('http://fakestoreapi.com/products/categories');
    final response = await http.get(allCategoriestUrl);
    // print(response.body);
    return jsonDecode(response.body);
  }

  //for a single category//
  Future singleCategoryData(String catName) async {
    final singleCategoryUrl =
        Uri.parse('https://fakestoreapi.com/products/category/$catName');
    final response = await http.get(singleCategoryUrl);
    // print(response.body);
    return jsonDecode(response.body);
  }
}
