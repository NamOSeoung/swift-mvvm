//
//  StoreListViewModel.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import RxSwift
import RxCocoa

//상점 리스트 화면 전용 ViewModel
class StoreListViewModel {
    
    private let disposeBag = DisposeBag()

    var input = Input()
    var uiEvent = UIEvent()
    
    @Inject var storeService: StoreService

    struct Input {
        var getStoreList: BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil) //상점 리스트 호출
    }
    
    struct Output {
        
    }
    
    struct UIEvent {
       
    }
    
    init() {
        input.getStoreList.filter{$0 != nil}
            .bind{[weak self] result in
                self?.getStoreList()
            }.disposed(by: disposeBag)
    }
    
    //상점 리스트 호출
    private func getStoreList() {
        storeService.getStoreList()?
            .bind{[weak self] result in
                print(result)
            }.disposed(by: disposeBag)
    }
}

