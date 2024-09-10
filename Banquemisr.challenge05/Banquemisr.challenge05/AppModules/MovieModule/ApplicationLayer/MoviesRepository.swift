//
//  MoviesRepository.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
import Combine
protocol MoviesRepository {
    func GetNowPlayingMovies() async throws -> [Movie]
    func GetPopularMovies() async throws -> [Movie]
    func GetUpcomingMovies() async throws -> [Movie]
    func GetMovieDetail(by id: Int) async throws -> MovieDetailsEntity
}
