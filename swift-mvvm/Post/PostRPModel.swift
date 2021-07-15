//
//  PostRPModel.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

//포스트 Repository Response Model
struct PostRPModel: Codable {
    
    let body : String
    let id : Int
    let title : String
    let userId : Int

    enum CodingKeys: String, CodingKey {
            case body = "body"
            case id = "id"
            case title = "title"
            case userId = "userId"
    }
}
