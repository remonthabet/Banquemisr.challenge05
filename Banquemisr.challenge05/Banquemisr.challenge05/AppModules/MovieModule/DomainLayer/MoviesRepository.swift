//
//  MoviesRepository.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
import Combine
protocol MoviesRepository {
    func getNowPlayingMovies() async throws -> [Movie]
    func getPopularMovies() async throws -> [Movie]
    func getUpcomingMovies() async throws -> [Movie]
}
