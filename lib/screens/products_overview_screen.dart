import 'package:flutter/material.dart';
import 'package:flutter_fake_store_api/screens/product_details_screen.dart';
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
        ),
        body: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: size.width/15,
                          vertical: size.height/30),
                      child: ListTile(
                        leading: Image.network(
                          snapshot.data[index]['image'],
                          height: size.height/8,
                          width: size.width/8,
                        ),
                        title: Text(snapshot.data[index]['title'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            )),
                        subtitle: Text('Price: \$' +
                            snapshot.data[index]['price'].toString()),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                      id: snapshot.data[index]['id'])));
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
