//
//  MainUITest.swift
//  JMapsUITests
//
//  Created by jorgemht on 6/2/23.
//

import XCTest

final class MainUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testScreenLoad() throws {
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()

        let cv = app.otherElements.collectionViews["lista"]
        XCTAssert(cv.waitForExistence(timeout: 5), "The list should be visible on the screen.")
    }

    func testListCountElement() throws {
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let cv = app.otherElements.collectionViews["lista"]
        XCTAssert(cv.waitForExistence(timeout: 5), "The list should exist on the screen.")
        XCTAssertEqual(cv.cells.count, 6, "There should be 6 elements in the list.")
    }

    func testListElement() throws {
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let cv = app.otherElements.collectionViews["lista"]
        
        XCTAssert(cv.staticTexts["Camp Nou"].waitForExistence(timeout: 5), "The 'Camp Nou' element should exist in the list.")
        XCTAssert(cv.staticTexts["Santiago Bernabéu"].waitForExistence(timeout: 5), "The 'Santiago Bernabéu' element should exist in the list.")
        XCTAssert(cv.staticTexts["Estadio Metropolitano"].waitForExistence(timeout: 5), "The 'Estadio Metropolitano' element should exist in the list.")
    }

    func testListTapElement() throws {
        
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let cv = app.otherElements.collectionViews["lista"]
        
        XCTAssertTrue(cv.waitForExistence(timeout: 5), "The list should exist on the screen")
        
        let itemList = cv.cells.element(boundBy: 1)
        
        itemList.tap()

        let labelSheet = app.staticTexts["titleSheet"]
          
        XCTAssert(labelSheet.waitForExistence(timeout: 5), "The element should exist on the screen")
        XCTAssertEqual(labelSheet.label, "Santiago Bernabéu", "The sheet title should be Santiago Bernabéu.")
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
