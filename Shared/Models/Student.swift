//
//  Student.swift
//  Student
//
//  Created by 陳鈺翎 on 2021/8/7.
//

import Foundation


struct Student: Codable {
    /// The name of the student.
    let name: String
    /// The list of all grades for the student.
    let grades: [Float]
    /// The current grade point average of the student.
    var gpa: Float? {
        guard !grades.isEmpty else { return nil }
        return grades.reduce(0, +) / Float(grades.count)
    }
}
