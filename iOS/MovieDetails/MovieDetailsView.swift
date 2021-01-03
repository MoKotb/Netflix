//
//  MovieDetailsView.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/12/20.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var movie: Movie
    private let screen = UIScreen.main.bounds
    @State private var showSeasonPicker: Bool = false
    @State private var selectedSeason: Int = 1
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            movieDetailToShow = nil
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 28))
                        })
                    }//: HSTACK
                    .padding(.horizontal,22)
                    ScrollView {
                        VStack {
                            
                            StandardHomeMovie(movie: movie)
                                .frame(width: screen.width / 2.5)
                            
                            MovieInfoSubheadline(movie: movie)
                            
                            if let promotionText = movie.promotionHeadline {
                                Text(promotionText)
                                    .font(.headline)
                                    .bold()
                            }
                            
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                                //
                            }
                            
                            CurrentEpisodeView(movie: movie)
                            
                            CastInfo(movie: movie)
                            
                            HStack(spacing: 60) {
                                SmallVerticalButton(text: "My List", isImageOn: "checkmark", isImageOff: "plus", isOn: true) {
                                    //
                                }
                                
                                SmallVerticalButton(text: "Rate", isImageOn: "hand.thumbsup.fill", isImageOff: "hand.thumbsup", isOn: true) {
                                    //
                                }
                                
                                SmallVerticalButton(text: "Share", isImageOn: "square.and.arrow.up", isImageOff: "square.and.arrow.up", isOn: true) {
                                    //
                                }
                                Spacer()
                            }//: HSTACK
                            .padding(.leading,20)
                            
                            CustomTabSwitcher(tabs: [.episodes,.trailers,.more], movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                            
                        }//: VSTACK
                        .padding(.horizontal,10)
                    }//: SCROLL VIEW
                    Spacer()
                }//: VSTACK
            }//: ZSTACK
            .foregroundColor(.white)
            
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.9)
                    VStack (spacing:30){
                        Spacer()
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                            Button(action: {
                                self.selectedSeason = season + 1
                                self.showSeasonPicker = false
                            }, label: {
                                Text("Season \(season + 1)")
                                    .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                    .bold()
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                            })
                        }
                        Spacer()
                        Button(action: {
                            self.showSeasonPicker = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 44))
                                .scaleEffect(x: 1.1)
                        })
                    }
                    .padding(.bottom,20)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }//: ZSTACK
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: exampleMovie2, movieDetailToShow: .constant(nil))
    }
}

struct MovieInfoSubheadline: View {
    
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
        }//: HSTACK
        .foregroundColor(.gray)
        .padding(.vertical,6)
    }
}

struct RatingView: View {
    
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text(rating)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 12))
        }//: ZSTACK
        .frame(width: 50, height: 20)
    }
}

struct CastInfo: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 4) {
            HStack{
                Text("Cast: \(movie.cast)")
                Spacer()
            }//: HSTACK
            
            HStack{
                Text("Creators: \(movie.creators)")
                Spacer()
            }//: HSTACK
        }//: VSTACK
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical,10)
    }
}

struct CurrentEpisodeView: View {
    
    var movie: Movie
    
    var body: some View {
        Group {
            HStack{
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }//: HSTACK
            .padding(.vertical,4)
            
            HStack{
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                Spacer()
            }//: HSTACK
        }
    }
}
