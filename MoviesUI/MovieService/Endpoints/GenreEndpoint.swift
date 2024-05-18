//
//  GenreEndpoint.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import Foundation

enum GenreEndpoint: Endpoint {
    case genres

    var path: String {
        "/3/genre/movie/list"
    }

    
}
