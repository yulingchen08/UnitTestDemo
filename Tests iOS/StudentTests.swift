//
//  StudentTests.swift
//  StudentTests
//
//  Created by 陳鈺翎 on 2021/8/7.
//

import XCTest
@testable import UnitTestDemo

class StudentTests: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    func testGDPWithNoGrade() {
        let student = Student(name: "Andy", grades: [])
        XCTAssertNil(student.gpa)
    }
    
    func testGPAWithTenGrades() {
        let eric = Student(name: "Eric", grades: [100,100,100,100])
        let jacky = Student(name: "Jacky", grades: [90,90,92,92])
        let jane = Student(name: "Jane", grades: [40, 40, 50, 50])
        
        XCTAssertEqual(eric.gpa, 100)
        XCTAssertEqual(jacky.gpa, 91)
        XCTAssertEqual(jane.gpa, 45)
    }
    
    func testGPAWithExtremeNumbers() {
        let student = Student(name: "Max", grades: [Float(Int.min), Float(Int.max)])
        XCTAssertEqual(student.gpa, 0)
    }


}
