//
//  MoviesView.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    var title : String
    var body: some View {
        NavigationView {
            List(viewModel.movieList, id: \.id) { movie in
                Text(movie.title ?? "")
                  }
                  .onAppear {
                      viewModel.loadMovies()
                  }.navigationTitle(title)
        }
    }

}

#Preview {
    MoviesView(title: "")
}
