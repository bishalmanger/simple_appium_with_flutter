const path = require("path");

module.exports = function () {
  // After each test, check if it failed and capture a screenshot
  afterEach(async function () {
    if (this.currentTest.state === "failed" && this.test.ctx && this.test.ctx.driver) {
      const screenshotDir = path.resolve(__dirname, "screenshots");
      if (!fs.existsSync(screenshotDir)) {
        fs.mkdirSync(screenshotDir);
      }
      const screenshotPath = path.join(
        screenshotDir,
        `${this.currentTest.fullTitle().replace(/\s+/g, "_")}.png`
      );
      await this.test.ctx.driver.saveScreenshot(screenshotPath);
      console.log(`Screenshot saved: ${screenshotPath}`);
    }
  });
};