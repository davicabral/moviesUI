//
//  Endpoint.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var params: [String: String] { get }
}

extension Endpoint {

    var baseURL: String {
        "https://api.themoviedb.org/3"
    }
    
    var params: [String: String] {
        ["api_key" : APIKey.apiKey,
         "language" : Locale.current.identifier
        ]
    }
}
