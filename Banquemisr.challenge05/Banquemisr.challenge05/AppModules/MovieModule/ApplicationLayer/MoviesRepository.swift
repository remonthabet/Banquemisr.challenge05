//
//  MoviesRepository.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
import Combine
protocol MoviesRepository {
    func GetNowPlayingMovies() async throws -> MovieEntity
    func GetPopularMovies() async throws -> MovieEntity
    func GetUpcomingMovies() async throws -> MovieEntity
    func GetMovieDetail(by id: Int) async throws -> MovieDetailsEntity
}
