//
//  dataFile.swift
//  Lematinalproject
//
//  Created by Mahitha on 21/10/23.
//

import Foundation
struct aboutdata : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    let results : [Results]?

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
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }

}
struct Results : Codable {
    let title : String?
    let logo : String?
    let contet : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case logo = "logo"
        case contet = "contet"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        contet = try values.decodeIfPresent(String.self, forKey: .contet)
    }

}
