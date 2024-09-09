//
//  MoviesEndPoint.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation

enum MoviesEndPoint {
    case getNowPlayingMovies
    case getPopularMovies
    case getUpcomingMovies
    case getMovieDetailById(Int)
}

extension MoviesEndPoint: EndPointProtcol {

    var body: [String:Any]? {
        return nil
    }

    var path: URL {
        switch self {
        case .getNowPlayingMovies:
            return URL(string: baseURL + "now_playing")!
        case .getPopularMovies:
            return URL(string: baseURL + "popular")!
        case .getUpcomingMovies:
            return URL(string: baseURL + "upcoming")!
        case .getMovieDetailById(let movieId):
            return URL(string: baseURL + "movie/\(movieId)")!
        }
    }

    var method: String {
        switch self {
        default:
            return "GET"
        }

    }

    var headers: [String : String]? {
        let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMzM4MTM3NjY2MjM3N2M1ZDk1OTc0YmM2ZjY1Zjc3NSIsIm5iZiI6MTcyNTg5MzQxMS4wNjU3NzgsInN1YiI6IjY2ZGNkM2JmMGJjZWEwOTNhNzc4NWVkZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dNTyKQWkVuJipfwSU0D39OVagptN7RprGtNtFp9vgNE"

        return ["Authorization" : "Bearer \(accessToken)",
                "Content-Type": "application/json"]
    }
}
