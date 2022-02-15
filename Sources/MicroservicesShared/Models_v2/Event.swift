//
//  Event.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

// Using Codable With Nested JSON Is Both Easy And Fun!
// https://medium.com/@nictheawesome/using-codable-with-nested-json-is-both-easy-and-fun-19375246c9ff

import Vapor

// @dynamicMemberLookup
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
        case content
        case status
        case postId
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "post":
            self = .post(try PostEventX(from: decoder))
        case "comment":
            self = .comment(try CommentEventX(from: decoder))
        default:
            throw InvalidTypeError(type: type)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: CodingKeys.self)
        var dataContainer = rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        switch self {
        case .post(let event):
            try rootContainer.encode(event.type, forKey: .type)
            try rootContainer.encode(event.titleX, forKey: .titleX)
            try dataContainer.encode(event.data.id, forKey: .id)
            try dataContainer.encode(event.data.title, forKey: .title)
            
        case .comment(let event):
            try rootContainer.encode(event.type, forKey: .type)
            try rootContainer.encode(event.titleX, forKey: .titleX)
            try dataContainer.encode(event.data.id, forKey: .id)
            try dataContainer.encode(event.data.content, forKey: .content)
            try dataContainer.encode(event.data.status, forKey: .status)
            try dataContainer.encode(event.data.postId, forKey: .postId)
        }
    }
    
}

