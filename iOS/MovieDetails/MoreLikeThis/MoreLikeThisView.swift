//
//  MoreLikeThisView.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/16/20.
//

import SwiftUI

struct MoreLikeThisView: View {
    
    var movies: [Movie]
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(movies) { movie in
                StandardHomeMovie(movie: movie)
            }
        }
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoreLikeThisView(movies: exampleMovies)
        }//: ZSTACK
    }
}
