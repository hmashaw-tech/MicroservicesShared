//
//  CommentEventX.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public struct CommentEventX: EventVariant {
    
    public var type: EventType { .comment }
    public var title: String
    public var data: EventComment
    
    public struct EventComment: Content {
        public var id: String
        public var content: String
        public var status: String
        public var postId: String
        
        public init(id: String, content: String, status: String, postId: String) {
            self.id = id
            self.content = content
            self.status = status
            self.postId = postId
        }
    }
    
    public init(title: String, data: CommentEventX.EventComment) {
        self.title = title
        self.data = data
    }
}

