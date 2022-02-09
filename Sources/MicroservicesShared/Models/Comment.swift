//
//  Comment.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct Comment: Content {
    
    public var id: String?
    public var content: String
    public var status: String
    
    public init(id: String, content: String, status: String) {
        self.id = id
        self.content = content
        self.status = CommentStatus.pending.rawValue
    }
}

