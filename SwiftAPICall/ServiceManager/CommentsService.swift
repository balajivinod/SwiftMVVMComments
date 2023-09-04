//
//  CommentsService.swift
//  SwiftAPICall
//
//  Created by Balaji Duraisamy on 02/09/23.
//

import Foundation

class CommentsService {
    func getComments(completion: @escaping(Result<[CommentsModel], APIError>) -> Void) {
        guard let url = URL(string: URLPath.commentsURL.rawValue) else {
            return completion(.failure(.urlError))
        }
        NetworkHandler().fetchRequest(type: [CommentsModel].self, url: url, completion: completion)
    }
}
