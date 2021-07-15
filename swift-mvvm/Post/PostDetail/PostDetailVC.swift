//
//  PostDetailVC.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit
import RxCocoa
import RxSwift
import RxGesture

//포스트 상세 전용 ViewController
class PostDetailVC: BaseVC {
    
    /* 실질적으로 이벤트 처리에 직접적으로 사용할 View 요소만 변수 세팅 */
    
    var closeWrap: UIView! //뒤로가기
    var titleGL: UILabel!
    var contentGL: UILabel!
    
    /* */
    
    var postId: Int = 0
    
    private var viewModel = PostDetailViewModel()
    
    func setupCalls() {
        viewModel
            .input
            .postDetail
            .accept(postId)
    }
    
    func setupBinds() {
        
        //포스트 상세정보 response 공통사용
        let response = viewModel.output.postDetail.filter{$0 != nil}.share()
        
        //제목 바인딩
        response
            .map{$0!.title}
            .bind(to: titleGL.rx.text)
            .disposed(by: disposeBag)
        
        //내용 바인딩
        response
            .map{$0!.body}
            .bind(to: contentGL.rx.text)
            .disposed(by: disposeBag)
    }
    
    func setupEvents() {
        
        //뒤로가기
        closeWrap
            .rx
            .tapGesture()
            .when(.recognized)
            .bind{[weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
    }
}
