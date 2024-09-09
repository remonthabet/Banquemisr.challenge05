//
//  HomeView.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    let nowPlaying = "Now playing"
    let popualr = "Popular"
    let upcoming = "Upcoming"
    
    var body: some View {
        TabView {
            MoviesView(title: nowPlaying)
                .tabItem {
                    Label(nowPlaying, systemImage: "person.3")
                }
            MoviesView(title: popualr)
                .tabItem {
                    Label(popualr, systemImage: "person.crop.square")
                }
            MoviesView(title: upcoming)
                .tabItem {
                    Label(upcoming, systemImage: "questionmark.diamond")
                }
        }
    }
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
