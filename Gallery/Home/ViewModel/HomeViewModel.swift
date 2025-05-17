//
//  HomeViewModel.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import Foundation
protocol HomeViewModelProtocol{
    func getImages(url: String)
}
class HomeViewModel:HomeViewModelProtocol,ObservableObject {
    let networkService = NetworkService.getInstance()
    var page = 0
    @Published var images:[Gallery] = []
    
    init() {
        UserDefaults.standard.setBase(value: "https://api.unsplash.com/")
   
    }
    
    func getImages(url: String){
        print(page)
        networkService.getData(url: url,page: page) { [weak self] (result:Result<[Gallery],Error>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.images.append(contentsOf: success)
                    self?.page += 1
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
