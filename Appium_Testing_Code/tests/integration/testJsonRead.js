const path = require('path');
const fs = require('fs');

// Use relative path based on the current working directory
const restaurantJsonData = path.join(__dirname, "../data/RD.json"); // Correct path
// const filePath = 'C:/Appium_Roadmap_Practice/Appium_Testing_Code/tests/data/RD.json';
let jsonData = [];

fs.readFile(restaurantJsonData, 'utf8', (error, data) => {
    if (error) {
        console.log("Error reading JSON data:", error);
        return;
    }

    // Parse the JSON data
    jsonData = JSON.parse(data);

    // Loop through the JSON data and print each restaurant's ID and Name
    jsonData.forEach(element => {
        console.log("ID: ", element['restaurantId'], "Name: ", element['restaurantName']);
    });
});
module.exports = jsonData;
