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
    @Published var hasError: Bool = false

    private let getNowPlayingMoviesUseCase: GetNowPlayingUseCase

    init(getNowPlayingMoviesUseCase: GetNowPlayingUseCase = GetNowPlayingUseCase()) {
        self.getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase
    }

    func loadMovies() {
        Task {
            do {
                let movies = try await getNowPlayingMoviesUseCase.fetch()
                DispatchQueue.main.async {
                    self.movieList = movies
                }
            } catch {
                // TODO: [fetch from DB].
                DispatchQueue.main.async {
                    self.hasError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
