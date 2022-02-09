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
    }
    
}

