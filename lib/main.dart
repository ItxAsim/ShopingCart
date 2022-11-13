import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopingcart/pages/homepage.dart';
import 'package:shopingcart/pages/loginpage.dart';
import 'package:shopingcart/pages/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'constants.dart';
import 'data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.preferences = await SharedPreferences.getInstance();
  runApp(VxState(
    store: mystore(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.preferences.getBool("loggedin") == true
          ? const myhome()
          : const loginpage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    ),
  ));
}
