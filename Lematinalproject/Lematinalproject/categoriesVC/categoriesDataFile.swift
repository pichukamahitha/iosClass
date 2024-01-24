//
//  categoriesDataFile.swift
//  Lematinalproject
//
//  Created by Mahitha on 14/10/23.
//

import Foundation
struct categoriesmodel : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    var results : [cataResults]?
    

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case status_code = "status_code"
        case message = "message"
        case api = "api"
        case results = "results"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        status_code = try values.decodeIfPresent(Int.self, forKey: .status_code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        api = try values.decodeIfPresent(String.self, forKey: .api)
        results = try values.decodeIfPresent([cataResults].self, forKey: .results)
        
    }

}
struct cataResults : Codable {
    let title : String?
    let iD : Int?
    let image : String?
//    var ID : Int?
    var isSelected : Bool = false
    enum CodingKeys: String, CodingKey {

        case title = "title"
        case iD = "ID"
        case image = "image"
//        case ID = "Id"
        case isSelected = "isSelected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        image = try values.decodeIfPresent(String.self, forKey: .image)
//        ID = try values.decodeIfPresent(Int.self, forKey: .ID)
        isSelected = try values.decodeIfPresent(Bool.self, forKey: .isSelected) ?? false
    }

}
