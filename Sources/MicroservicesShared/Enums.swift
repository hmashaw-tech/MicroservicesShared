//
//  Enums.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Foundation

public enum CommentStatus: String {
    case approved = "approved"
    case pending = "pending"
    case rejected = "rejected"
}

public enum EventType: String {
    case CommentCreated = "CommentCreated"
    case PostCreated = "PostCreated"
}

