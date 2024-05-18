//
//  MoviesListView.swift
//  MoviesUI
//
//  Created by Davi Oliveira on 2024-05-18.
//

import SwiftUI

enum ViewState<ViewData> {
    case loading
    case error(MoviesError)
    case loaded(ViewData)
}

struct Movie: Identifiable, Hashable {
    var id = UUID().uuidString
    let name: String
}
struct MoviesListView: View {

    @Environment(MovieGenreRepository.self) var movieGenreRepository
    @State var viewState: ViewState<[MovieGenre]> = .loading

    var body: some View {
        List {
            switch viewState {
            case .loading:
                ProgressView()
                  .listSectionSeparator(.hidden)
            case .error(let error):
                Text("\(error.localizedDescription)")
            case .loaded(let genres):
                ForEach(genres) { genre in
                    Text(genre.name)
                }
            }
        }
        .task {
            do {
                let genres = try await movieGenreRepository.getMovieGenres()
                viewState = .loaded(genres)
            } catch let error as MoviesError {
                viewState = .error(error)
            } catch {
                viewState = .error(.genericError)
            }
        }
    }
}

#Preview {
    MoviesListView()
}
