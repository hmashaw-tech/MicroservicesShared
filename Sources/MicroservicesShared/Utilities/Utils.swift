//
//  Utils.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct Utils {
    
    public static func getRandomBytes(_ byteCount: Int = 4) -> String {
        
        #if os(Linux)
        
        let array = [UInt8](repeating: UInt8.random(in: 0...255), count: byteCount)
        return array.map { String(format: "%02X", $0) }.joined()
        
        #else
        
        var bytes = [UInt8](repeating: 0, count: byteCount)
        let  _ = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
        
        // https://stackoverflow.com/questions/24229505/how-to-convert-an-int-to-hex-string-in-swift/24229531
        return bytes.map { String(format: "%02X", $0) }.joined()
        
        #endif
        
    }
    
    func getRandomBytesLinux(_ byteCount: Int = 4) -> String {
        let array = [UInt8](repeating: UInt8.random(in: 0...255), count: byteCount)
        return array.map { String(format: "%02X", $0) }.joined()
    }
}

