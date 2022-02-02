import 'package:flutter/material.dart';
import 'package:flutter_fake_store_api/screens/single_category.dart';
import 'package:flutter_fake_store_api/services/api_services.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Categories'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: ()=>Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>
                      SingleCategory(catName: snapshot.data[index])
                      )),
                      child: Card(
                        elevation: 1,
                        margin:  const EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(40.0),
                          child: Center(
                            child: Text(snapshot.data[index].toString().toUpperCase(),
                            style: TextStyle(
                              fontSize:16.0,
                              color: Theme.of(context).primaryColor,
                            ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            future: ApiServices().allCategoriesData(),
          ),
        ),
      ),
    );
  }
}
