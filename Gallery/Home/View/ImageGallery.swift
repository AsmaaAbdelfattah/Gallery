//
//  ImageGallery.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import SwiftUI
import Kingfisher
struct ImageGallery: View {
    var geometry: GeometryProxy
    var link: String
    var body: some View {
        KFImage(URL(string: link)).cacheOriginalImage().placeholder {
            ProgressView()
        }.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: (geometry.size.width / 2) - 16, height: 200)
            .clipped()
            .cornerRadius(10)
    }
}


