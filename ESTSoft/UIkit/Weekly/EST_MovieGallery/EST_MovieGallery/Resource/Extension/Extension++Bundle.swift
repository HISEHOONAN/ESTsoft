//
//  Extension_Bundle.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 3/2/25.
//

import Foundation

extension Bundle {
    
    var MovieKey: String {
        guard let file = Bundle.main.path(forResource: "Key", ofType: "plist") else {
            fatalError("Key.plist not found")
        }
        
        guard let resource = NSDictionary(contentsOfFile: file) else {
            fatalError("Failed to load Key.plist")
        }
        
        guard let key = resource["API_KEY"] as? String else {
            fatalError("API_KEY not found in Key.plist")
        }
        
        return key
    }
}

