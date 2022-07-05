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
    
    func fetchBooks(with queries: String, completion: @escaping ((_ books: [DecodableBookItem]) -> Void)) {
        guard !queries.isEmpty else { return }
        guard let url = URL(string: "\(baseURL)\(queries)") else { return }
        AF.request(url)
            .validate()
            .responseDecodable(of: DecodableBookVolume.self) { response in
                guard let volume = response.value else { return }
                var bookArray: [DecodableBookItem] = []
                for item in 0..<min(volume.books.count, 10) {
                    let book = volume.books[item]
                    bookArray.append(book)
                }
                completion(bookArray)
            }
    }
}
