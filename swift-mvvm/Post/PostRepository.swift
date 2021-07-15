//
//  PostRepository.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import RxSwift

//포스트 API 호출 담당 - 공통
class PostRepository {
    
    @Inject var apiRequestService: APIRequestService
    @Inject var apiUrlService: APIUrlService
    
    //포스트 리스트 조회 메소드
    func getPostList()-> Observable<[PostRPModel]>? {
        let URL = apiUrlService.serviceUrl(version: "", path: "/posts/")
        return apiRequestService.getable(URL: URL, query: nil)
    }
    
    //포스트 상세 조회 메소드
    func getPostDetail(postId: Int)-> Observable<PostRPModel>? {
        let URL = apiUrlService.serviceUrl(version: "", path: "/posts/\(postId)")
        return apiRequestService.getable(URL: URL, query: nil)
    }
}
