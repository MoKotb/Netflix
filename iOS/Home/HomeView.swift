//
//  HomeView.swift
//  Netflix
//
//  Created by Vodafone Egypt on 12/5/20.
//

import SwiftUI

struct HomeView: View {
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    private let screen = UIScreen.main.bounds
    @State private var movieDetailToShow: Movie? = nil
    @State private var topRowSelected: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .allGenre
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    TopRowButtons(topRowSelected: $topRowSelected, homeGenre: $homeGenre,showGenreSelection: $showGenreSelection,showTopRowSelection: $showTopRowSelection)
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top,-110)
                        .zIndex(-1)
                    HomeStack(homeViewModel: homeViewModel, topRowSelected: topRowSelected, homeGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }//: MAIN VSTACK
            }//: SCROLL VIEW
            if let movieDetails = movieDetailToShow {
                MovieDetailsView(movie: movieDetails, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack (spacing:30) {
                        Spacer()
                        ForEach(HomeTopRow.allCases,id:\.self) { topRow in
                            Button(action: {
                                self.topRowSelected = topRow
                                self.showTopRowSelection = false
                            }, label: {
                                Text(topRow.rawValue)
                                    .foregroundColor(topRowSelected == topRow ? .white : .gray)
                                    .bold()
                            })
                        }
                        Spacer()
                        Button(action: {
                            self.showTopRowSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 44))
                                .scaleEffect(x: 1.1)
                        })
                    }
                    .padding(.bottom,20)
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack (spacing:30) {
                        Spacer()
                        ScrollView {
                            ForEach(homeViewModel.allGenres,id:\.self) { genre in
                                Button(action: {
                                    self.homeGenre = genre
                                    self.showGenreSelection = false
                                }, label: {
                                    Text(genre.rawValue)
                                        .foregroundColor(homeGenre == genre ? .white : .gray)
                                        .bold()
                                })
                                .padding(.bottom,30)
                            }
                        }//: SCROLL VIEW
                        Spacer()
                        Button(action: {
                            self.showGenreSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 44))
                                .scaleEffect(x: 1.1)
                        })
                    }
                    .padding(.bottom,20)
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
        } //: ZSTACK
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewDevice("iPhone 12 Pro")
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelected: HomeTopRow
    @Binding var homeGenre: HomeGenre
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelected {
        case .home:
            HStack {
                Button(action: {
                    topRowSelected = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 40)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelected = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelected = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelected = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading,10)
            .padding(.trailing,30)
        case .tvShows , .movies , .myList:
            HStack {
                Button(action: {
                    topRowSelected = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 40)
                })
                .buttonStyle(PlainButtonStyle())
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelected.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 8))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
            .padding(.leading,10)
            .padding(.trailing,30)
        }
    }
}

enum HomeTopRow: String , CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case allGenre = "All Genres"
    case action = "Action"
    case comedy = "Comedy"
    case horror = "Horror"
    case thriller = "Thriller"
}
