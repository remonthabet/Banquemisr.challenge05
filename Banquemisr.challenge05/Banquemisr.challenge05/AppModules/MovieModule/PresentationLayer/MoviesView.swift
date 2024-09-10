//
//  MoviesView.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject var viewModel : MoviesViewModel
    
    var title : String
    var body: some View {
        NavigationView {
            if !viewModel.movieList.isEmpty {
                moviesListView
            }else{
                Text("No Movies")
            }
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(
                title: Text("Alert"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    var moviesListView: some View{
        List(viewModel.movieList, id: \.id) { movie in
            NavigationLink(destination: MovieDetailsView(movie: movie)) {
                MovieCellCard(imagePath: movie.posterPath ?? "", title: movie.title ?? "")
            }
//            .listRowSeparator(.hidden)
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
        }.navigationTitle(title)
        
    }
}

#Preview {
    MoviesView(viewModel: MoviesViewModel(), title: "")
}
