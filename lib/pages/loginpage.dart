import 'package:flutter/material.dart';

import '../constants.dart';
import 'homepage.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  var changebutton = false;
  final _key = GlobalKey<FormState>();
  @override
  nexttohome(BuildContext context) async {
    if (_key.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Constants.preferences.setBool("loggedin", true);
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => myhome()));
      setState(() {
        changebutton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child: Material(
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black26.withOpacity(0.7), BlendMode.srcOver),
              child: Image.asset(
                "assets/bg.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "enter user name",
                          hintStyle: TextStyle(color: Colors.white),
                          label: Text(
                            "USER NAME",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username cannot empty";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "enter user PASSWORD",
                          hintStyle: TextStyle(color: Colors.white),
                          label: Text(
                            "PASSWORD",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password cannot empty";
                          } else if (value.length < 6) {
                            return "password should atleast six digit";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () => nexttohome(context),
                      child: AnimatedContainer(
                        // color: Colors.blueGrey,
                        width: changebutton ? 50.0 : 90.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.blueGrey),
                        duration: Duration(seconds: 1),
                        child: Center(
                            child: changebutton
                                ? Icon(Icons.done)
                                : Text(
                                    "sign in",
                                    style: TextStyle(color: Colors.white),
                                  )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
