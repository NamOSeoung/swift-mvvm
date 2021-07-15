//
//  BaseSVC.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import RxSwift

@objc protocol BaseServiceCustomizable {
    @objc optional func bind()
}

//공통사용 하기위한 기본 Service
class BaseSVC: BaseServiceCustomizable {
    var disposeBag = DisposeBag()
    
    init() {
        _bind()
    }
    
    private func _bind() {
        (self as BaseServiceCustomizable).bind?()
    }
}
