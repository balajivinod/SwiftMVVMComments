//
//  CommentsViewModel.swift
//  SwiftAPICall
//
//  Created by Balaji Duraisamy on 02/09/23.
//

import Foundation

class CommentsViewModel {
    var comments = [CommentsModel]()
    let commentsService: CommentsService
    
    init() {
        self.commentsService = CommentsService()
    }
    
    func fetchComments(completion: @escaping(Bool) -> Void) {
        self.commentsService.getComments { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.comments = model
                    completion(true)
                case .failure(let error):
                    print(error)
                    completion(false)
                }
            }
        }
    }
}
