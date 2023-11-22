//
//  singelton.swift
//  Lematinalproject
//
//  Created by anvesh on 22/11/23.
//

import Foundation

class globalclass{
    
    static let shared = globalclass()
    private init(){}
    var baseurl : String {
        return "\(Bundle.main.object(forInfoDictionaryKey: "englishbaseUrl") as! String)"
    }
    
    
}
