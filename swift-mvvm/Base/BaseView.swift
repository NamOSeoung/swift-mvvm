//
//  BaseView.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit
import RxSwift

//디바이스 대응을 위한 BaseView
class BaseView: UIView {
    
    var currentViewSize = UIScreen.main.bounds //빌드 된 디바이스 사이즈
    let designDeviceWidthSize:CGFloat = 375  //디자인 기준 width
    let designDeviceHeightSize:CGFloat = 812 //디자인 기준 height
    
    var disposeBag = DisposeBag()
    
    //constraint 방향 기준
    enum Direction {
        case top
        case left
        case right
        case bottom
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
    }
    
    /// - Returns: 비율 변환 된 값
    /// - Important: 변경할 관계 비율
    /// - parameter direction: 관계 설정 할 방향
    /// - parameter standardSize: 디자인 기준 사이즈
    func constraintRatio(direction:Direction,standardSize:CGFloat) -> CGFloat{
        var ratio: CGFloat = 0.0
        
        switch direction {
        case .top,.bottom:
            let designRatio = (standardSize/designDeviceHeightSize)
            ratio = currentViewSize.height * designRatio
            break
        case .left,.right:
            let designRatio = (standardSize/designDeviceWidthSize)
            ratio = currentViewSize.width * designRatio
            break
        }
        
        
        return ratio
    }
    
    /// - parameter standardSize: 디자인 기준 사이즈
    /// - Returns: 비율 변환 된 값
    /// - Important: 변경할 비율 사이즈 (view, font)
    func aspectRatio(standardSize:CGFloat) -> CGFloat {
        var ratio: CGFloat = 0.0
        
        let standardRatio = (standardSize/designDeviceWidthSize)
        ratio = currentViewSize.width * standardRatio
        
        return ratio
    }
    
    /// - parameter r: 빨강
    /// - parameter g: 녹색
    /// - parameter b: 파랑
    /// - parameter alpha: 투명도
    /// - Returns: 색 적용 된 값
    /// - Important: 컬러 간편 세팅
    func colorSetting(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    
    /**

    실제사이즈에 디자인 전체 사이즈 만큼 퍼센트 계산한 결과값

    

    - parameter size:       컴포넌트 사이즈

    - parameter designSize: 디자인 기준 사이즈

    

    - returns:

    */

}
