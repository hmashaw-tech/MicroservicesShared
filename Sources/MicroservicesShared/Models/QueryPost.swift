//
//  QueryPost.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct QueryPost: Content {
    
    public var id: String?
    public var title: String
    public var comments: [Comment?]?
    
    internal init(id: String?, title: String, comments: [Comment?]?) {
        self.id = id
        self.title = title
        self.comments = comments
    }
    
}

