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
        guard let url = URL(string: "\(baseURLString)\(queries)") else {
            completion(.failure(.badURL))
            return
        }
        
        guard error == nil else {
            completion(.failure(.badURL))
            return
        }
        
        guard data != nil else {
            completion(.failure(.noData))
            return
        }
        
        guard let response = response,
              response.statusCode == 200 else {
            completion(.failure(.noResponse))
            return
        }
        
        print(url)
    }
    
    
    
    func getFirstNonNilImageURL(imageLinks: ImageLinks?) -> URL? {
        return nil
    }
    
//    func frommodel() {
//        guard !queries.isEmpty else { return }
//        guard let url = URL(string: "\(baseURL)\(queries)") else { return }
//        AF.request(url)
//            .validate()
//            .responseDecodable(of: DecodableBookVolume.self) { response in
//                guard let volume = response.value else { return }
//                var bookArray: [DecodableBookItem] = []
//                for item in 0..<min(volume.books.count, 10) {
//                    let book = volume.books[item]
//                    bookArray.append(book)
//                }
//                completion(bookArray)
//            }
//    }
    
//    func getResponse(from url: URL?, completion: @escaping ([String : Any]?, NetworkRequestError?) -> Void) {
//        guard error == nil else {
//            completion(nil, .serializationError(error!))
//            return
//        }
//        
//        guard let data = data else {
//            completion(nil, .incorrectData)
//            return
//        }
//        
//        guard let response = response,
//              response.statusCode == 200 else {
//            completion(nil, .incorrectResponse)
//            return
//        }
//        
//        guard let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] else {
//            completion(nil, .incorrectData)
//            return
//        }
//        
//        completion(json, nil)
//    }
//    
//    func getResponse(from url: URL?, completion: @escaping ([String: Any]?, NetworkRequestError?) -> Void) {
//        guard let url = url else {
//            completion(nil, .invalidURL)
//            return
//        }
//        
//        AF.request(url).validate().responseJSON { response in
//            guard let value = response.value as? [String: Any] else {
//                completion(nil, .incorrectResponse)
//                return
//            }
//            completion(value, nil)
//        }
//    }
}
