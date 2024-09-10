//
//  MockMovieRepoImp.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import Foundation
struct MockMovieRepoImp : MoviesRepository {
    func GetNowPlayingMovies() async throws -> [Movie] {
        return [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testNowPlaying")]
    }

    func GetPopularMovies() async throws -> [Movie] {
        return [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testPopular")]
    }

    func GetUpcomingMovies() async throws -> [Movie] {
        return [Movie(id: 1, originalTitle: "", overview: "", posterPath: "", releaseDate: "", title: "testUpcoming")]
    }

    func GetMovieDetail(by id: Int) async throws -> MovieDetailsEntity {
        return MovieDetailsEntity(adult: nil, backdropPath: nil, budget: nil, genres: [], homepage: nil, id: 1, imdbID: nil, originCountry: nil, originalLanguage: nil, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, releaseDate: nil, revenue: nil, runtime: nil, status: nil, tagline: nil, title: "MovieDetailsTest1", video: nil, voteAverage: nil, voteCount: nil)
    }

}
