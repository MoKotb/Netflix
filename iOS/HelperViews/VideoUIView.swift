//
//  VideoUIView.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/16/20.
//

import SwiftUI
import AVKit

struct VideoUIView: View {

    var videoURL: URL
    
    private var player: AVPlayer {
        AVPlayer(url: videoURL)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct VideoUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VideoUIView(videoURL: exampleVideoURL)
        }//: ZSTACK
    }
}
