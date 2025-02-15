const find  = require('appium-flutter-finder');
const{expect} = require('chai');

class HomePage {
    constructor(driver) {
      this.driver = driver;
    }
   
    
    // Example element selectors for home screen
    get welcomeBanner() 
    {  
      return find.byValueKey("welcome"); 
    }
  
    // Method to verify the home screen is displayed
    async isDisplayed() {

      //Methiod 1
      const welcomeText = await this.driver.getElementText(this.welcomeBanner);
      expect(welcomeText).to.equal("Welcome");
      return welcomeText === "Welcome"; // This returns a boolean
    }

  }
  
  module.exports = HomePage;