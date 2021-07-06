//
//  PagingInfo.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

struct PagingInfo : Codable {
    
    let count : Int?
    let next : Bool?
    let page : Int?
    let totalCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case page = "page"
        case totalCount = "total_count"
    }
    
}
