import 'package:flutter/material.dart';
import 'package:flutter_fake_store_api/services/api_services.dart';

class CartScreen extends StatelessWidget {
  final String userId;
  const CartScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User'.toUpperCase() + userId + ' Cart'.toUpperCase()),
          centerTitle: true,
        ),
        body: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List products = snapshot.data['products'];
              return Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Center(
                      child: FutureBuilder(
                        builder: (context, AsyncSnapshot asyncSnapshot) {
                          if (asyncSnapshot.hasData) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height/100,
                                  horizontal: size.width/200),
                              child: ListTile(
                                minVerticalPadding: size.height/80,
                                title: Text(asyncSnapshot.data['title']),
                                subtitle: Text('Quantity : ' +
                                    products[index]['quantity'].toString()),
                                leading: Image.network(
                                  asyncSnapshot.data['image'],
                                  height: 50,
                                  width: 50,
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ),
                            );
                          }
                          return const LinearProgressIndicator();
                        },
                        future: ApiServices()
                            .singleProductData(products[index]["productId"]),
                      ),
                    );
                  },
                  itemCount: products.length,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: ApiServices().cartData('2'),
        ),
        bottomNavigationBar: InkWell(
          // ignore: avoid_returning_null_for_void
          onTap: () => null,
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.green,
            child: const Center(
              child: Text(
                'Order Now',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
