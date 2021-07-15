//
//  PostDetailService.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import RxSwift
import RxCocoa

//포스트 상세 Business Logic 담당
class PostDetailService:BaseSVC {
    
    let repository = PostRepository()
    
    let input = Input()
    let output = Output()
    
    struct Input {
        var postDetail: BehaviorRelay<Int?> = BehaviorRelay.init(value: nil)
    }
    
    struct Output {
        var postDetail: BehaviorRelay<PostRPModel?> = BehaviorRelay.init(value: nil)
    }

    func bind() {
        input
            .postDetail
            .filter{$0 != nil}
            .bind{[weak self] result in
                self?.getPostList(postId: result!)
            }.disposed(by: disposeBag)
    }

    //포스트 상세 호출
    func getPostList(postId: Int) {
    
        //포스트 상세 호출 후 세팅
        repository
            .getPostDetail(postId: postId)?
            .bind(to: output.postDetail)
            .disposed(by: disposeBag)

    }
}
