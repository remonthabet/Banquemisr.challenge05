//
//  Banquemisr_challenge05UITests.swift
//  Banquemisr.challenge05UITests
//
//  Created by remon on 05/09/2024.
//

import XCTest

final class HomeViewUITest: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }



    func testCase_testTapsExitsAndSelection() throws {

        // now playing tab
        let nowPlayingTab = app.buttons["Now playing"]
        XCTAssertTrue(nowPlayingTab.exists, "nowPlaying should exist")
        nowPlayingTab.tap()
        XCTAssertTrue(app.staticTexts["Now playing"].exists, "now playing should be shown")

        // popular tab
        let popularTab = app.buttons["Popular"]
        XCTAssertTrue(popularTab.exists, "Popular should exist")
        popularTab.tap()
        XCTAssertTrue(app.staticTexts["Popular"].exists, "Popular should be shown")

        // upcoming tab
        let upcomingTab = app.buttons["Upcoming"]
        XCTAssertTrue(upcomingTab.exists, "Upcoming should exist")
        upcomingTab.tap()
        XCTAssertTrue(app.staticTexts["Upcoming"].exists, "Upcoming should be shown")

    }


}
