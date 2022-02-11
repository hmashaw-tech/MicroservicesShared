//
//  Event.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public enum Event {
    case commentEvent(CommentEventX)
    case postEvent(PostEventX)
}


extension Event {
    
    public struct InvalidTypeError: Error {
        var decoderType: String
    }
    
    private enum CodingKeys: CodingKey {
        case decoderType
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decoderType = try container.decode(String.self, forKey: .decoderType)
        
        switch decoderType {
        case "commentEvent":
            self = .commentEvent(try CommentEventX(from: decoder))
        case "postEvent":
            self = .postEvent(try PostEventX(from: decoder))
        default:
            throw InvalidTypeError(decoderType: decoderType)
        }
    }
    
}

