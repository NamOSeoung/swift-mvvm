//
//  Place.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

struct Place : Codable {
    
    let address : String?
    let category : String?
    let latitude : Float?
    let longitude : Float?
    let name : String?
    let placeId : String?
    let roadAddress : String?
    let shutdownFlag : Bool?
    let tel : String?
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case category = "category"
        case latitude = "latitude"
        case longitude = "longitude"
        case name = "name"
        case placeId = "place_id"
        case roadAddress = "road_address"
        case shutdownFlag = "shutdown_flag"
        case tel = "tel"
    }
    
}
