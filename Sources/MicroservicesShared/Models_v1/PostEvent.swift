//
//  PostEvent.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct PostEvent: Content {
    
    public var type: String?
    public var data: EventPost?
    
    public struct EventPost: Content {
        public var id: String?
        public var title: String?
        
        public init(id: String?, title: String?) {
            self.id = id
            self.title = title
        }
    }
    
    public init(type: String?, data: PostEvent.EventPost?) {
        self.type = type
        self.data = data
    }
    
}

