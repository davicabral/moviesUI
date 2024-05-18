//
//  APIClient.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import Foundation


class APIClient {

    func request<Model: Decodable>(endpoint: Endpoint) async throws -> Model {
        guard var urlComponent = URLComponents(string: endpoint.baseURL) else {
            throw MoviesError.wrongURL
        }
        urlComponent.path = endpoint.path
        urlComponent.queryItems = endpoint.params.map { URLQueryItem(name: $0, value: $1) }

        guard let url = urlComponent.url else {
            throw MoviesError.wrongURL
        }
        let urlSession = URLSession.shared
        do {
            let data = try await urlSession.data(from: url).0
            return try JSONDecoder().decode(Model.self, from: data)
        } catch {
            throw MoviesError.fetchAndParseError
        }

    }

}
