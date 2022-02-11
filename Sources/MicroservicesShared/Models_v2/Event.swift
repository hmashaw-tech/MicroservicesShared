//
//  Event.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

// Using Codable With Nested JSON Is Both Easy And Fun!
// https://medium.com/@nictheawesome/using-codable-with-nested-json-is-both-easy-and-fun-19375246c9ff

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
        case titleX
        case data
        case id
        case title
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let type = try container.decode(String.self, forKey: .type)
        let titleX = try container.decode(String.self, forKey: .titleX)
        
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        let id = try data.decode(String.self, forKey: .id)
        let title = try data.decode(String.self, forKey: .title)
        
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

