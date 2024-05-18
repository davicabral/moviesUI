//
//  MovieGenreRepository.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import Foundation

@Observable
class MovieGenreRepository {

    private struct MovieGenreResponse: Decodable {
        let genres: [MovieGenre]
    }

    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func getMovieGenres() async throws -> [MovieGenre] {
        let response: MovieGenreResponse = try await apiClient.request(endpoint: GenreEndpoint.genres)
        return response.genres
    }

}
