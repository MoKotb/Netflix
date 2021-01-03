//
//  Episode.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/12/20.
//

import Foundation

struct Episode: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var description: String
    var season: Int
    var episodeNumber: Int
    var length: Int
    var videoURL: URL
    var thumbnailImageURLString:String
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}

struct CurrentEpisodeInfo {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}
