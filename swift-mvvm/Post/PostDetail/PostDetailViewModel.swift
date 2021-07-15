//
//  PostDetailViewModel.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import RxCocoa
import RxSwift

//포스트 상세 View에 보여질 데이터 가공 담당
class PostDetailViewModel:BaseVM {

    let service = PostDetailService()

    let input = Input()
    let output = Output()
    
    struct Input {
        var postDetail: BehaviorRelay<Int?> = BehaviorRelay.init(value: nil)
    }
    
    struct Output {
        var postDetail: BehaviorRelay<PostRPModel?> = BehaviorRelay.init(value: nil)
    }
    
    func bind(){

        /* Input */
        
        //포스트 상세 호출
        input
            .postDetail
            .filter{$0 != nil}
            .bind(to: service.input.postDetail)
            .disposed(by: disposeBag)
        
        /* */
        
        /* Output */
        
        //포스트 상세 호출 후 리턴데이터
        service
            .output
            .postDetail
            .filter{$0 != nil}
            .map{ [weak self] result in self?.setPostDetail(post: result!) }
            .bind(to: output.postDetail)
            .disposed(by: disposeBag)
        
        /* */
    }

    //포스트 상세정보 가공 후 세팅
    func setPostDetail(post: PostRPModel) -> PostRPModel {
        return PostRPModel(body: "내용: \(post.body)", id: post.id, title: "제목: \(post.title)", userId: post.userId)
    }
}
