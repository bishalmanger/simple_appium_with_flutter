const BaseTest = require("../../baseTest.js");
const HomePage = require("../../helpers/pageObjects/homePage.js");
const RestaurantPage = require("../../helpers/pageObjects/restaurantPage.js");
const CartPage = require("../../helpers/pageObjects/cartPage.js");
const orderData = require("../data/orderData.json");
const { expect } = require("chai");
const {status} = require('./loginFlowTest.test.js');


describe("Integration Test: Order Placement Flow", function () {
  let test, homePage, restaurantPage, cartPage;
  this.timeout(50000);;

  before(async function () {
    test = new BaseTest();
    await test.init("android");
    homePage = new HomePage(test.driver);
    restaurantPage = new RestaurantPage(test.driver);
    cartPage = new CartPage(test.driver);
  });

  it("Should Navigate to the restaurant Page", async function(){
    await restaurantPage.getRestaurantName();
    const restDisplay = await restaurantPage.naviagetfun();
    expect(restDisplay).to.be.true;
});

//Test 1
it("Should tab to the HotLix and Show HotLix menu", async function() {
     await restaurantPage.tabHotLixFun();
     const status = await restaurantPage.getHotlixCompNab();
     expect(status).to.be.true;
});
it("Should close the Pop up HotLix menu", async function () {
  await restaurantPage.closePopUpFun();
});


//Test 2
it("Should tab to the Dominos and Show Dominos menu", async function() {
  await restaurantPage.tabHotLixFun();
  const status = await restaurantPage.getHotlixCompNab();
  expect(status).to.be.true;
});

it("Should close the Pop up Dominos menu", async function () {
await restaurantPage.closePopUpFun();
});


//Test 3
it("Should tab to the Zomato and Show Zomato menu", async function() {
  await restaurantPage.tabHotLixFun();
  const status = await restaurantPage.getHotlixCompNab();
  expect(status).to.be.true;
});

it("Should close the Pop up Zomato menu", async function () {
await restaurantPage.closePopUpFun();
});

//Test 4
it("Should tab to the KFC and Show KFC menu", async function() {
  await restaurantPage.tabHotLixFun();
  const status = await restaurantPage.getHotlixCompNab();
  expect(status).to.be.true;
});

it("Should close the Pop up KFC menu", async function () {
await restaurantPage.closePopUpFun();
});
  after(async function () {
    await test.tearDown();
  });
});