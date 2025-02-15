import 'package:flutter/material.dart';
import 'package:testing_app/component_widget/component_button.dart';
import 'package:testing_app/main.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Welcome", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),key: ValueKey("welcome"),),centerTitle: true,),
       body:Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
             children: [
           ComponentButton(
               key: Key("rest"),
               KeyCompB: ValueKey("restaurantClick"),
               label: "Restuarent List",
               onPress: (){
                 Navigator.pushNamed(context, LoginAutomationTestingWithAppium.restaurant_name);
               }
           ),
          SizedBox(height: 40,),
          ComponentButton(
          key: Key("log"),
          KeyCompB: ValueKey("logout"),
          label: "LogOut",
          onPress: (){
            Navigator.pushReplacementNamed(context, LoginAutomationTestingWithAppium.Login);
          }
          ),
         ]),
       )
    );
  }
}
