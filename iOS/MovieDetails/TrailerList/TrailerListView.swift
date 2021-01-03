//
//  TrailerListView.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/16/20.
//

import SwiftUI

struct TrailerListView: View {
    
    var trailers: [Trailer]
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading){
                    VideoPreviewImage(imageURL: trailer.thnumbnailImageURL, videoURL: trailer.videoURl)
                        .frame(maxWidth: screen.width)
                    Text(trailer.name)
                        .font(.headline)
                }//: VSTACK
                .foregroundColor(.white)
                .padding(.bottom,10)
            }
        }//: VSTACK
    }
}

struct TrailerListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerListView(trailers: exampleTrailers)
        }//: ZSTACK
    }
}
