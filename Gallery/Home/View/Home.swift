//
//  Home.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import SwiftUI
import Kingfisher
struct Home: View {
    //MARK: vars
   @StateObject var viewModel = HomeViewModel()
    let columns = [
        GridItem(.flexible()), // Each item takes up half the screen width
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader{geometry in
                ScrollView(.vertical,showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.images.indices, id: \.self) { index in
                            let item = viewModel.images[index]
                            NavigationLink( destination: FullScreen(image: item.urls.regular)){
                                ImageGallery(geometry: geometry, link: item.urls.regular).onAppear {
                                    if index == viewModel.images.count - 1 {
                                        viewModel.getImages(url: Networking.images.fullPath)
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal,12)
                }
                .onAppear{
                    viewModel.getImages(url: Networking.images.fullPath)
                }
            }
        }.navigationTitle("Gallery")
    }
}

#Preview {
    Home()
}
