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
    var basetageng : String{
        return"\(Bundle.main.object(forInfoDictionaryKey: "trendingtageng")as! String)"
    }
     var basetagfr : String{
            return"\(Bundle.main.object(forInfoDictionaryKey: "trendingtagfr") as! String)"
        }
    var baseurl4 : String{
        return"\(Bundle.main.object(forInfoDictionaryKey: "latestdataurl")as! String)"
    }
//    var baseurl5 : String{
//        return"\(Bundle.main.object(forInfoDictionaryKey: "trendingurl")as! String)"
//    }
}
