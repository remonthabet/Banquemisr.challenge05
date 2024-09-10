//
//  DBManager.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import Foundation
enum MovieCategory: String {
    case nowPlaying = "NowPlaying"
    case popular = "Popular"
    case upcoming = "Upcoming"
}

class DBManager {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    // Save movies to cache
    func saveMovies(_ movies: [Movie], for category: MovieCategory) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(movies)
            userDefaults.set(data, forKey: category.rawValue)
        } catch {
            print("Fail to save movies: \(error)")
        }
    }

    // Load cached movies
    func loadCachedMovies(for category: MovieCategory) -> [Movie]? {
        guard let data = userDefaults.data(forKey: category.rawValue) else { return nil }

        let decoder = JSONDecoder()
        do {
            let movies = try decoder.decode([Movie].self, from: data)
            return movies
        } catch {
            print("Fail to fetch movies: \(error)")
            return nil
        }
    }

    // Clear cached data for a specific category
    func clearCache(for category: MovieCategory) {
        userDefaults.removeObject(forKey: category.rawValue)
    }
}
