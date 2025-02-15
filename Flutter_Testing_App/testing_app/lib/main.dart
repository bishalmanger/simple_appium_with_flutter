import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'auth_reg_log/login.dart';
import 'auth_reg_log/reg.dart';
import 'view/home.dart';
import 'view/restaurants_list.dart';


void main()
{
    enableFlutterDriverExtension();
    runApp(LoginAutomationTestingWithAppium());
}
class LoginAutomationTestingWithAppium extends StatelessWidget {
  const LoginAutomationTestingWithAppium({super.key});

  static const String Login = "/login";
  static const String Reg = "/reg";
  static const String Home = "/home";
  static const String restaurant_name = "/restaurant";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: Login,
       routes: {
          Login: (context) => LoginScreenPage(),
          Reg: (context) => RegistrationScreenPage(),
          Home: (context) => HomeScreenPage(),
          restaurant_name: (context) => RestaurantList()
       },
      debugShowCheckedModeBanner: false,
    );
  }
}
