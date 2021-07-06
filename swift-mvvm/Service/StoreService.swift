//
//  StoreService.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//


import Foundation
import RxSwift

//상점 관련 서비스
class StoreService {
    
    @Inject private var apiUrlService: APIUrlService
    @Inject private var apiRequestService: APIRequestService
    
    //상점 리스트 조회 메소드
    func getStoreList()-> Observable<StoreRPModel>? {
        let URL = apiUrlService.serviceUrl(version: "", path: "/main/places")
        return apiRequestService.getable(URL: URL, query: nil)
    }
}
