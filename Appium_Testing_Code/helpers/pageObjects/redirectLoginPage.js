const{expect} = require('chai');
const find = require('appium-flutter-finder');

class RedirectLoginPage
{
    constructor(driver)
    {
         this.driver = driver;
    }
     get LoginPageBanner()
        {
             return find.byValueKey('loginpage');
        }

        async displayLoginPageFun()
        {
           try
           {
            const loginPage = await this.driver.getElementText(this.LoginPageBanner);
            expect(loginPage).to.equal('Login_page');
            return loginPage === 'Login_page';
           }
           catch(error)
           {
              console.log("Error navigate to login page fun: ", error);
           }
        }    
}
module.exports = RedirectLoginPage;