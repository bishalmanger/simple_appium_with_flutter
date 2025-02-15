import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:testing_app/model/resturant_model_name.dart';

import '../JSON_Data_Call/resturant_name_manue_call.dart';

// void main()
// {
//    runApp(RestaurantList());
// }

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {

  late Future<List<Restaurant_Model_Name>> restaurantList;

  @override
  void initState() {
    super.initState();
    restaurantList = Restaurant_Name_Manue().FetchResturant_Name();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Restaurants List", key: ValueKey("restaurantList"),), centerTitle: true,
          leading: IconButton(onPressed: (){
             Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back),
        ),),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
                future: restaurantList,
                builder: (context, Data) {
                  if (Data.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else if (Data.data == null || Data.data!.isEmpty) {
                    return Center(child: Text("Data is not found"),);
                  }
                  else if (Data.hasError) {
                    return Center(child: Text("Error: ${Data.error}"),);
                  }
                  else {
                    return ListView.builder(
                        itemCount: Data.data!.length,
                        itemBuilder: (context, index) {
                          final finalData = Data.data![index];
                          return Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),


                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  key: ValueKey(index),
                                  onTap: () {
                                    DisplayRestaurant_Menu(
                                        context, finalData.restaurantName,
                                        finalData.restaurantMenu);
                                  },
                                  child: Image.network(finalData.restaurantLogo,
                                    fit: BoxFit.cover,),

                                ),
                                // SizedBox(height: 60,),
                                Text(
                                  finalData.restaurantName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }
                }
            )
        ),
    );
  }

  void DisplayRestaurant_Menu(BuildContext context, String restaurantName,
      List<String> restaurantMenu) {
    bool? _checkboxValue = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text("${restaurantName} Menu List", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20), key: ValueKey("DisplayMenu")),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200, // Fixed height to prevent overflow
                  child: ListView.builder(
                    key: ValueKey("listview_builder"),
                    itemCount: restaurantMenu.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Checkbox(
                            value: _checkboxValue,
                            onChanged: (bool? value) {
                              setState(() => _checkboxValue = value);
                            },
                          ),
                          Text("${restaurantMenu[index]}",
                            style: TextStyle(fontSize: 12),),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel", style: TextStyle(fontSize: 14),),
                    ),
                    TextButton(
                      key: ValueKey("ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK", style: TextStyle(fontSize: 14),key: ValueKey("close"),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}