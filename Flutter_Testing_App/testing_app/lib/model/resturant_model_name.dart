class Restaurant_Model_Name
{
   final String restaurantName;
   final String restaurantLogo;
   List<String> restaurantMenu;

   Restaurant_Model_Name({required this.restaurantName, required this.restaurantLogo, required this.restaurantMenu});

   factory Restaurant_Model_Name.fromjson(Map<String, dynamic> json)
   {
      return Restaurant_Model_Name(
          restaurantName: json["restaurant_name"] ?? "Unknown",
          restaurantLogo: json["restaurant_logo"] ?? "Unknown",
          restaurantMenu: List<String>.from(json['menu'])
      );
   }
}