//
//  PostEventX.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public struct PostEventX: EventVariant {
    
    public var type: EventTypeX = .post
    public var titleX: String
    public var data: EventPost
    
    public struct EventPost: Content {
        public var id: String
        public var title: String
        
        public init(id: String, title: String) {
            self.id = id
            self.title = title
        }
        
        public init(emptyPost: EmptyEvent) {
            self.id = ""
            self.title = ""
        }
    }
    
    public init(titleX: String, data: PostEventX.EventPost) {
        self.titleX = titleX
        self.data = data
    }
}

