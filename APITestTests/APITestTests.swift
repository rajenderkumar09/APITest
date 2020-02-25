//
//  APITestTests.swift
//  APITestTests
//
//  Created by Anil on 25/02/20.
//  Copyright © 2020 pop. All rights reserved.
//

import XCTest
@testable import APITest

class APITestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPIWorking() {
        let errorExpectation = self.expectation(description: "404")
        let mockError = NSError(domain: "error", code: 404, userInfo: nil)

        let mockURLSession  = MockURLSession(data: nil, urlResponse: nil, error: mockError)
        var errorResponse: NSError?
        let apiClient = APIClient.shared
        apiClient.session = mockURLSession
        
        apiClient.getData(path: "https://test", completion: { (json, error) in
            errorResponse = error as NSError?
            errorExpectation.fulfill()
        })
        // We ask the unit test to wait our expectation to finish.
        waitForExpectations(timeout: 20) { (error) in
            XCTAssertTrue(errorResponse?.code == mockError.code, "API does not other error")
        }
    }
}


class MockURLSession: URLSession {
  var cachedUrl: URL?
   private let mockTask: MockTask
    init(data: Data?, urlResponse: URLResponse?, error: NSError?) {
        mockTask = MockTask(data: data, urlResponse: urlResponse, error: error)
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        mockTask.completionHandler = completionHandler
        return mockTask
    }
}

class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    private let responseError: Error?

    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)!
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.responseError = error
    }
    
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler(self.data, self.urlResponse, self.responseError)
        }
    }
}
