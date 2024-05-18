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
            fatalError("Thow some error later")
        }
        urlComponent.path = endpoint.path
        urlComponent.queryItems = endpoint.params.map { URLQueryItem(name: $0, value: $1) }

        guard let url = urlComponent.url else {
            fatalError("Thow some error later")
        }
        let urlSession = URLSession.shared
        let data = try await urlSession.data(from: url).0
        return try JSONDecoder().decode(Model.self, from: data)
    }

}
