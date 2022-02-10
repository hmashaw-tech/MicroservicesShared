//
//  Post.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct Post: Content {
    
    public var id: String?
    public var title: String
    
    public init(id: String?, title: String) {
        self.id = id
        self.title = title
    }
    
}

