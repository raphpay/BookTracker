//
//  NetworkService.swift
//  BookTracker
//
//  Created by Raphaël Payet on 28/06/2022.
//

import Foundation
import Alamofire

class NetworkService: NetworkRequest {
    var baseURLString: String = "https://www.googleapis.com/books/v1/volumes?q="
    
    static let shared = NetworkService()
    
    func fetchBooks(with queries: String, completion: @escaping (Result<[DecodableBookItem], NetworkError>) -> Void) {
        guard !queries.isEmpty else {
            completion(.failure(.noQueries))
            return
        }
        
        guard let url = URL(string: "\(baseURLString)\(queries)") else {
            completion(.failure(.badURL))
            return
        }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: DecodableBookVolume.self) { response in
                guard let volume = response.value else {
                    completion(.failure(.noResponse))
                    return
                }
                var bookArray: [DecodableBookItem] = []
                for item in 0..<min(volume.books.count, 10) {
                    let book = volume.books[item]
                    bookArray.append(book)
                }
                completion(.success(bookArray))
            }
    }
    
    func getFirstNonNilImageURL(imageLinks: ImageLinks?) -> URL? {
        var urlString = ""
        if let extraLarge = imageLinks?.extraLarge {
            urlString = extraLarge
        } else if let large = imageLinks?.large {
            urlString = large
        } else if let medium = imageLinks?.medium {
            urlString = medium
        } else if let small = imageLinks?.small {
            urlString = small
        } else if let thumbnail = imageLinks?.thumbnail {
            urlString = thumbnail
        } else if let smallThumbnail = imageLinks?.smallThumbnail {
            urlString = smallThumbnail
        }
        return URL(string: urlString)
    }
}
