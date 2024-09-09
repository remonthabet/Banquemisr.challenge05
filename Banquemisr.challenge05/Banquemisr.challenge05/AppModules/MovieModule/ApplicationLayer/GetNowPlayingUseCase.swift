//
//  GetNowPlayingUseCase.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
import Combine
struct GetNowPlayingUseCase {
    private let moviesRepository: MoviesRepository

    init(moviesRepository: MoviesRepository = MoviesRepositoryImp()) {
        self.moviesRepository = moviesRepository
    }

    func execute() async throws -> [Movie] {
        let movie = try await moviesRepository.GetNowPlayingMovies()
        return movie.results ?? []

    }
}
