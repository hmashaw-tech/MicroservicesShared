//
//  Enums.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public enum CommentStatus: String {
    case approved = "approved"
    case pending = "pending"
    case rejected = "rejected"
}


public enum EventType: String {
    case PostCreated = "PostCreated"
    
    case CommentCreated = "CommentCreated"
    case CommentModerated = "CommentModerated"
    case CommentUpdated = "CommentUpdated"
    
    case EventNotMeantForMe = "EventNotMeantForMe"
}


public enum EmptyEvent {
    case YesIwantAnEmptyEvent
}


public enum HTTPError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}


public enum EndPoint {
    case local
    case k8s
    
    public var postsService: String {
        switch self {
        case .local:
            return "http://localhost:4000/events"
        case .k8s:
            return "http://posts-srv:4000/events"
        }
    }
    
    public var commentsService: String {
        switch self {
        case .local:
            return "http://localhost:4001/events"
        case .k8s:
            return "http://comments-srv:4001/events"
        }
    }
    
    public var queryService: String {
        switch self {
        case .local:
            return "http://localhost:4002/events"
        case .k8s:
            return "http://query-srv:4002/events"
        }
    }
    
    public var moderationService: String {
        switch self {
        case .local:
            return "http://localhost:4003/events"
        case .k8s:
            return "http://moderation-srv:4003/events"
        }
    }
    
    public var eventsbusService: String {
        switch self {
        case .local:
            return "http://localhost:4005/events"
        case .k8s:
            return "http://event-bus-srv:4005/events"
        }
    }
}

