//
//  MainFailureUITests.swift
//  JMapsUITests
//
//  Created by jorgemht on 5/2/23.
//

import XCTest

final class MainFailureUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testListCountElement() throws {
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let cv = app.otherElements.collectionViews["lista"]
        XCTAssert(cv.waitForExistence(timeout: 5), "The list should exist on the screen.")
        XCTAssertNotEqual(cv.cells.count, 3, "The list should not contain exactly 3 elements.")
    }

    func testListElementNotExists() throws {
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let cv = app.otherElements.collectionViews["lista"]
        XCTAssertFalse(cv.staticTexts["Jmaps Stadium"].exists, "The Jmaps Stadium should not exist in the list.")
    }
    
    func testListTapElement() throws {
        
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let cv = app.otherElements.collectionViews["lista"]
        
        XCTAssertTrue(cv.waitForExistence(timeout: 5), "The list should be visible on the screen")
        
        let firstItem = cv.cells.element(boundBy: 0)
        
        firstItem.tap()

        let titleSheet = app.staticTexts["titleSheet"]
          
        XCTAssert(titleSheet.waitForExistence(timeout: 5), "The sheet title should be visible on the screen")
        XCTAssertNotEqual(titleSheet.label, "Santiago Bernabéu", "The sheet title should not be 'Santiago Bernabéu'.")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
