//
//  FakeNetworkService.swift
//  BookTrackerTests
//
//  Created by Raphaël Payet on 08/08/2022.
//

@testable import BookTracker
import Foundation

class FakeNetworkService: NetworkRequest {
    
    var baseURLString: String = ""
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    
    static let shared = FakeNetworkService()
    
    private init() {
        self.data       = nil
        self.response   = nil
        self.error      = nil
    }
    
    
    init(data: Data?, response: HTTPURLResponse?, error: Error?) {
        self.data       = data
        self.response   = response
        self.error      = error
    }
}

extension FakeNetworkService {
    func fetchBooks(with queries: String, completion: @escaping (Result<[DecodableBookItem], NetworkError>) -> Void) {
        guard !queries.isEmpty else {
            completion(.failure(.noQueries))
            return
        }
        
        guard error == nil else {
            completion(.failure(.badURL))
            return
        }
        
        guard let data = data else {
            completion(.failure(.noData))
            return
        }
        
        guard let response = response,
              response.statusCode == 200 else {
            completion(.failure(.noResponse))
            return
        }
        
        guard let volume = try? JSONDecoder().decode(DecodableBookVolume.self, from: data) else {
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
    
    
    
    func getFirstNonNilImageURL(imageLinks: ImageLinks?) -> URL? {
        return nil
    }
}
