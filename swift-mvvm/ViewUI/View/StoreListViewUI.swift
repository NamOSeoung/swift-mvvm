//
//  StoreListViewUI.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxGesture

class StoreListViewUI: BaseView {
    
    lazy var keywordWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var backBtnWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var backBtnImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back_189")
        return image
    }()
    
    lazy var keywordGL: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    
    lazy var keywordBorderBottom: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var searchListTV: UITableView = {
        let table = UITableView()
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .white
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.register(StoreCell.self,
                                forCellReuseIdentifier: "StoreCell")
        return table
    }()
    
    lazy var searchListIsEmptyWrap:UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    lazy var searchListEmptyGL01:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "🍟 😍 🍤"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    lazy var searchListEmptyGL02:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "해당 맛집의 정보가 아직 없어요"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    
    var storeList: Array<String> = ["ㅇㅇ","ㅁㄴ"]
    var viewModel: StoreListViewModel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        addSubview(keywordWrap)
        keywordWrap.addSubview(keywordGL)
        keywordWrap.addSubview(backBtnWrap)
        backBtnWrap.addSubview(backBtnImage)
        addSubview(keywordBorderBottom)
        addSubview(searchListTV)
        
    }
    
    private func autoLayout() {
        
        keywordWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 40)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0)
            make.width.equalTo(snp.width)
            make.height.equalTo(height)
        }
        
        keywordGL.snp.makeConstraints{ make in
            make.centerY.centerX.equalTo(keywordWrap)
        }
        
        backBtnWrap.snp.makeConstraints{ make in
            make.top.leading.bottom.equalTo(0)
            make.width.equalTo(currentViewSize.width/2)
        }
        
        backBtnImage.snp.makeConstraints{ make in
            make.leading.equalTo(6)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
        
        keywordBorderBottom.snp.makeConstraints{ make in
            make.top.equalTo(keywordWrap.snp.bottom)
            make.width.equalTo(snp.width)
            make.height.equalTo(0.5)
        }
        
        searchListTV.snp.makeConstraints{ make in
            make.top.equalTo(keywordBorderBottom.snp.bottom)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func bindViewModel(vm: StoreListViewModel) {
        viewModel = vm
        
        
    }
}


extension StoreListViewUI: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return storeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StoreCell = tableView.dequeueReusableCell(withIdentifier: "StoreCell") as! StoreCell
//        locationListCell.addressGL.text = locationList[indexPath.row].addressName
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        vm?.uiOutput.selectLocation.accept(locationList[indexPath.row])
    }
}
