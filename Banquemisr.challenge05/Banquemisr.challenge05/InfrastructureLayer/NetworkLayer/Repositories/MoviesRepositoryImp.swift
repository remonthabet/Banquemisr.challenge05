//
//  MoviesRepositoryImp.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
import Combine
struct MoviesRepositoryImp : MoviesRepository {

    private let provider: NetworkProviderProtocol

    init(provider: NetworkProviderProtocol = DefaultAppNetworkProvider()) {
        self.provider = provider
    }

    func GetNowPlayingMovies() async throws -> [Movie] {
        let endpoint = MoviesEndPoint.getNowPlayingMovies
        
        let response = try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
        return response.results ?? []
    }
    
    func GetPopularMovies() async throws -> [Movie] {
        let endpoint = MoviesEndPoint.getPopularMovies

        let response = try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
        return response.results ?? []
    }

    func GetUpcomingMovies() async throws -> [Movie] {
        let endpoint = MoviesEndPoint.getUpcomingMovies

        let response = try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
        return response.results ?? []
    }

    func GetMovieDetail(by id: Int) async throws -> MovieDetailsEntity{
        let endpoint = MoviesEndPoint.getMovieDetailById(id)

        return try await provider.get(type: MovieDetailsEntity.self, endpoint: endpoint).asAsync()
    }

}
