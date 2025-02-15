const BaseTest = require("../../baseTest");
const LoginPage = require("../../helpers/pageObjects/loginPage");
const LogoutPage = require("../../helpers/pageObjects/logoutPage");
const HomePage = require("../../helpers/pageObjects/homePage");
const RedirectLoginPage = require("../../helpers/pageObjects/redirectLoginPage.js");
const RestaurantPage = require("../../helpers/pageObjects/restaurantPage.js");
const loginData = require("../data/loginData.json");
const { expect} = require("chai");

const Mochawesome = require('mochawesome');

describe("Integration Test: Login Flow", function () {
  let test, loginPage, homePage;
  let isloginSuccess;
  this.timeout(30000);

  before(async function () {
    test = new BaseTest();
    await test.init("android");
    loginPage = new LoginPage(test.driver);
    homePage = new HomePage(test.driver);
    logoutPage = new LogoutPage(test.driver);
    redirectLoginPage = new RedirectLoginPage(test.driver); 
  });

  it("should login first successfully with valid credentials", async function () {
    await loginPage.login(loginData.valid.emailid, loginData.valid.password);
    const displayed = await homePage.isDisplayed();
    console.log("home page displayed",displayed);
    expect(displayed).to.be.true;
  
  });


  it("Should logout", async function () {
    await logoutPage.LogoutPageFun();
    const logstatus = await redirectLoginPage.displayLoginPageFun();
    expect(logstatus).to.be.true;
  });


  it("should not login with invalid credentials", async function () {
    await loginPage.login(loginData.invalid.emailid, loginData.invalid.password);
    expect(await test.driver.getElementText(await loginPage.loginStatus)).to.equal('failed');
    console.log(await loginPage.logstatus);
  });


  it("should login Second successfully with valid credentials", async function () {
    await loginPage.login(loginData.valid.emailid, loginData.valid.password);
    const displayed = await homePage.isDisplayed();
    console.log("home page displayed",displayed);
    expect(displayed).to.be.true;
  });

  after(async function () {
    await test.tearDown();

  });
});
