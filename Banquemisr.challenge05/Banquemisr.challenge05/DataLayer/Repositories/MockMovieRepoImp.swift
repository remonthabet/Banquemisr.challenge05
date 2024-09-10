//
//  MockMovieRepoImp.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import Foundation
struct MockMovieRepoImp : MoviesRepository {
    func getNowPlayingMovies() async throws -> [Movie] {
        return [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testNowPlaying")]
    }
    
    func getPopularMovies() async throws -> [Movie] {
        return [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testPopular")]
    }
    
    func getUpcomingMovies() async throws -> [Movie] {
        return [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testUpcoming")]
    }
}
