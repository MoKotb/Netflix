//
//  Trailer.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/16/20.
//

import Foundation

struct Trailer: Identifiable {
    var id = UUID().uuidString
    var name: String
    var videoURl: URL
    var thnumbnailImageURL: URL
}
