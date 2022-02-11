//
//  EventVariant.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public protocol EventVariant: Decodable {
    var type: String { get }
}

