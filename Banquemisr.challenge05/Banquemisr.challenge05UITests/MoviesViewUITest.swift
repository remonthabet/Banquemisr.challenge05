//
//  MoviesViewUITest.swift
//  Banquemisr.challenge05UITests
//
//  Created by remon on 10/09/2024.
//

import XCTest

final class MoviesViewUITest: XCTestCase {


    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testCase_testMoviesListExist() throws {

        app.buttons["Now playing"].tap()

          let firstCell = app.cells.element(boundBy: 0)

          XCTAssertTrue(firstCell.exists, "movies exists")
      }

      func testCase_testNoMoviesLabelNotExist() throws {

          app.buttons["Now playing"].tap()

          let noMovieText = app.staticTexts["No Movies"]
          XCTAssertFalse(noMovieText.exists, "no movies returned")
      }

      func testCase_testNavigationToMovieDetails() throws {
          app.buttons["Now playing"].tap()

          let firstCell = app.cells.element(boundBy: 0)
          XCTAssertTrue(firstCell.exists, "first movie exist")
          firstCell.tap()

          // Check if the details view is displayed
          let imageElement = app.images.element(boundBy: 0)
          XCTAssertTrue(imageElement.exists, "details view exist")
      }

}
