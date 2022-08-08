//
//  NetworkRequestProtocol.swift
//  BookTracker
//
//  Created by Raphaël Payet on 08/08/2022.
//

import Foundation

protocol NetworkRequest {
    func fetchBooks(with queries: String, completion: @escaping ((_ books: [DecodableBookItem]) -> Void))
    func getFirstNonNilImageURL(imageLinks: ImageLinks?) -> URL?
}

class NetworkRequestService {
    
    var session: NetworkRequest
    static let shared = NetworkRequestService(session: NetworkService.shared)
    
    init(session: NetworkRequest = NetworkService.shared) {
        self.session = session
    }
}
