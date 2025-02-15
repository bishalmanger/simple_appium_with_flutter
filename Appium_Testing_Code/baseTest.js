const wdio = require("webdriverio");
const { androidCaps, iosCaps } = require("./test-config");

class BaseTest {
    async init(Platform = "android") {
        const capabilities = Platform === "ios" ? iosCaps : androidCaps;

        console.log('Connecting to Appium with the following capabilities:', capabilities);

        try {
            this.driver = await wdio.remote({
                hostname: '127.0.0.1',
                port: 4723,
                capabilities,
            });
            console.log('Connected to Appium successfully');
        } catch (error) {
            console.error('Failed to connect to Appium:', error);
        }
    }

    async tearDown() {
        if (this.driver) {
            await this.driver.deleteSession();
            console.log('Session ended');
        }
    }
}

module.exports = BaseTest;