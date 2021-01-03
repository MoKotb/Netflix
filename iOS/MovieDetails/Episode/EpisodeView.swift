//
//  EpisodeView.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/22/20.
//

import SwiftUI

struct EpisodeView: View {
    
    var episodes: [Episode]
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int

    func getEpisode(forSeason season: Int) -> [Episode] {
        return episodes.filter({ $0.season == season })
    }
    
    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }//: GROUP
                    .font(.system(size: 16))
                })
                Spacer()
            }//:HSTACK
            
            ForEach(getEpisode(forSeason: selectedSeason)) { episode in
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 80)
                            .clipped()
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                            Text("\(episode.length)m")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }//: VSTACK
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                        
                    }//: HSTACK
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }//: VSTACK
                .padding(.bottom,20)
            }
            Spacer()
        }//: VSTACK
        .foregroundColor(.white)
        .padding(.horizontal,20)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodeView(episodes: exampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }//: ZSTACK
    }
}
