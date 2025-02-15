class CartPage {
    constructor(driver) {
      this.driver = driver;
    }
  
    // Selectors for cart elements
    get cartItems() { return this.driver.$$("~cart_item"); }
    get checkoutButton() { return this.driver.$("~checkout_button"); }
  
    async getCartItemCount() {
      return (await this.cartItems).length;
    }
  
    async checkout() {
      await (await this.checkoutButton).click();
    }
  }
  
  module.exports = CartPage;