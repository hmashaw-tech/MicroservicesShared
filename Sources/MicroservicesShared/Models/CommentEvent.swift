//
//  CommentEvent.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

struct CommentEvent: Content {
    
    let type: String?
    let data: EventComment?
    
    struct EventComment: Content {
        var id: String?
        var content: String?
        var postId: String?
    }
    
}

