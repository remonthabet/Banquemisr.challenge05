//
//  MoviesViewModel.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
class MoviesViewModel: ObservableObject {
    @Published var movieList: [Movie] = []
    @Published var errorMessage: String = ""
    @Published var hasError: Bool = false
    
    private let getNowPlayingUseCase: GetNowPlayingUseCase
    private let getPopularUseCase: GetPopularUseCase
    private let getUpcomingUseCase: GetUpcomingUseCase
    
    init(getNowPlayingUseCase: GetNowPlayingUseCase = GetNowPlayingUseCase(),
         getPopularUseCase: GetPopularUseCase = GetPopularUseCase(),
         getUpcomingUseCase: GetUpcomingUseCase = GetUpcomingUseCase()) {
        self.getNowPlayingUseCase = getNowPlayingUseCase
        self.getPopularUseCase = getPopularUseCase
        self.getUpcomingUseCase = getUpcomingUseCase
    }
    
    func fetchNowPlayingMovies() {
        Task {
            do {
                let movies = try await getNowPlayingUseCase.fetch()
                DispatchQueue.main.async {
                    self.movieList = movies
                }
            } catch {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func fetchPopularMovies() {
        Task {
            do {
                let movies = try await getPopularUseCase.fetch()
                DispatchQueue.main.async {
                    self.movieList = movies
                }
            } catch {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func fetchUpcomingMovies() {
        Task {
            do {
                let movies = try await getUpcomingUseCase.fetch()
                DispatchQueue.main.async {
                    self.movieList = movies
                }
            } catch {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
