//
//  HomeView.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import SwiftUI
import CoreData

struct TapsView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    let nowPlaying = "Now playing"
    let popualr = "Popular"
    let upcoming = "Upcoming"
    
    var body: some View {
        TabView {
            MoviesView(viewModel: viewModel, title: nowPlaying)
                .tabItem {
                    Label(nowPlaying, systemImage: "person.3")
                }.onAppear(){
                    viewModel.fetchNowPlayingMovies()
                }
            MoviesView(viewModel: viewModel, title: popualr)
                .tabItem {
                    Label(popualr, systemImage: "person.crop.square")
                }.onAppear(){
                    viewModel.fetchPopularMovies()
                }
            MoviesView(viewModel: viewModel, title: upcoming)
                .tabItem {
                    Label(upcoming, systemImage: "questionmark.diamond")
                }.onAppear(){
                    viewModel.fetchUpcomingMovies()
                }
        }
    }
}

#Preview {
    TapsView()
}
