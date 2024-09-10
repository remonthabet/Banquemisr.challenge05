//
//  MovieEntity.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
struct MovieEntity: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieEntity
struct Movie: Codable, Equatable {
    let id: Int
    let originalTitle, overview: String?
    let posterPath, releaseDate, title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
