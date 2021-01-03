//
//  GlobalHelpers.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/11/20.
//

import Foundation
import SwiftUI

let exampleVideoURL:URL = URL(string:"https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!
let exampleImageURL1:URL = URL(string:"https://picsum.photos/200/104")!
let exampleImageURL2:URL = URL(string:"https://picsum.photos/200/105")!
let exampleImageURL3:URL = URL(string:"https://picsum.photos/200/106")!
let exampleImageURL4:URL = URL(string:"https://picsum.photos/200/107")!
let exampleImageURL5:URL = URL(string:"https://picsum.photos/200/108")!
let exampleImageURL6:URL = URL(string:"https://picsum.photos/200/108")!

var randomImageURL: URL {
    return [
        exampleImageURL1,exampleImageURL2,
        exampleImageURL3,exampleImageURL4,
        exampleImageURL5,exampleImageURL6
    ].randomElement() ?? exampleImageURL1
}

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Action","Comedy","Drama","Fantasy","Horror"],
                          year: 2016,
                          rating: "TV_MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triabel",
                          moreLikeThisMovies: [
                            exampleMovie2,exampleMovie3,
                            exampleMovie4,exampleMovie5,
                            exampleMovie6,exampleMovie7
                          ],
                          trailers: exampleTrailers)

let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travelers",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Action","Comedy","Drama","Fantasy","Horror"],
                          year: 2017,
                          rating: "TV_MA",
                          promotionHeadline: "Best Rated Show",
                          numberOfSeasons: 2,
                          episodes: exampleEpisodes,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triabel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)

let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Community",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Action","Comedy","Drama","Fantasy","Horror"],
                          year: 2018,
                          rating: "TV_MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triabel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)

let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Alone",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Action","Comedy","Drama","Fantasy","Horror"],
                          year: 2019,
                          rating: "TV_MA",
                          promotionHeadline: "New episodes coming soon",
                          numberOfSeasons: 4,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triabel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)

let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hannibal",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Action","Comedy","Drama","Fantasy","Horror"],
                          year: 2020,
                          rating: "TV_MA",
                          numberOfSeasons: 5,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triabel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)

let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "After Life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Action","Comedy","Drama","Fantasy","Horror"],
                          year: 2020,
                          rating: "TV_MA",
                          promotionHeadline: "Watch Season 6 Now",
                          numberOfSeasons: 6,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triabel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)

let exampleMovie7 = Movie(id: UUID().uuidString,
                          name: "Breaking Bad",
                          thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Action","Comedy","Drama","Fantasy","Horror"],
                          year: 2012,
                          rating: "TV_MA",
                          promotionHeadline: "Watch Season 6 Now",
                          numberOfSeasons: 6,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, Jordis Triabel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Endings and Beginnings", description: "On the day of the apocalypse, Clausen executes a search warrant at the power plant as Jonas and Claudia use the time machine to connect past and future.", season: 2, episode: 8)

let exampleMovies = [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6]


let exampleTrailer1 = Trailer(name: "Secrets", videoURl: exampleVideoURL, thnumbnailImageURL: randomImageURL)
let exampleTrailer2 = Trailer(name: "Truths", videoURl: exampleVideoURL, thnumbnailImageURL: randomImageURL)
let exampleTrailer3 = Trailer(name: "As You Sow, so You Shall Reap.", videoURl: exampleVideoURL, thnumbnailImageURL: randomImageURL)
let exampleTrailer4 = Trailer(name: "Past and Present", videoURl: exampleVideoURL, thnumbnailImageURL: randomImageURL)
let exampleTrailer5 = Trailer(name: "Double Lives", videoURl: exampleVideoURL, thnumbnailImageURL: randomImageURL)

let exampleTrailers = [exampleTrailer1,exampleTrailer2,exampleTrailer3,exampleTrailer4,exampleTrailer5]


let exampleEpisode1  = Episode(name: "Beginnings and Endings",
                               description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
                               season: 1,
                               episodeNumber: 1,
                               length: 53,
                               videoURL: exampleVideoURL,
                               thumbnailImageURLString: "https://picsum.photos/200/104")

let exampleEpisode2  = Episode(name: "Dark Matter",
                               description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
                               season: 1,
                               episodeNumber: 2,
                               length: 50,
                               videoURL: exampleVideoURL,
                               thumbnailImageURLString: "https://picsum.photos/200/105")

let exampleEpisode3  = Episode(name: "Ghosts",
                               description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
                               season: 1,
                               episodeNumber: 3,
                               length: 56,
                               videoURL: exampleVideoURL,
                               thumbnailImageURLString: "https://picsum.photos/200/106")

let exampleEpisode4  = Episode(name: "The Travelers",
                               description: "Jonas meets an ominous figure. While the kids comb the cave for answers, the adults gather in the bunker to share what they know about the travelers.",
                               season: 2,
                               episodeNumber: 4,
                               length: 51,
                               videoURL: exampleVideoURL,
                               thumbnailImageURLString: "https://picsum.photos/200/107")

let exampleEpisode5  = Episode(name: "Lost and Found",
                               description: "In 1987, Ulrich seizes an opportunity. The kids return to the cave with the time machine, and Jonas learns of a loophole that could change the future.",
                               season: 2,
                               episodeNumber: 5,
                               length: 54,
                               videoURL: exampleVideoURL,
                               thumbnailImageURLString: "https://picsum.photos/200/108")

let exampleEpisode6  = Episode(name: "An Endless Cycle",
                               description: "Armed with a plan to prevent the apocalypse, Jonas travels to 2019. During the Nielsens' anniversary party, Ulrich sneaks off with Hannah.",
                               season: 3,
                               episodeNumber: 6,
                               length: 49,
                               videoURL: exampleVideoURL,
                               thumbnailImageURLString: "https://picsum.photos/200/109")

let exampleEpisodes = [exampleEpisode1,exampleEpisode2,exampleEpisode3,exampleEpisode4,exampleEpisode5,exampleEpisode6]

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient:Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom)
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
