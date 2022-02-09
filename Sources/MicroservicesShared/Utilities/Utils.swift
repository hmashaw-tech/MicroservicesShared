//
//  Utils.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Foundation

struct Utils {
    
    static func getRandomBytes(_ byteCount: Int = 4) -> String {
        
        var bytes = [UInt8](repeating: 0, count: byteCount)
        let  _ = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
        
        // https://stackoverflow.com/questions/24229505/how-to-convert-an-int-to-hex-string-in-swift/24229531
        return bytes.map { String(format: "%02X", $0) }.joined()
    }
}

