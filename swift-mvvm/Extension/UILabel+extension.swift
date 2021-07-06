//
//  UILabel+extension.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit

//UILabel 확장파일
extension UILabel {
    //Label 줄 간격 세팅
    func setLinespace(spacing: CGFloat) {
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = spacing
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, attributeString.length))
            attributedText = attributeString
        }
    }
    
    //컬러 간편 세팅
    func colorSetting(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        textColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
