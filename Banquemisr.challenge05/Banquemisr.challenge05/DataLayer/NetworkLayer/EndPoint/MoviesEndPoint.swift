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
//TODO: env urls
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
        return ["Authorization" : "Bearer \(Constants.TOKEN)",
                "Content-Type": "application/json"]
    }
}
