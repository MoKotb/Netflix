//
//  PlayButton.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/11/20.
//

import SwiftUI

struct PlayButton: View {
    
    var text: String
    var imageName: String
    var backgroundColor: Color = Color.white
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                Spacer()
            }//: HSTACK
            .padding(.vertical, 6.0)
            .background(backgroundColor)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .cornerRadius(3.0)
        })
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            PlayButton(text: "Play", imageName: "play.fill") {
                print("Tapped")
            }
        }//: ZSTACK
    }
}
