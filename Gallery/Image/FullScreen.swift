//
//  FullScreen.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import SwiftUI
import Kingfisher
struct FullScreen: View {
    var image:String
    var body: some View {
        KFImage(URL(string: image)).onFailure { error in
            print("Failed to load: \(error)")
        }
        .onSuccess { result in
            print("Loaded from: \(result.cacheType)") // .memory, .disk, or .none
        }.placeholder {
            ProgressView()
        }.resizable().padding()
            .aspectRatio(contentMode: .fill)
            //.frame(width: (geometry.size.width / 2) - 20, height: 200)
            .clipped()
            .cornerRadius(10)
    }
}

#Preview {
    FullScreen(image: "https://images.unsplash.com/photo-1744835896686-7caa79e4cedb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3NTIyMjF8MHwxfGFsbHwxMHx8fHx8fHx8MTc0NzQzMzY0OHw&ixlib=rb-4.1.0&q=80&w=1080")
}
