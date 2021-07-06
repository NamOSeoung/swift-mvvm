//
//  StoreRPModelData.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

struct StoreRPModelData : Codable {
    
    let pagingInfo : PagingInfo?
    let places : [Place]?
    
    enum CodingKeys: String, CodingKey {
        case pagingInfo = "paging_info"
        case places = "places"
    }
    
}
