//
//  StandardHomeMovie.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/11/20.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
    
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            StandardHomeMovie(movie: exampleMovie1)
                .frame(width: 200, height: 300)
        }//: ZSTACK
    }
}
