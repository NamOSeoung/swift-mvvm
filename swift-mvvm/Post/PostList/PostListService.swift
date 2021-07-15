//
//  PostListService.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import RxSwift
import RxCocoa

//포스트 리스트 Business Logic 담당
class PostListService:BaseSVC {
    
    let repository = PostRepository()
    
    let input = Input()
    let output = Output()
    
    struct Input {
        var postList: BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    }
    
    struct Output {
        var postList: BehaviorRelay<[PostRPModel]> = BehaviorRelay.init(value: [])
    }

    func bind() {
        input
            .postList
            .filter{$0 != nil}
            .bind{[weak self] _ in
                self?.getPostList()
            }.disposed(by: disposeBag)
    }

    //포스트 리스트 호출
    func getPostList() {
    
        //포스트 리스트 호출 후 세팅
        repository
            .getPostList()?
            .bind(to: output.postList)
            .disposed(by: disposeBag)

    }
}
