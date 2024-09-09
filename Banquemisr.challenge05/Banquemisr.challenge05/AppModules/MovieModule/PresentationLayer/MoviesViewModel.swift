//
//  MoviesViewModel.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
class MoviesViewModel: ObservableObject {
    @Published var movieList: [Movie] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private let getNowPlayingMoviesUseCase: GetNowPlayingUseCase

    init(getNowPlayingMoviesUseCase: GetNowPlayingUseCase = GetNowPlayingUseCase()) {
        self.getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase
    }

    func loadMovies() {
        Task {
            do {
                let movies = try await getNowPlayingMoviesUseCase.execute()
                DispatchQueue.main.async {
                    self.movieList = movies
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
