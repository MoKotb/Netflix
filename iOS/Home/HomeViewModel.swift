//
//  HomeViewModel.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/11/20.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    //String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allGenres: [HomeGenre] = [.allGenre,.action,.comedy,.horror,.thriller]
    
    public var allCategories: [String] {
        movies.keys.map({ String($0) })
    }
    
    init() {
        setupMovies()
    }
    
    func getMovies(forCategory category: String,andHomeRow homeRow: HomeTopRow,andGenre genre: HomeGenre) -> [Movie] {
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter({ $0.movieType == .tvShow && $0.genre == genre })
        case .movies:
            return (movies[category] ?? []).filter({ $0.movieType == .movie && $0.genre == genre })
        case .myList:
            return movies[category] ?? []
        }
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
    }
}
