//
//  API.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import Foundation   
enum Networking{
    
    private var baseURL: String { return  UserDefaults.standard.getBase()}
    
    case images
}
extension Networking{

    var fullPath :String {
        var endPoint: String
        switch self {
            
            //MARK: account
        case .images:
            endPoint = "photos"
  
        }
        return baseURL + endPoint
    }
}

