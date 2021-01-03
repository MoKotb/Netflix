//
//  HomeStack.swift
//  Netflix (iOS)
//
//  Created by Mohamed Kotb on 03/01/2021.
//

import SwiftUI

struct HomeStack: View {
    
    var homeViewModel: HomeViewModel
    var topRowSelected: HomeTopRow
    var homeGenre: HomeGenre
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        
        ForEach(homeViewModel.allCategories , id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }//: HSTACK
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(homeViewModel.getMovies(forCategory: category, andHomeRow: topRowSelected, andGenre: homeGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal,20)
                                .onTapGesture(perform: {
                                    movieDetailToShow = movie
                                })
                        }
                    }//: HSTACK
                }//: SCROLL VIEW
            }//: VSTACK
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStack(homeViewModel: HomeViewModel(), topRowSelected: .home, homeGenre: .allGenre, movieDetailToShow: .constant(nil)).previewDevice("iPhone 12 Pro")
            }//: SCROLL VIEW
            .foregroundColor(.white)
        }//: ZSTACK
    }
}
