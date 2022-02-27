//
//  PostEvent.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public struct PostEvent: EventVariant {
    
    public var type: MSEventType = .post
    public var eventTitle: String
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
    
    public init(title: String, data: PostEvent.EventPost) {
        self.eventTitle = title
        self.data = data
    }
}

