//
//  articlemodel.swift
//  Lematinalproject
//
//  Created by Mahitha on 23/11/23.
//

import Foundation
struct feature : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    let results : [FeatureResults]?
    let current_page : Int?
    let total_pages  : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case status_code = "status_code"
        case message = "message"
        case api = "api"
        case results = "results"
        case current_page = "current_page"
        case total_pages  = "total_pages "
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        status_code = try values.decodeIfPresent(Int.self, forKey: .status_code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        api = try values.decodeIfPresent(String.self, forKey: .api)
        results = try values.decodeIfPresent([FeatureResults].self, forKey: .results)
        current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
        total_pages  = try values.decodeIfPresent(Int.self, forKey: .total_pages )
    }

}
struct FeatureResults : Codable {
    let title : String?
    let iD : Int?
    let author_name : String?
    let image_url : String?
    let date : String?
    let primary_category : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case iD = "ID"
        case author_name = "author_name"
        case image_url = "image_url"
        case date = "date"
        case primary_category = "primary_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        primary_category = try values.decodeIfPresent(String.self, forKey: .primary_category)
    }

}

struct latestdatamodel : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    let results : [latestResults]?
    let current_page : Int?
    let total_pages  : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case status_code = "status_code"
        case message = "message"
        case api = "api"
        case results = "results"
        case current_page = "current_page"
        case total_pages  = "total_pages "
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        status_code = try values.decodeIfPresent(Int.self, forKey: .status_code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        api = try values.decodeIfPresent(String.self, forKey: .api)
        results = try values.decodeIfPresent([latestResults].self, forKey: .results)
        current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
        total_pages  = try values.decodeIfPresent(Int.self, forKey: .total_pages )
    }

}
struct latestResults : Codable {
    let title : String?
    let iD : Int?
    let image_url : String?
    let date : String?
    let primary_category : String?
    let author_name  : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case iD = "ID"
        case image_url = "image_url"
        case date = "date"
        case primary_category = "primary_category"
        case author_name  = "author_name "
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        primary_category = try values.decodeIfPresent(String.self, forKey: .primary_category)
        author_name  = try values.decodeIfPresent(String.self, forKey: .author_name )
    }

}
struct trendingdatamodel : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    let results : [trendResults]?
    let current_page : Int?
    let total_pages  : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case status_code = "status_code"
        case message = "message"
        case api = "api"
        case results = "results"
        case current_page = "current_page"
        case total_pages  = "total_pages "
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        status_code = try values.decodeIfPresent(Int.self, forKey: .status_code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        api = try values.decodeIfPresent(String.self, forKey: .api)
        results = try values.decodeIfPresent([trendResults].self, forKey: .results)
        current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
        total_pages  = try values.decodeIfPresent(Int.self, forKey: .total_pages )
    }

}

struct trendResults : Codable {
    let title : String?
    let iD : Int?
    let author_name : String?
    let image_url : String?
    let date : String?
    let primary_category : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case iD = "ID"
        case author_name = "author_name"
        case image_url = "image_url"
        case date = "date"
        case primary_category = "primary_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        primary_category = try values.decodeIfPresent(String.self, forKey: .primary_category)
    }

}
struct trendingtagengmodel : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    let results : [tagResults]?

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
        results = try values.decodeIfPresent([tagResults].self, forKey: .results)
    }

}
struct tagResults : Codable {
    let tag : String?

    enum CodingKeys: String, CodingKey {

        case tag = "tag"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tag = try values.decodeIfPresent(String.self, forKey: .tag)
    }

}


struct searchdatamodel : Codable {
    let status : String?
    let status_code : Int?
    let message : String?
    let api : String?
    let results : [searchResults]?
    let current_page : Int?
    let total_pages : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case status_code = "status_code"
        case message = "message"
        case api = "api"
        case results = "results"
        case current_page = "current_page"
        case total_pages = "total_pages"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        status_code = try values.decodeIfPresent(Int.self, forKey: .status_code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        api = try values.decodeIfPresent(String.self, forKey: .api)
        results = try values.decodeIfPresent([searchResults].self, forKey: .results)
        current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
    }

}
struct searchResults : Codable {
    let title : String?
    let iD : Int?
    let author_name : String?
    let image_url : String?
    let date : String?
    let primary_category : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case iD = "ID"
        case author_name = "author_name"
        case image_url = "image_url"
        case date = "date"
        case primary_category = "primary_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        iD = try values.decodeIfPresent(Int.self, forKey: .iD)
        author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        primary_category = try values.decodeIfPresent(String.self, forKey: .primary_category)
    }

}
