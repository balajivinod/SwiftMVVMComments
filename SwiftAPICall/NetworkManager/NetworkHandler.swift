//
//  NetworkHandler.swift
//  SwiftAPICall
//
//  Created by Balaji Duraisamy on 02/09/23.
//

import Foundation

enum APIError: Error {
    case urlError
    case dataError
    case parseError
}

class NetworkHandler {
    let requestHandler: RequestHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    init(requestHandler: RequestHandlerDelegate = RequestHandler(),
         responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.requestHandler = requestHandler
        self.responseHandler = responseHandler
    }
    func fetchRequest<T: Codable>(type: T.Type, url: URL, completion: @escaping(Result<T, APIError>) -> Void) {
        requestHandler.handleRequest(url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.handleResponse(type: type, data: data) { result in
                    switch result {
                    case success(let model):
                         completion(.success(model as! T))
                    case failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

protocol RequestHandlerDelegate {
    func handleRequest(url: URL, completion: @escaping(Result<Data, APIError>) -> Void)
}
    
class RequestHandler: RequestHandlerDelegate {
    func handleRequest(url: URL, completion: @escaping(Result<Data, APIError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataError))
            }
            completion(.success(data))
        }.resume()
    }
}

protocol ResponseHandlerDelegate {
    func handleResponse<T: Codable>(type: T.Type, data: Data, completion: (Result<T, APIError>) -> Void)
}

class ResponseHandler: ResponseHandlerDelegate {
    func handleResponse<T: Codable>(type: T.Type, data: Data, completion: (Result<T, APIError>) -> Void) {
        let response = try? JSONDecoder().decode(type.self, from: data)
        if let modelResponse = response {
            return completion(.success(modelResponse))
        } else {
            completion(.failure(.parseError))
        }
    }
}
