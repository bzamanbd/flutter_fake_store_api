import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/all_categories.dart';
import '../screens/cart_screen.dart';
import '../screens/product_details_screen.dart';
import '../services/api_services.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Products'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllCategories())),
                icon: const Icon(Icons.view_list)),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen(userId: '2'))),
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        body: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    //converting single product with index//
                    Product product = snapshot.data[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 15,
                          vertical: size.height / 30),
                      child: ListTile(
                        leading: Image.network(
                          product.image,
                          height: size.height / 8,
                          width: size.width / 8,
                        ),
                        title: Text(product.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            )),
                        subtitle: Text('Price: \$' +
                            product.price.toString()),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                      id: product.id)));
                        },
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: ApiServices().gettingAllData(),
        ),
      ),
    );
  }
}
