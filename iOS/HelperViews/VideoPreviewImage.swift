//
//  VideoPreviewImage.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/16/20.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoPreviewImage: View {
    
    var imageURL: URL
    var videoURL: URL
    
    @State private var showVideoPlayer: Bool = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            Button(action: {
                showVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                
            })
            .sheet(isPresented: $showVideoPlayer) {
                VideoUIView(videoURL: videoURL)
            }
            
        }//: ZSTACK
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VideoPreviewImage(imageURL: exampleVideoURL, videoURL: exampleImageURL1)
        }//: ZSTACK
    }
}
