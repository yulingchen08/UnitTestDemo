//
//  School.swift
//  School
//
//  Created by 陳鈺翎 on 2021/8/7.
//

import Foundation


struct School {
    /// Enrolled students.
    let students: [Student]
    /// The top students are defined as students with a GPA >= 4.0.
    var topStudents: [Student] { students(withGPALimit: 4.0) }
}

private extension School {
    func students(withGPALimit gpa: Float) -> [Student] {
        students.filter {
            guard let studentGPA = $0.gpa else { return false }
            return studentGPA >= gpa
        }
    }
}
