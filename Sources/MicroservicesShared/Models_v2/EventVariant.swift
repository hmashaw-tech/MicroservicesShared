//
//  EventVariant.swift
//  
//
//  Created by Mark Shaw on 2/11/22.
//

import Vapor

public protocol EventVariant: Content {
    var title: String { get set }
}

