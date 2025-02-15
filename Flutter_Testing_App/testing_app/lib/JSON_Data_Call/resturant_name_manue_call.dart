import 'dart:convert';
import 'package:flutter/services.dart' as rootbundle;
import 'package:testing_app/model/resturant_model_name.dart';

class Restaurant_Name_Manue
{
  Future<List<Restaurant_Model_Name>> FetchResturant_Name() async
  {
     try
         {
           final String response = await rootbundle.rootBundle.loadString("json_data/restaurants_name.json");
           final dataList = json.decode(response);
           return dataList.map<Restaurant_Model_Name>((restaurant) => Restaurant_Model_Name.fromjson(restaurant)).toList();
         }
     catch (e)
    {
       throw Exception("Error: ${e}");
    }
  }
}








// import 'dart:convert';
//
// import 'package:flutter/services.dart' as rootbundle;
// import 'package:project/obj_test/test_obj_modal.dart';
//
// class Test_Obj_Call
// {
//   Future<List<Test_Obj_Modal>>  Get_Test_Obj_Modal() async
//   {
//     try
//     {
//       final response = await rootbundle.rootBundle.loadString('assets/All_Types_JSON/All_JSON_Object_Types/Obj_JSON_Data.json');
//
//       final DataList =  json.decode(response);
//
//       print(DataList);
//
//       return DataList.map<Test_Obj_Modal>((json) => Test_Obj_Modal.fromjson(json)).toList();
//     }
//     catch(e)
//     {
//       throw Exception(e);
//     }
//   }
// }