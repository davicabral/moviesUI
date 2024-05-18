//
//  MovieGenre.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import Foundation
import SwiftData

@Model
public class MovieGenre: Codable {

    enum CodingKeys: CodingKey {
        case id
        case name
    }

    public let id: Int
    public let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
    }

}
