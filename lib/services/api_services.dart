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
    final response = await http.delete(deleteCartUrl, body: {"userId": userId});
    print(response.statusCode); //uncomment and check DEBUG CONSOLE//
    print(response.body);
    return jsonDecode(response.body);
  }

  //POST request for the Basic Authentication(using: "username" & "password" sending in body pararmeter). this is the 1st way of Basic Authentication//
  Future basicAuth(String username, password) async {
    final basicAuthUrl = Uri.parse('https://api.somewhere.io'); //a fake url//
    final response = await http
        .post(basicAuthUrl, body: {"username": username, "password": password});
    print(response.statusCode); //uncomment and check DEBUG CONSOLE//
    print(response.body);
    // return jsonDecode(response.body);
  }

  //GET request for the Basic Authentication(sending details in Authorization Header). this is the 2nd way of Basic Authentication//
  Future userAuthorization(String username, password) async {
    final authUrl = Uri.parse('https://api.somewhere.io'); //a fake url//
    String baicAuth = "Basic" +
        base64Encode(utf8.encode(
            "$username : $password")); //(need to remember this line of code)
    final response = await http.get(authUrl, headers: {
      "content-type": "application/json",
      "authorization": baicAuth
    });
    print(response.statusCode); //uncomment and check DEBUG CONSOLE//
    print(response.body);
    // return jsonDecode(response.body);
  }

  //Bearer Authentication(the second type of authentication)//using("token" in header) instead of username,password//
  Future userAuthentication() async {
    final authUrl = Uri.parse('https://api.somewhere.io'); //a fake url//
    const accessToken = "some token value";//just think you have a token value//
    final response = await http.get(authUrl, headers: {
      "content-type": "application/json",
      "authorization": "Bearer $accessToken",//check the Api Keys and values//
    });
    print(response.statusCode); //uncomment and check DEBUG CONSOLE//
    print(response.body);
    // return jsonDecode(response.body);
  }
}
