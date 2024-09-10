//
//  MovieDetailsView.swift
//  Banquemisr.challenge05
//
//  Created by remon on 09/09/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MovieCellCard(imagePath: "", title: "test")
            Spacer()
        }
    }
}

#Preview {
    MovieDetailsView()
}
