//
//  BaseVM.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import RxSwift

@objc protocol BaseViewModelCustomizable {
    @objc optional func bind()
}

//공통사용 하기위한 기본 ViewModel
class BaseVM: BaseViewModelCustomizable {
    var disposeBag = DisposeBag()
    
    init() {
        _bind()
    }
    
    private func _bind() {
        (self as BaseViewModelCustomizable).bind?()
    }
}
