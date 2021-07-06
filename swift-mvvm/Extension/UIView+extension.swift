//
//  UIView+extension.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit

public extension UIView {
    func setBackgroundColor(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) {
        backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
