//
//  PostEventX.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public struct PostEventX: EventVariant {
    
    public var type: EventType { .post }
    public var title: String
    public var data: EventPost
    
    public struct EventPost: Content {
        public var id: String
        public var type: String
        
        public init(id: String, type: String) {
            self.id = id
            self.type = type
        }
    }
    
    public init(title: String, data: PostEventX.EventPost) {
        self.title = title
        self.data = data
    }
}

