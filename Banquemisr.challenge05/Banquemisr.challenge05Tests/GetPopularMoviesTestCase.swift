//
//  GetPopularMoviesTestCase.swift
//  Banquemisr.challenge05Tests
//
//  Created by remon on 11/09/2024.
//

import XCTest
@testable import Banquemisr_challenge05

final class GetPopularMoviesTestCase: XCTestCase {

    var mockRepository: MockMovieRepoImp!
    var mockDBManager: DBManager!
    var popularUseCase: GetPopularUseCase!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        mockRepository = MockMovieRepoImp()
        mockDBManager = DBManager()
        popularUseCase = GetPopularUseCase(moviesRepository: mockRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockRepository = nil
        mockDBManager = nil
        popularUseCase = nil
    }

    func testCase_testGetMoviesViaAPI() async throws {

        let movies = try await popularUseCase.fetch()
        XCTAssertEqual(movies, [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testPopular")])
    }

    func testCase_testMoviesSavedInDB() async throws {

        let movies = try await popularUseCase.fetch()
        mockDBManager.saveMovies(movies, for: .popular)
        XCTAssertEqual(movies, mockDBManager.loadCachedMovies(for: .popular))
    }

}
