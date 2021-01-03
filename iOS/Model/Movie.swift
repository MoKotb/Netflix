//
//  Movie.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/11/20.
//

import Foundation

struct Movie: Identifiable {
    
    var id: String
    var name: String
    var thumbnailURL: URL
    var categories: [String]
    var genre: HomeGenre = .allGenre
    
    //Movie Details
    var year: Int
    var rating: String
    var promotionHeadline: String?
    
    var numberOfSeasons: Int?
    var numberOfSeasonsDisplay: String {
        if let number = numberOfSeasons {
            if number == 1 {
                return "1 season"
            }else {
                return "\(number) seasons"
            }
        }
        return ""
    }
    
    var episodes: [Episode]?
    var movieType: MovieType {
        return episodes == nil ? .movie : .tvShow
    }
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    
    var episodeInfoDisplay: String {
        if let episode = currentEpisode {
            return "S\(episode.season):E\(episode.episode) \(episode.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let episode = currentEpisode {
            return episode.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
    
    var creators: String
    var cast: String
    var moreLikeThisMovies: [Movie]
    var trailers: [Trailer]
}

enum MovieType {
    case movie
    case tvShow
}
