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
            if viewModel.movieList.count > 0 {
                NavigationLink(destination: MovieDetailsView()) {
                    List(viewModel.movieList, id: \.id) { movie in
                        MovieCellCard(imagePath: movie.posterPath ?? "", title: movie.title ?? "").listRowSeparator(.hidden)
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .padding(
                                        EdgeInsets(
                                            top: 2,
                                            leading: 10,
                                            bottom: 10,
                                            trailing: 10
                                        )
                                    )
                            )
                    }

                }
            }else{
                Text("No Movies")
            }

        }.onAppear {
            viewModel.loadMovies()
        }.navigationTitle(title).alert(isPresented: $viewModel.hasError) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage!),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    MoviesView(title: "")
}
