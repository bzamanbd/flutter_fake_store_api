import 'package:flutter/material.dart';
import 'package:flutter_fake_store_api/services/api_services.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  const ProductDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height / 20, horizontal: size.width / 20),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        snapshot.data['image'],
                        width: double.infinity,
                        height: size.height / 2.5,
                      ),
                      SizedBox(height: size.height / 40),
                      Row(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              snapshot.data['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor,
                                height: size.height / 400,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 100,
                      ),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          Text(
                            'Price : \$' + snapshot.data['price'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              color: Colors.black87,
                            ),
                          ),
                          Expanded(
                              child: Chip(
                            label: Text(
                              snapshot.data['category'].toString(),
                              style: TextStyle(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            padding: const EdgeInsets.all(0.0),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width / 20,
                          vertical: 0,
                        ),
                        child: Text(
                          snapshot.data['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14, height: size.height / 400),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
            future: ApiServices().singleProductData(id),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ApiServices().updateCart(2, id);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Product is added',
              textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.green,
              ));
        },
        child: const Icon(Icons.add_shopping_cart_outlined),
        mini: true,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    ));
  }
}
