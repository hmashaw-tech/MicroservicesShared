//
//  Event.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public enum Event {
    case comment(CommentEventX)
    case post(PostEventX)
}


extension Event: Content {
    
    public struct InvalidTypeError: Error {
        var type: String
    }
    
    private enum CodingKeys: CodingKey {
        case type
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "comment":
            self = .comment(try CommentEventX(from: decoder))
        case "post":
            self = .post(try PostEventX(from: decoder))
        default:
            throw InvalidTypeError(type: type)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .comment(let event):
            try container.encode(event.type, forKey: .type)
        case .post(let event):
            try container.encode(event.type, forKey: .type)
        }
    }
    
}

