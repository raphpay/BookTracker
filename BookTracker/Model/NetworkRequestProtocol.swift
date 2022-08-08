//
//  NetworkRequestProtocol.swift
//  BookTracker
//
//  Created by Raphaël Payet on 08/08/2022.
//

import Foundation

protocol NetworkRequest {
    var baseURLString: String { get set }
    func fetchBooks(with queries: String, completion: @escaping (Result<[DecodableBookItem], NetworkError>) -> Void)
    func getFirstNonNilImageURL(imageLinks: ImageLinks?) -> URL?
}

class NetworkRequestService {
    
    var session: NetworkRequest
    static let shared = NetworkRequestService(session: NetworkService.shared)
    
    init(session: NetworkRequest = NetworkService.shared) {
        self.session = session
    }
}

enum NetworkError: Error {
    case noQueries, badURL, noResponse, noData
}

