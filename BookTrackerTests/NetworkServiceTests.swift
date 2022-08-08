//
//  NetworkServiceTests.swift
//  BookTrackerTests
//
//  Created by Raphaël Payet on 08/08/2022.
//

@testable import BookTracker
import XCTest

class NetworkServiceTests: XCTestCase {

//    let fakeURL = URL(string: FakeAlamofireData.apiURLString)
    let fakeService = NetworkRequestService()
}

// MARK: - Fetch books
extension NetworkServiceTests {
    
    func testGivenEmptyQueries_WhenFetchingBooks_ThenResultIsEmptyArray() {
        fakeService.session = FakeNetworkService(data: nil, response: nil, error: nil)
    
        let expectation = XCTestExpectation(description: "Error when fetching books with no queries")
        
        fakeService.session.fetchBooks(with: FakeNetworkServiceData.emptyQueries) { result in
            switch result {
            case .success(let books):
                XCTAssertEqual(books.count, 0)
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.noQueries)
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenErrorIsNotNil_WhenFetchingBooks_ThenErrorIsThrown() {
        fakeService.session = FakeNetworkService(data: nil, response: nil, error: FakeNetworkServiceData.networkError)
    
        let expectation = XCTestExpectation(description: "Error when fetching books with network error")
        
        fakeService.session.fetchBooks(with: FakeNetworkServiceData.titleQuery) { result in
            switch result {
            case .success(let books):
                XCTAssertEqual(books.count, 0)
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.badURL)
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenNoData_WhenFetchingBooks_ThenErrorIsThrown() {
        fakeService.session = FakeNetworkService(data: nil, response: nil, error: nil)
    
        let expectation = XCTestExpectation(description: "Error when fetching books with no network data")
        
        fakeService.session.fetchBooks(with: FakeNetworkServiceData.titleQuery) { result in
            switch result {
            case .success(let books):
                XCTAssertEqual(books.count, 0)
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.noData)
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenNilResponse_WhenFetchingBooks_ThenErrorIsThrown() {
        fakeService.session = FakeNetworkService(data: FakeNetworkServiceData.correctData,
                                                 response: nil, error: nil)

        let expectation = XCTestExpectation(description: "Error when fetching books with not correct response")

        fakeService.session.fetchBooks(with: FakeNetworkServiceData.titleQuery) { result in
            switch result {
            case .success(let books):
                XCTAssertEqual(books.count, 0)
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.noResponse)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenIncorrectResponse_WhenFetchingBooks_ThenErrorIsThrown() {
        fakeService.session = FakeNetworkService(data: FakeNetworkServiceData.correctData,
                                                 response: FakeNetworkServiceData.responseNotOK, error: nil)

        let expectation = XCTestExpectation(description: "Error when fetching books with not correct response")

        fakeService.session.fetchBooks(with: FakeNetworkServiceData.titleQuery) { result in
            switch result {
            case .success(let books):
                XCTAssertEqual(books.count, 0)
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.noResponse)
            }
            
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenAllCorrect_WhenFetchingBooks_ThenBooksAreNotEmpty() {
        fakeService.session = FakeNetworkService(data: FakeNetworkServiceData.correctData,
                                                 response: FakeNetworkServiceData.responseOK, error: nil)

        let expectation = XCTestExpectation(description: "Success when fetching books with correct data and response")

        fakeService.session.fetchBooks(with: FakeNetworkServiceData.titleQuery) { result in
            switch result {
            case .success(let books):
                XCTAssertEqual(books.count, FakeNetworkServiceData.correctDataBookCount)
            case .failure(let error):
                XCTAssertEqual(error, nil)
            }
            
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
    
}
