//
//  APIServiceTest.swift
//  APIServiceTest
//
//  Created by 陳鈺翎 on 2021/8/8.
//

import XCTest

class APIServiceTest: XCTestCase {

    var apiService: APIServiceProtocol!
    var mockURLSessionRequestSender: RequestSender!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockURLSessionRequestSender = MockURLSessionRequestSender()
        apiService = APIService(requestSender: mockURLSessionRequestSender)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockURLSessionRequestSender = nil
        apiService = nil 
    }

    func testFetchStudetWithSuccess() {
        var responseName = ""
        let expectation = self.expectation(description: "apiTest")
        apiService.fetchStudent({ result in
            
            switch result {
            case .success(let student):
                responseName = student.name
            case .failure(_):
                break
            }
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 3, handler: { error in
            XCTAssertNil(error)
            XCTAssertEqual(responseName, "Andy")
        })
    }

}

class MockURLSessionRequestSender: RequestSender {
    func send<T>(_ r: T, handler: @escaping (Data) -> Void) where T : Request {
        let responseData = Student(name: "Andy", grades: [5,5,4.5])
        let encoder = JSONEncoder()
        let data = try! encoder.encode(responseData)
        handler(data)
    }
}

class MockAPIService: APIServiceProtocol {
    let responseData = Student(name: "Andy", grades: [5,5,4.5])
    func fetchStudent(_ complete: @escaping (Result<Student, Error>) -> Void) {
        complete(.success(responseData))
    }
}
