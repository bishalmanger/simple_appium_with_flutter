// test-config.js
// test-config.js
module.exports ={
    androidCaps:{
        platformName: 'android',
      'appium:deviceName': 'emulator-5554',
      'appium:platformVersion': '15',
      'appium:automationName':'Flutter',
      'appium:app': "C:/Appium_Roadmap_Practice/Flutter_Testing_App/testing_app/build/app/outputs/apk/debug/app-debug.apk", 
      'appium:noReset': true,
      // accessibilityIdEnabled: true
    },
    iosCaps:{
        platformName: 'iOS',
      'appium:platformVersion': '12.2',
      'appium:deviceName': 'iPhone X',
      'appium:noReset': true,
      'appium:app': 'Runner.zip',
      'appium:automationName':'Flutter',
    }
}
