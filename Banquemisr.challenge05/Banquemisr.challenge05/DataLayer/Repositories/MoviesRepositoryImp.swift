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
    private let dbManager: DBManager
    
    init(provider: NetworkProviderProtocol = DefaultAppNetworkProvider(), dbManager: DBManager = DBManager()) {
        self.provider = provider
        self.dbManager = dbManager
    }
    
    
    func getNowPlayingMovies() async throws -> [Movie] {
        //if network connection enable get data from API and save it to DB
        let isConnected = await AppHelper.checkInternetConnection()
        if isConnected {
            let endpoint = MoviesEndPoint.getNowPlayingMovies
            let response = try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
            dbManager.saveMovies(response.results, for: .nowPlaying)
            return response.results ?? []
        } else {
            return dbManager.loadCachedMovies(for: .nowPlaying) ?? []
        }
    }
    
    func getPopularMovies() async throws -> [Movie] {
        let isConnected = await AppHelper.checkInternetConnection()
        if isConnected {
            let endpoint = MoviesEndPoint.getPopularMovies
            let response = try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
            dbManager.saveMovies(response.results, for: .popular)
            return response.results ?? []
        } else {
            return dbManager.loadCachedMovies(for: .popular) ?? []
        }
    }
    
    func getUpcomingMovies() async throws -> [Movie] {
        let isConnected = await AppHelper.checkInternetConnection()
        if isConnected {
            let endpoint = MoviesEndPoint.getUpcomingMovies
            let response = try await provider.get(type: MovieEntity.self, endpoint: endpoint).asAsync()
            dbManager.saveMovies(response.results, for: .upcoming)
            return response.results ?? []
        } else {
            return dbManager.loadCachedMovies(for: .upcoming) ?? []
        }
    }
}
