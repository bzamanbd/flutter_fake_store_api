import 'package:flutter/material.dart';
import '../models/fruit.dart';
import '../services/api_services.dart';

class FruitsOverviewScreen extends StatelessWidget {
  const FruitsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Fruit fruit = snapshot.data[index];
                    return ListTile(
                      title: Text(fruit.name),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
          future: ApiServices().getAllFruits(),
        ),
      ),
    );
  }
}
