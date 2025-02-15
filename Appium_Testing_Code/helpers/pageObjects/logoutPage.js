const find = require('appium-flutter-finder');
const {expect} = require('chai');

class LogoutPage{
    constructor(driver) {
        this.driver = driver; // Assign the driver to a property of the class
    }
    get LogOutClick()
    {
         return find.byValueKey('logout');
    }
    async LogoutPageFun() {
        try {
            console.log("Attempting to click logout button");
            await this.driver.elementClick(this.LogOutClick);
            console.log("Clicked logout button successfully");
        } catch (error) {
            console.error("Error during logout: ", error);
            throw error;
        }
    }
}
module.exports = LogoutPage;