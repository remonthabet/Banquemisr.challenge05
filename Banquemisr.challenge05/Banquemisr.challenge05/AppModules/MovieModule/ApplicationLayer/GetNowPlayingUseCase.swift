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
    
    func fetch() async throws -> [Movie] {
        return try await moviesRepository.getNowPlayingMovies()
    }
}
