//
//  TopMoviePreview.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/11/20.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    
    var movie: Movie
    
    func isCategoryLast(_ category: String) -> Bool {
        let categoryCount = movie.categories.count - 1
        if let index = movie.categories.firstIndex(of: category) {
            if index != categoryCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            VStack {
                Spacer()
                HStack (spacing: 3) {
                    ForEach(movie.categories,id: \.self) { category in
                        HStack(spacing: 3) {
                            Text(category)
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }//: HSTACK

                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isImageOn: "checkmark", isImageOff: "plus", isOn: true) {
                        //
                    }
                    
                    Spacer()
                    PlayButton(text: "Play", imageName: "play.fill") {
                        //
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    SmallVerticalButton(text: "Info", isImageOn: "info.circle", isImageOff: "info.circle", isOn: true) {
                        //
                    }
                    Spacer()
                }
                .padding(.vertical,12)
            }//: VSTACK
            .background(LinearGradient
                            .blackOpacityGradient
                            .padding(.top,250))
            
        }//: ZSTACK
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TopMoviePreview(movie: exampleMovie1)
        }//: ZSTACK
    }
}
