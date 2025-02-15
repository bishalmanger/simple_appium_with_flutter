const find = require('appium-flutter-finder');
const { expect } = require('chai');
const fs = require('fs');
const path = require('path');

// Use the relative path to the JSON file
const restaurantJsonData = path.join(__dirname, '..', '..', 'tests', 'data', 'RD.json');

// Read the JSON file
let jsonData = [];
let restaurantId = [];
let restaurantName = [];
fs.readFile(restaurantJsonData, 'utf8', (error, data) => {
    if (error) {
        console.log("Error reading JSON data:", error);
        return;
    }

    // Parse the JSON data
    jsonData = JSON.parse(data);

    // Loop through the JSON data and print each restaurant's ID and Name
    jsonData.forEach(element => {
        restaurantId.push(element["restaurantId"]);
        restaurantName.push(element['restaurantName']);
        console.log("ID: ", element['restaurantId'], "Name: ", element['restaurantName']);
    });
});

class RestaurantPage {
    constructor(driver) {
      this.driver = driver;
      this.index = 0; // Single index for restaurant navigation
    }
  
    // Selectors for restaurant details
    get clickRestaurantButton() { 
      return find.byValueKey('restaurantClick'); 
    }

    get naviagteResturantPage() {
      return find.byValueKey("restaurantList");
    }
  
    async getRestaurantName() {
      try {
        console.log("Reach to the Restaurant Button to click");
        await this.driver.elementClick(this.clickRestaurantButton);
        console.log("Restaurant button successfully Clicked");
      } catch (error) {
        console.log("Error While Navigating: ", error);
      }
    }

    async naviagetfun() {
      const restaurantStatus = await this.driver.getElementText(this.naviagteResturantPage);
      expect(restaurantStatus).to.equal('Restaurants List');
      console.log("Status of the Restaurant Navigation: ", restaurantStatus);
      return restaurantStatus === 'Restaurants List';
    }

    // Getter for dynamically selecting restaurant buttons
    get getHotlix() {
        if (this.index < restaurantId.length) {
            console.log("Restaurant ID: ", restaurantId[this.index]);
            return find.byValueKey(restaurantId[this.index]); // Use the current restaurantId
        }
        return null; // Return null if index exceeds the array length
    }

    get navigatePopUpPage() {
        return find.byValueKey("DisplayMenu");
    }

    get closePopUp() {
        return find.byValueKey("ok");
    }

    async tabHotLixFun() {
        console.log("Test: Reach to Click Menu");
        await this.driver.elementClick(this.getHotlix);
        console.log("Successfully Clicked");
    }

    async getHotlixCompNab() {
      const hotlixT = await this.driver.getElementText(this.navigatePopUpPage);
      // Check the restaurant name dynamically based on the index
      const expectedName = restaurantName[this.index];
      expect(hotlixT).to.equal(expectedName);
      console.log(`Restaurant Name: ${expectedName}`);
      
      // Increment index after each validation
      this.index++;
      console.log("Restaurant Name: ",restaurantName[this.index]);
      console.log("Restaurant Name via App: ",restaurantName[this.index]);
        return hotlixT === expectedName;
    }

    async closePopUpFun() {
        await this.driver.elementClick(this.closePopUp);
    }
}

module.exports = RestaurantPage;
