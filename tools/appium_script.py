#!/usr/bin/env python3
"""
This script uses Appium's Python client to:
- Connect to an Appium server and start a session for an iOS app.
- Capture a screenshot before clicking a button labeled "Start".
- Click the "Start" button.
- Capture another screenshot after clicking.
- Dump the final UI hierarchy as XML.
- Save the screenshots and XML file for further inspection.
"""

import time
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy

import os

def main():

    app_path = os.getenv('APP_PATH', '$GITHUB_WORKSPACE/build/MASTestApp.xcarchive/Products/Applications/MASTestApp.app')

    desired_caps = {
        "platformName": "iOS",
        "platformVersion": "17.4",  # Matches your IPHONEOS_DEPLOYMENT_TARGET
        "deviceName": "iPhone Simulator",  # Adjust if necessary (e.g., "iPhone 14")
        "automationName": "XCUITest",
        "app": app_path,  # Use the built app's path from the GitHub Actions environment
        "noReset": True
        # Optionally, you could add the bundle ID if attaching to an already-installed app:
        # "bundleId": "org.owasp.mastestapp.MASTestApp-iOS",
    }


    # Connect to the Appium server (make sure it is running).
    driver = webdriver.Remote("http://localhost:4723/wd/hub", desired_caps)
    driver.implicitly_wait(10)

    # Allow the app to fully load.
    time.sleep(5)

    # Capture a screenshot before clicking the "Start" button.
    driver.save_screenshot("before_start.png")
    print("Saved screenshot: before_start.png")

    # Locate and click the "Start" button using its accessibility ID.
    try:
        start_button = driver.find_element(AppiumBy.ACCESSIBILITY_ID, "Start")
        start_button.click()
        print("Clicked the 'Start' button.")
    except Exception as e:
        print(f"Error: Unable to locate or click the 'Start' button. Details: {e}")
        driver.quit()
        return

    # Wait for any UI transition after the click.
    time.sleep(3)

    # Capture a screenshot after clicking the "Start" button.
    driver.save_screenshot("after_start.png")
    print("Saved screenshot: after_start.png")

    # Dump the final UI hierarchy as XML.
    xml_dump = driver.page_source
    with open("final_screen.xml", "w", encoding="utf-8") as f:
        f.write(xml_dump)
    print("Saved final UI dump to: final_screen.xml")

    # End the Appium session.
    driver.quit()

if __name__ == '__main__':
    main()
