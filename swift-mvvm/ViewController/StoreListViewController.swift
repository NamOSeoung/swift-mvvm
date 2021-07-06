//
//  StoreListViewController.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

class StoreListViewController: BaseViewController {
    
    let vu = StoreListViewUI()
    let vm = StoreListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = vu
        
        viewModelBind()
    }
    
    
    private func viewModelBind() {
        vu.bindViewModel(vm: vm)
        vm.input.getStoreList.accept(true) //상점리스트 초기 호출작업
}

}
