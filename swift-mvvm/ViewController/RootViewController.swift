//
//  RootViewController.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit

class RootViewController: BaseViewController {
    
    let vu = RootViewUI()
    let vm = RootViewModel()
    
    @Inject var globalAlert: GlobalAlert
    override func viewDidLoad() {
        super.viewDidLoad()
        view = vu
        
        viewModelBind()
    }
    
    
    private func viewModelBind() {
        vu.bindViewModel(vm: vm)
        
        vm.uiEvent.tourEvent.filter{$0 != nil}
            .bind{[weak self] _ in
                self?.storeListMove()
        }.disposed(by: disposeBag)
        
        vm.uiEvent.kakaoEvent.filter{$0 != nil}
            .bind{[weak self] _ in
                self?.globalAlert.commonAlert(title: "테스트\n", content: "카카오 로그인 클릭", vc: self!)
            }.disposed(by: disposeBag)
        
        vm.uiEvent.appleEvent.filter{$0 != nil}
            .bind{[weak self] _ in
                self?.globalAlert.commonAlert(title: "테스트\n", content: "카카오 로그인 클릭", vc: self!)
            }.disposed(by: disposeBag)
    }
    
    private func storeListMove() {
        let storeListVC = StoreListViewController()
        storeListVC.modalTransitionStyle = .coverVertical
        storeListVC.modalPresentationStyle = .fullScreen
        present(storeListVC, animated: true, completion: nil)
    }
}

