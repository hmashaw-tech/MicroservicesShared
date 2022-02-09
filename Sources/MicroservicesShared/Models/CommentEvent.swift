//
//  CommentEvent.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct CommentEvent: Content {
    
    
    
    public var type: String?
    public var data: EventComment?
    
    public struct EventComment: Content {
        public var id: String?
        public var content: String?
        public var postId: String?
        
        public init(id: String?, content: String?, postId: String?) {
            self.id = id
            self.content = content
            self.postId = postId
        }
    }
    
    public init(type: String?, data: CommentEvent.EventComment?) {
        self.type = type
        self.data = data
    }
    
}

