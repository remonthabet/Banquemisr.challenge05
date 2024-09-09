//
//  MoviesRepositoryImp.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
import Combine
struct MoviesRepositoryImp : MoviesRepository {

    fileprivate let provider: NetworkProviderProtocol
    init(provider: NetworkProviderProtocol = DefaultAppNetworkProvider()) {
        self.provider = provider
    }

    func GetNowPlayingMovies() async throws -> MovieEntity {
        let endpoint = MoviesEndPoint.getNowPlayingMovies

        return try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
    }
    
    func GetPopularMovies() async throws -> MovieEntity {
        let endpoint = MoviesEndPoint.getPopularMovies

        return try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
    }
    
    func GetUpcomingMovies() async throws -> MovieEntity {
        let endpoint = MoviesEndPoint.getUpcomingMovies

        return try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
    }
    
    func GetMovieDetail(by id: Int) async throws -> MovieDetailsEntity{
        let endpoint = MoviesEndPoint.getMovieDetailById(id)

        return try await provider.get(type: MovieDetailsEntity.self, endpoint: endpoint).asAsync()
    }

}
