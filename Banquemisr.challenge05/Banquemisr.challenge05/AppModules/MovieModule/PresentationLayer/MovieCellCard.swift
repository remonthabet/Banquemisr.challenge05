//
//  MovieCellCard.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import SwiftUI


struct MovieCellCard: View {
    var imagePath: String
    var title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(imagePath)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)

            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .cornerRadius(10)

            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 30)).bold()
        }.padding(.all)
    }
}

#Preview {
    MovieCellCard(imagePath: "", title: "test")
}
