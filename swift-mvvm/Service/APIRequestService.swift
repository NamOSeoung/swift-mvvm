//
//  APIRequestService.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import Alamofire
import RxSwift
import RxAlamofire

class APIRequestService {
    
    @Inject var header: HeaderCommon
    
    func getable<T:Codable>(URL:String, query:[String:Any]? )-> Observable<T>? {
        return RxAlamofire.requestData(.get, URL, parameters: query, encoding: URLEncoding.default, headers: header.headerSetting(), interceptor: .none)
            .mapObject(type: T.self)
    }
    
    func postable<T:Codable>(URL:String, body:[String:Any]? )-> Observable<T>? {
        return RxAlamofire.requestData(.post, URL, parameters: body, encoding: JSONEncoding.default, headers: header.headerSetting(), interceptor: .none)
            .mapObject(type: T.self)
    }
    
    func deletaable<T:Codable>(URL:String, body:[String:Any]?)-> Observable<T>? {
        return RxAlamofire.requestData(.delete, URL, parameters: body, encoding: JSONEncoding.default, headers: header.headerSetting(), interceptor: .none)
            .mapObject(type: T.self)
    }
    
    func putable<T:Codable>(URL:String, body:[String:Any]?)-> Observable<T>? {
        return RxAlamofire.requestData(.put, URL, parameters: body, encoding: JSONEncoding.default, headers: header.headerSetting(), interceptor: .none)
            .mapObject(type: T.self)
    }
    
    func patchable<T:Codable>(URL:String, body:[String:Any]?)-> Observable<T>? {
        return RxAlamofire.requestData(.patch, URL, parameters: body, encoding: JSONEncoding.default, headers: header.headerSetting(), interceptor: .none)
            .mapObject(type: T.self)
    }
}
