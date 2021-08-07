//
//  SchoolTests.swift
//  SchoolTests
//
//  Created by 陳鈺翎 on 2021/8/7.
//

import XCTest

class SchoolTests: XCTestCase {
    
    // Mock students
        private let student1 = Student(name: "Andy", grades: [2.0, 3.5, 4.0])
        private let student2 = Student(name: "Eric", grades: [4.0, 4.0, 4.0])
        private let student3 = Student(name: "Joe", grades: [1.0, 1.5])
        private let student4 = Student(name: "John", grades: [])
        private let student5 = Student(name: "Penny", grades: [4.0, 4.0, 4.0])
        
        // MARK: - topStudents (computed variable)
        
        /// Scenario with no students at all
        func testTopStudentsWithNoStudents() {
            let school = School(students: [])
            XCTAssertTrue(school.topStudents.isEmpty)
        }

        /// Scenario with no top students
        func testTopStudentsWithNoTopStudents() {
            let school = School(students: [student1, student3, student4])
            XCTAssertTrue(school.topStudents.isEmpty)
        }
        
        /// Scenario with two top students (#2 and #5)
        func testTopStudentsWithTwoTopStudents() {
            let school = School(students: [student1, student2, student3, student4, student5])
            let topStudents = school.topStudents
            XCTAssertEqual(topStudents.count, 2)
            XCTAssertEqual(topStudents.first?.name, "Eric")
            XCTAssertEqual(topStudents.last?.name, "Penny")
        }
        
        /// Scenario with one top student (#2)
        func testTopStudentsWithOneTopStudent() {
            let school = School(students: [student1, student2, student3, student4])
            let topStudents = school.topStudents
            XCTAssertEqual(topStudents.count, 1)
            XCTAssertEqual(topStudents.first?.name, "Eric")
        }
}

