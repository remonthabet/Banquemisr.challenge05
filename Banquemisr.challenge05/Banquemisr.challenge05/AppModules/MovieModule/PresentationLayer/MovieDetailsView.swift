//
//  MovieDetailsView.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                MovieCellCard(imagePath: movie.posterPath ?? "", title: movie.title ?? "")
                
                infoView
                
            }
        }
    }
    
    var infoView: some View{
        VStack(alignment: .leading, spacing: 10){
            
            Text(movie.releaseDate ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            
            Text(movie.overview ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            
        }.padding(.all)
    }
}

#Preview {
    MovieDetailsView(movie: Movie(id: 1, originalTitle: nil, overview: "test", posterPath: "", releaseDate: "test", title: "test"))
}
