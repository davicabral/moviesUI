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

    func getMovieGenres() async throws -> [MovieGenre] {
        let urlSession = URLSession.shared
        let data = try await urlSession.data(from: URL(string: "https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=512c4e2722f82f30f20fdaa7671153a3")!).0
        return try JSONDecoder().decode(MovieGenreResponse.self, from: data).genres
    }

}
