//
//  PostListViewModel.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import RxCocoa
import RxSwift

//포스트 리스트 View에 보여질 데이터 가공 담당
class PostListViewModel:BaseVM {

    let service = PostListService()

    let input = Input()
    let output = Output()
    
    struct Input {
        var postList: BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    }
    
    struct Output {
        var postList: BehaviorRelay<[PostRPModel]> = BehaviorRelay.init(value: [])
    }
    
    func bind(){

        /* Input */
        
        //포스트 리스트 호출
        input
            .postList
            .filter{$0 != nil}
            .bind(to: service.input.postList)
            .disposed(by: disposeBag)
        
        /* */
        
        /* Output */
        
        //포스트 리스트 호출 후 리턴데이터
        service
            .output
            .postList
            .map(setPostList(result:))
            .bind(to: output.postList)
            .disposed(by: disposeBag)
        
        /* */
    }

    //포스트 리스트 가공 후 세팅
    func setPostList(result: [PostRPModel]) -> [PostRPModel] {
        var list: [PostRPModel] = []
        list += result.map(postDataHandling(post:))
        return list
    }
    
    //View에 보여질 데이터 가공작업
    func postDataHandling(post: PostRPModel) -> PostRPModel {
        return PostRPModel(body: "내용: \(post.body)", id: post.id, title: "제목: \(post.title)", userId: post.userId)
    }
}
