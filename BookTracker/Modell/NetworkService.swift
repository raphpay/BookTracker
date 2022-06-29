//
//  NetworkService.swift
//  BookTracker
//
//  Created by Raphaël Payet on 28/06/2022.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    let baseURL = "https://www.googleapis.com/books/v1/volumes?q="
    
    func fetchBooksTest() {
        guard let url = URL(string: "\(baseURL)=hyper+focus") else { return }
        AF.request(url)
            .validate()
            .responseDecodable(of: DecodableBookVolume.self) { response in
                guard let volume = response.value else { return }
                print(volume.books[0].volumeInfo)
            }
    }
}
