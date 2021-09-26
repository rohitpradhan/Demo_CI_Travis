//
//  RoP_TestingSampleUITests.swift
//  RoP_TestingSampleUITests
//
//  Created by Rohit Pradhan on 06/08/21.
//

import XCTest

class RoP_TestingSampleUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
      try super.setUpWithError()
      continueAfterFailure = false
      app = XCUIApplication()
      app.launch()
    }

    func testInitialUI() throws {
        // given
        let welcomeLabel = app.staticTexts["welcome"]
        let getNewFactButton = app.buttons["Get New Fact"]

        // then
        XCTAssertTrue(welcomeLabel.exists)
        XCTAssertTrue(getNewFactButton.exists)
    }

}
