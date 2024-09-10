//
//  GetUpcomingMoviesTestCase.swift
//  Banquemisr.challenge05Tests
//
//  Created by remon on 11/09/2024.
//

import XCTest
@testable import Banquemisr_challenge05

final class GetUpcomingMoviesTestCase: XCTestCase {

    var mockRepository: MockMovieRepoImp!
    var mockDBManager: DBManager!
    var upcomingUseCase: GetUpcomingUseCase!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        mockRepository = MockMovieRepoImp()
        mockDBManager = DBManager()
        upcomingUseCase = GetUpcomingUseCase(moviesRepository: mockRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockRepository = nil
        mockDBManager = nil
        upcomingUseCase = nil
    }

    func testCase_testGetMoviesViaAPI() async throws {

        let movies = try await upcomingUseCase.fetch()
        XCTAssertEqual(movies, [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testUpcoming")])
    }

    func testCase_testMoviesSavedInDB() async throws {

        let movies = try await upcomingUseCase.fetch()
        mockDBManager.saveMovies(movies, for: .upcoming)
        XCTAssertEqual(movies, mockDBManager.loadCachedMovies(for: .upcoming))
    }

}
