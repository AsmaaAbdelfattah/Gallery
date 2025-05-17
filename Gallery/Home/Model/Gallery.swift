//
//  Gallery.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import Foundation

// MARK: - Welcome
struct Gallery: Decodable,Identifiable {

    let id: String
    let description: String?
    let urls: URLs
}
struct URLs: Decodable {
            let thumb: String
            let small: String
            let regular: String
            let full: String
        }
