//
//  CustomTabSwitcher.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/12/20.
//

import SwiftUI

enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    var tabs: [CustomTab]
    var movie: Movie
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        let text = tab.rawValue
        return text.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs,id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab), height: 30)
                        }//: VSTACK
                    }
                }//: HSTACK
            }//: SCROLL VIEW
            
            switch currentTab {
            case .episodes:
                EpisodeView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailers:
                TrailerListView(trailers: movie.trailers)
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            }
        }//: VSTACK
        .foregroundColor(.white)
    }
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1,showSeasonPicker: .constant(false),selectedSeason: .constant(1))
        }//: ZSTACK
    }
}
