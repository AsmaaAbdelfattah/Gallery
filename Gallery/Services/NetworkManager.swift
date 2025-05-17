//
//  NetworkManager.swift
//  Gallery
//
//  Created by asma abdelfattah on 17/05/2025.
//

import Foundation
protocol NetworkServiceProtocol {
    func getData(url: String, page:Int,completionHandler: @escaping (Result<[Gallery], Error>) -> Void)
}

class NetworkService:NetworkServiceProtocol{
    private static var networkService : NetworkService?
    public static func getInstance()->NetworkService{
        if networkService == nil {
            networkService = NetworkService()
        }
        return networkService!
    }
    
    func getData(url: String, page:Int,completionHandler: @escaping (Result<[Gallery], Error>) -> Void){
        var components = URLComponents(string: url)!
          components.queryItems = [
              URLQueryItem(name: "per_page", value: "10"),
              URLQueryItem(name: "page", value: "\(page)")
          ]
          
          guard let link = components.url else { return }
            var urlRequest = URLRequest(url: link)
            urlRequest.httpMethod = "GET"
            let accessKey  = "Tfhly_mlVCDEcTtjKkanprxW6jLOdjhZl5Tt3uhMj20"
            urlRequest.setValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
            urlRequest.setValue("per_page", forHTTPHeaderField: "10")
            urlRequest.setValue("page", forHTTPHeaderField: "\(page)")

            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let err = error {
                    completionHandler(.failure(err))
                    return
                }
            
                   guard let data = data else {
                       completionHandler(.failure(NSError(domain: "No data", code: 0)))
                       return
                   }
            
                    do {
                       let decodedData = try JSONDecoder().decode([Gallery].self, from: data)
                            // print(decodedData)
                       completionHandler(.success(decodedData))
                   } catch {
                       completionHandler(.failure(error))
                   }
            }.resume()
        }
    
}
