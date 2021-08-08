//
//  Request.swift
//  Request
//
//  Created by 陳鈺翎 on 2021/8/8.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}


protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: [String: Any]? { get }
    
    //associatedtype Response: Decodable
}

extension Request {
    var parameter: [String: Any]? {
        return nil
    }
}

protocol RequestSender {
    var host: String { get }
    func send<T: Request>(_ r: T, handler: @escaping (Data) -> Void)
}


extension RequestSender {
    var host: String {
        return "https:wethaer.json.tw/"
    }
}


struct URLSessionRequestSender: RequestSender {
    func send<T>(_ r: T, handler: @escaping (Data) -> Void) where T : Request {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        if let body = r.parameter, let data = try? JSONSerialization.data(withJSONObject: body, options: []) {
            request.httpBody = data
        }
        let task = URLSession.shared.dataTask(with: request) { data, resp, error in
            if let error = error {
                print(error)
            } else {
                if let data = data {
                    handler(data)
                }
            }
        }
        task.resume()
    }
    
}


struct StudentRequest: Request {
    let region: String
    let id: String 
    var path: String {
        return "/api?region=\(region)&_=\(id)"
    }
    var method: HTTPMethod = .get
}
