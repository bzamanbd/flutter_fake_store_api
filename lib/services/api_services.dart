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

  //for cart//
  Future cartData(String userId) async {
    final cartDataUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.get(cartDataUrl);
    // print(response.body);
    return jsonDecode(response.body);
  }

  //POST request for userLogin//
  Future userLogin(String username, password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final response = await http.post(loginUrl, body: {
      "username": username,
      "password": password,
    });
    // print(response.statusCode);
    // print(response.body);
    return jsonDecode(response.body);
  }

  //PUT request for update the Cart Screen(click "add to cart" button) //
  Future updateCart(int userId, productId) async {
    final updateCartUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.put(updateCartUrl, body: {
      "userId": "$userId",
      "date": DateTime.now().toString(),
      "products": [
        {"productId": "$productId", "quantity": "1"}
      ].toString()
    });
    // print(response.statusCode); //uncomment and check DEBUG CONSOLE//
    // print(response.body);
    return jsonDecode(response.body);
  }

  //DELETE request for update the Cart screen(click "remove from cart" button) //
  Future deleteCart(String userId) async {
    final deleteCartUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.delete(deleteCartUrl, body: {
      "userId" : userId
    });
    print(response.statusCode); //uncomment and check DEBUG CONSOLE//
    print(response.body);
    return jsonDecode(response.body);
  }
}
