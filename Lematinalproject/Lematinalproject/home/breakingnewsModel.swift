//
//  breakingnewsModel.swift
//  Lematinalproject
//
//  Created by Mahitha on 19/11/23.
//

import Foundation
struct Breakingnews : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    let results : [breakingnewsResult]?
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
        results = try values.decodeIfPresent([breakingnewsResult].self, forKey: .results)
    }
}
struct breakingnewsResult : Codable {
    let title : String?
    let iD : Int?
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case iD = "ID"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
    }
}
