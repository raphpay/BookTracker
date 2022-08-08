//
//  FakeNetworkServiceData.swift
//  BookTrackerTests
//
//  Created by Raphaël Payet on 08/08/2022.
//

@testable import BookTracker
import Foundation

class FakeNetworkServiceData {
    // Data
    static let emptyQueries = ""
    static let titleQuery = "Nouvelles"
    static var correctData: Data? {
        let bundle = Bundle(for: FakeNetworkServiceData.self)
        let url = bundle.url(forResource: "FakeBookVolume", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }
    
    static var correctDataBookCount: Int {
        let bundle = Bundle(for: FakeNetworkServiceData.self)
        let url = bundle.url(forResource: "FakeBookVolume", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        guard let volume = try? JSONDecoder().decode(DecodableBookVolume.self, from: data) else { return 0 }
        
        var bookArray: [DecodableBookItem] = []
        for item in 0..<min(volume.books.count, 10) {
            let book = volume.books[item]
            bookArray.append(book)
        }
        return bookArray.count
    }
    
    static let incorrectData = "erreur".data(using: .utf8)!
    // Errors
    class FakeNetworkError: Error {}
    static let networkError = FakeNetworkError()
    // Response
    static let responseOK = HTTPURLResponse(url: URL(string: "https://apple.com")!,
                                            statusCode: 200,
                                            httpVersion: nil, headerFields: nil)

    static let responseNotOK = HTTPURLResponse(url: URL(string: "https://apple.com")!,
                                               statusCode: 500,
                                               httpVersion: nil, headerFields: nil)
}
