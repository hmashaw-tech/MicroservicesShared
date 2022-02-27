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

