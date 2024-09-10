//
//  GetNowPlayingMovieTestCase.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import XCTest
@testable import Banquemisr_challenge05

final class GetNowPlayingMovieTestCase: XCTestCase {


    var mockRepository: MockMovieRepoImp!
    var mockDBManager: DBManager!
    var nowPlayingUseCase: GetNowPlayingUseCase!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        mockRepository = MockMovieRepoImp()
        mockDBManager = DBManager()
        nowPlayingUseCase = GetNowPlayingUseCase(moviesRepository: mockRepository, dbManager: mockDBManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockRepository = nil
        mockDBManager = nil
        nowPlayingUseCase = nil
    }

    func testCase_testGetMoviesViaAPI() async throws {

        let movies = try await nowPlayingUseCase.fetch()
        XCTAssertEqual(movies, [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testNowPlaying")])
    }

    func testCase_testMoviesSavedInDB() async throws {

        let movies = try await nowPlayingUseCase.fetch()
        XCTAssertEqual(movies, mockDBManager.loadCachedMovies(for: .nowPlaying))
    }
}
