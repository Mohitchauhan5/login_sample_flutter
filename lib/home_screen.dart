import 'package:flutter/material.dart';
import 'package:loginapp/signup_screen.dart';
import 'package:loginapp/storageData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? pref;
  String? value;

  void initState() {
    retrieveStringValue();
    super.initState();
  }

  retrieveStringValue() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      value = pref?.getString("username");

      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.orange, Colors.orange, Colors.orange])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      )),
                  Container(
                      child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          },
                          icon: Icon(
                            Icons.login_outlined,
                            color: Colors.white,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.circle_notifications,
                            color: Colors.white,
                            size: 30,
                          )),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hi,",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  // FadeAnimation(1,
                  //     Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    value!,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                  // FadeAnimation(1.3, Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
