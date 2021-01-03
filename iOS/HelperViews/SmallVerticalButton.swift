//
//  SmallVerticalButton.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 12/11/20.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isImageOn: String
    var isImageOff: String
    var isOn: Bool
    var action: () -> Void
    
    private var imageName: String {
        return isOn ? isImageOn : isImageOff
    }
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            VStack(spacing: 6) {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .bold()
            }//: VSTACK
        })
        
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SmallVerticalButton(text: "My List",
                                isImageOn: "checkmark",
                                isImageOff: "plus",
                                isOn: true) {
                print("Tapped")
            }
        }
    }
}
