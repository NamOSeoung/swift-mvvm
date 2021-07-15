//
//  BaseVC.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit
import RxSwift
import RxCocoa

@objc protocol BaseViewControllerCustomizable {
    @objc optional func setupViews()
    @objc optional func setupCalls()
    @objc optional func setupBinds()
    @objc optional func setupEvents()
}

//공통사용 하기위한 기본 ViewController
class BaseVC: UIViewController,BaseViewControllerCustomizable {
    var disposeBag = DisposeBag()
    
    var currentViewSize = UIScreen.main.bounds
    let desighGuideDevicceWidth:CGFloat = 375  //디자인 기준 width
    let desighGuideDevicceHeight:CGFloat = 812 //디자인 기준 height
    
    //constraint 방향 기준
    enum Direction {
        case top
        case left
        case right
        case bottom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupViews()
        _setupCalls()
        _setupBinds()
        _setupEvents()
    }
    
    //UI 초기 호출
    private func _setupViews() {
        view.backgroundColor = .white
        (self as BaseViewControllerCustomizable).setupViews?()
    }
    
    //API등 초기 호출
    private func _setupCalls() {
        (self as BaseViewControllerCustomizable).setupCalls?()
    }
    
    //바인딩 초기호출
    private func _setupBinds() {
        (self as BaseViewControllerCustomizable).setupBinds?()
    }

    //이벤트 초기 호출
    private func _setupEvents() {
        (self as BaseViewControllerCustomizable).setupEvents?()
    }
    
    
    //변경할 관계 비율
    func constraintRatio(direction:Direction,designSize:CGFloat) -> CGFloat{
        var ratio: CGFloat = 0.0
        
        switch direction {
        case .top,.bottom:
            let designRatio = (designSize/desighGuideDevicceHeight)
            ratio = currentViewSize.height * designRatio
            break
        case .left,.right:
            let designRatio = (designSize/desighGuideDevicceWidth)
            ratio = currentViewSize.width * designRatio
            break
        }
        
        
        return ratio
    }
    
    //변경할 비율 (view, font)
    func aspectRatio(designSize:CGFloat) -> CGFloat {
        var ratio: CGFloat = 0.0
        
        let designRatio = (designSize/desighGuideDevicceWidth)
        ratio = currentViewSize.width * designRatio
        
        return ratio
    }
    
    //컬러 간편 세팅
    func colorSetting(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
}
