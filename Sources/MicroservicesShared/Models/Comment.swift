//
//  Comment.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

struct Comment: Content {
    var id: String?
    var content: String
}

