//
//  CommentsModel.swift
//  SwiftAPICall
//
//  Created by Balaji Duraisamy on 02/09/23.
//

import Foundation

struct CommentsModel: Codable, Identifiable {
    let postID, id: Int?
    let name, email, body: String?
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
