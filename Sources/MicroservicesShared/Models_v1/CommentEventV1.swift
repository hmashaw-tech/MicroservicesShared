//
//  CommentEventV1.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct CommentEventV1: Content {
    
    public var type: String?
    public var data: EventComment?
    
    public struct EventComment: Content {
        public var id: String?
        public var content: String?
        public var status: String?
        public var postId: String?
        
        public init(id: String?, content: String?, status: String?, postId: String?) {
            self.id = id
            self.content = content
            self.status = status
            self.postId = postId
        }
    }
    
    public init(type: String?, data: CommentEventV1.EventComment?) {
        self.type = type
        self.data = data
    }
    
}

