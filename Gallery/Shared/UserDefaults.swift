//
//  UserDefaults.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import Foundation
enum UserDefaultsKeys:String{
    case baseURL
}
extension UserDefaults{
    
    func setBase(value: String){
        setValue(value, forKey: UserDefaultsKeys.baseURL.rawValue)
    }
    func getBase() -> String{
        return string(forKey: UserDefaultsKeys.baseURL.rawValue) ?? ""
    }
    
}
