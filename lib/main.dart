import 'package:flutter/material.dart';
import 'package:loginapp/home_screen.dart';
import 'package:loginapp/signup_screen.dart';
import 'package:loginapp/storageData.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ));

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? pref;
  String? valueEmail;
  String? valuePassword;

  void initState() {
    retrieveStringValue();
    super.initState();
  }

  retrieveStringValue() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      valueEmail = pref?.getString("useremail");
      valuePassword = pref?.getString("userpassword");
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
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  // FadeAnimation(1,
                  //     Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                  // FadeAnimation(1.3, Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        // FadeAnimation(1.4,
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      /* border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))*/
                                      ),
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email can not be empty';
                                      } else if (emailController.text !=
                                          valueEmail) {
                                        return 'Please enter valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password can not be empty';
                                      } else if (passwordController.text !=
                                          valuePassword) {
                                        return 'Wrong password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //)
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //  FadeAnimation(1.5,
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        //  ),
                        const SizedBox(
                          height: 40,
                        ),
                        //  FadeAnimation(1.6,
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (emailController.text == valueEmail &&
                                  passwordController.text == valuePassword) {
                                print('sucess');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900]),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            //  )
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // FadeAnimation(1.7,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do not have an account?",
                              style: TextStyle(color: Colors.grey),
                              //)
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupScreen()));
                              },
                              child: Text(
                                "SIGNUP",
                                style: TextStyle(color: Colors.orange),
                                //)
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

passwordValidater(String? text) {
  if (text!.isEmpty) {
    return "Password can not be empty";
  }
}

emailValidater(String? text) {
  if (text!.isEmpty) {
    return "Email can not be empty";
  }
}
