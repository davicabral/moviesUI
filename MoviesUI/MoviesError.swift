//
//  MoviesError.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import Foundation

enum MoviesError: Error, LocalizedError {
    case wrongURL
    case fetchAndParseError
    case genericError
}
