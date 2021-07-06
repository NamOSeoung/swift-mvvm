//
//  BaseTableViewCell.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit
import RxSwift

//디바이스 대응을 위한 BaseTableViewCell
class BaseTableViewCell:UITableViewCell {
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //변경할 관계 비율
    func constraintRatio(direction:Direction,standardSize:CGFloat) -> CGFloat{
        var ratio: CGFloat = 0.0
        
        switch direction {
        case .top,.bottom:
            let standardRatio = (standardSize/desighGuideDevicceHeight)
            ratio = currentViewSize.height * standardRatio
            break
        case .left,.right:
            let standardRatio = (standardSize/desighGuideDevicceWidth)
            ratio = currentViewSize.width * standardRatio
            break
        }
        
        
        return ratio
    }
    
    //변경할 비율 (view, font)
    func aspectRatio(standardSize:CGFloat) -> CGFloat {
        var ratio: CGFloat = 0.0
        
        let standardRatio = (standardSize/desighGuideDevicceWidth)
        ratio = currentViewSize.width * standardRatio
        
        return ratio
    }
    
    //컬러 간편 세팅
    func colorSetting(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    //Veloo BrandColor 공통
    func velooColorSetting() -> UIColor {
        return UIColor(red: 93/255, green: 194/255, blue: 208/255, alpha: 1)
    }
}
