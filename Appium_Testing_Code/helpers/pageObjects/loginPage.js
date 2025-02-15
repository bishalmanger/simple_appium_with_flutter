const find  = require('appium-flutter-finder');
const{expect} = require('chai');

class LoginPage {
    constructor(driver) {
        this.driver = driver;
    }

    // Define selectors using accessibility IDs
    get usernameInput() {
        return find.byValueKey('username_input');
    }
    get passwordInput() {
        return find.byValueKey('password_input');
    }
    get loginButton() {
        return find.byValueKey('login_button');
    }
     get loginStatus ()  { 
        return find.byValueKey('loginCheck'); 
    }

    // Methods to perform actions
    async login(username, password) {
        try{
        await this.driver.elementSendKeys(this.usernameInput, username);
        await this.driver.elementSendKeys(this.passwordInput, password);
        
        await this.driver.elementClick(this.loginButton);
    }catch(error){
        console.log("error",error);
    }
    }
}
module.exports = LoginPage;