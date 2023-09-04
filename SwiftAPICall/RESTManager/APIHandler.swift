//
//  APICaller.swift
//  SwiftAPICall
//
//  Created by Balaji Duraisamy on 02/09/23.
//

import Foundation

private enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case json = "application/json"
    case apiKey = "X-RapidAPI-Key"
    case apiValue = "SIGN-UP-FOR-KEY"
    case hostKey = "X-RapidAPI-Host"
    case hostValue = "weatherapi-com.p.rapidapi.com"
}

enum URLPath: String {
    case weatherURL = "https://weatherapi-com.p.rapidapi.com/current.json?q=53.1%2C-0.13"
    case commentsURL = "https://jsonplaceholder.typicode.com/comments"
}

private enum HTTPMethod: String {
    case get = "GET"
}

enum APIHandler {
    case showWeatherReport
    case showComments
    func getURLRequest() -> NSMutableURLRequest {
        switch self {
        case .showWeatherReport:
            let headers = [HTTPHeaderField.apiKey.rawValue: HTTPHeaderField.apiValue.rawValue,
                           HTTPHeaderField.hostKey.rawValue: HTTPHeaderField.hostValue.rawValue]
            let url = URL(string: URLPath.weatherURL.rawValue)!
            let urlRequest = NSMutableURLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.allHTTPHeaderFields = headers
            urlRequest.cachePolicy = .useProtocolCachePolicy
            urlRequest.timeoutInterval = 10.0
            return urlRequest
        case .showComments:
            let headers = [HTTPHeaderField.contentType.rawValue: HTTPHeaderField.json.rawValue]
            let url = URL(string: URLPath.commentsURL.rawValue)!
            let urlRequest = NSMutableURLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.allHTTPHeaderFields = headers
            urlRequest.cachePolicy = .useProtocolCachePolicy
            urlRequest.timeoutInterval = 10.0
            return urlRequest
        }
    }
    
    func getModelType() {
        
    }
}
