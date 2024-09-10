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
    private let dbManager: DBManager

    init(moviesRepository: MoviesRepository = MoviesRepositoryImp(), dbManager: DBManager = DBManager()) {
        self.moviesRepository = moviesRepository
        self.dbManager = dbManager
    }

    func fetch() async throws -> [Movie] {
        let isConnected = await AppHelper.checkInternetConnection()

        if isConnected {
            let movies = try await moviesRepository.GetNowPlayingMovies()
            dbManager.saveMovies(movies, for: .nowPlaying)
            return movies
        } else {
            return try await fetchFromDB()
        }
    }

    func fetchFromDB() async throws -> [Movie] {
        if let cachedMovies = dbManager.loadCachedMovies(for: .nowPlaying) {
            return cachedMovies
        }
        return []
    }
}
