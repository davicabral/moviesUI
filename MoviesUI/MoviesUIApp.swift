//
//  MoviesUIApp.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import SwiftUI
import SwiftData

@main
struct MoviesUIApp: App {

    private var apiClient = APIClient()
    @State var movieGenreRepository: MovieGenreRepository

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            MovieGenre.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MoviesListView()
        }
        .modelContainer(sharedModelContainer)
        .environment(movieGenreRepository)
    }

    init() {
        self.movieGenreRepository = MovieGenreRepository(apiClient: apiClient)
    }
}
