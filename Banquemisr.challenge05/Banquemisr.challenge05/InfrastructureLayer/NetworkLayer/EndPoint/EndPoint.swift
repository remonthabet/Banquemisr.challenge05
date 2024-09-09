//
//  EndPoint.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import Foundation
protocol EndPointProtcol {

    var baseURL: String { get }

    var path: URL { get }

    var method: String { get }

    var body: [String: Any]? { get }

    var headers: [String : String]? { get }
}

extension EndPointProtcol {

    var baseURL: String {
        return "https://api.themoviedb.org/3/movie/"
    }
}
