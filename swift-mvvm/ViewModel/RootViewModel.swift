//
//  RootViewModel.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import RxSwift
import RxCocoa

//스플래시 후 루트 화면 전용 ViewModel
class RootViewModel {
    
    private let disposeBag = DisposeBag()

    var uiEvent = UIEvent()

    struct UIEvent {
        var tourEvent: BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil) //일단 둘러보기 이벤트
        var kakaoEvent: BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil) //카카오 로그인 이벤트
        var appleEvent: BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil) //애플 로그인 이벤트
    }
    
    init() {}
}
