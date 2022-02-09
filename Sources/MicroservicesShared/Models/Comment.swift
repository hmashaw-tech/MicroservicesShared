//
//  Comment.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct Comment: Content {
    public var id: String?
    public var content: String
}

