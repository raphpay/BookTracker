//
//  FakeNetworkServiceData.swift
//  BookTrackerTests
//
//  Created by Raphaël Payet on 08/08/2022.
//

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
