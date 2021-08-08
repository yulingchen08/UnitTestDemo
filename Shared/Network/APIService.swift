//
//  APIService.swift
//  APIService
//
//  Created by 陳鈺翎 on 2021/8/8.
//

import Foundation

protocol APIServiceProtocol {
    func fetchStudent(_ complete: @escaping (Result<Student, Error>) -> Void)
}

class APIService: APIServiceProtocol {
    
    let requestSender: RequestSender
    init(requestSender: RequestSender) {
        self.requestSender = requestSender
    }
    
    func fetchStudent(_ complete: @escaping (Result<Student, Error>) -> Void) {
        let request = StudentRequest(region: "abc", id: "1")
        requestSender.send(request, handler: { data in
            let decoder = JSONDecoder()
            if let dataModel = try? decoder.decode(Student.self, from: data) {
                complete(.success(dataModel))
            }
        })
    }
    
    
}
