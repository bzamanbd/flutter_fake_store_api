import 'package:flutter/material.dart';
import 'package:flutter_fake_store_api/screens/products_overview_screen.dart';
import 'package:flutter_fake_store_api/services/api_services.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  TextEditingController passController = TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Nice Shop'),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height / 20,
                  horizontal: size.width / 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        label: Text('Username'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    TextField(
                      controller: passController,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    SizedBox(
                      height: size.height / 10,
                      width: size.width,
                      child: ElevatedButton(
                          onPressed: () async {
                            try {
                              final getToken = await ApiServices().userLogin(
                                  nameController.text, passController.text);
                              if (getToken['token'] != null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      'Success ! Your Login token is ${getToken['token']} '),
                                  backgroundColor: Colors.green,
                                ));
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductsOverviewScreen()));
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text('Incorrect Username or Password'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            } catch (error) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Check Your Username & Password',textAlign: TextAlign.center,),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ));
                            }

                          },
                          child: const Text(
                            'Login',
                            textScaleFactor: 1.3,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
