const fs = require('fs');
const restaurantJsonData = "../data/restaurantName.json";  // Check for any typos in the filename

fs.readFile(restaurantJsonData, 'utf8', (error, data) => {
    if (error) {
        console.log("Error reading JSON data:", error);  // Show the actual error
        return;
    }

    try {
        const jsonData = JSON.parse(data);  // Parse the JSON data
        console.log(jsonData);  // Now you can use jsonData
    } catch (parseError) {
        console.log("Error parsing JSON data:", parseError);
    }
});
