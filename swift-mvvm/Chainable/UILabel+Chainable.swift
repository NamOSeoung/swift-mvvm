//
//  UILabel+Chainable.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit

extension Chain where Origin: UILabel {
    
    enum FontWeight {
        case regular
        case semiBold
        case bold
    }
    
    func setText(_ text: String) -> Chain {
        origin.text = text
        return self
    }
    
    func setTextColor(_ color: UIColor) -> Chain {
        origin.textColor = color
        return self
    }
    
    func setNumberOfLines(_ line: Int) -> Chain {
        origin.numberOfLines = line
        return self
    }
    
    func setLineBreak(_ mode: NSLineBreakMode) -> Chain {
        origin.lineBreakMode = mode
        return self
    }
    
    func setFont(_ weight: FontWeight, _ size: CGFloat) -> Chain {
        switch weight {
        case .regular :
            origin.font = UIFont(name: "AppleSDGothicNeo-Regular", size: size)
            break
        case .semiBold:
            origin.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: size)
            break
        case .bold:
            origin.font = UIFont(name: "AppleSDGothicNeo-Bold", size: size)
            break
        }
        return self
    }
    
    func setTextAlignment(_ alignment: NSTextAlignment) -> Chain {
        origin.textAlignment = alignment
        return self
    }
    
    func setBaseLine(_ aligmment: UIBaselineAdjustment) -> Chain {
        origin.baselineAdjustment = aligmment
        return self
    }
    
        func setLineHeight(lineHeight: CGFloat) -> Chain {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight

            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: ((lineHeight - origin.font.lineHeight)) + origin.font.descender
    
            ]
    
            let attrString = NSAttributedString(string: origin.text ?? "",
                                                attributes: attributes)
            origin.attributedText = attrString
            return self
        }
}
