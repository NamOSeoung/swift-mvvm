//
//  UITableView+Chainable.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit

extension Chain where Origin: UITableView {

    func setSeparatorStyle(_ style: UITableViewCell.SeparatorStyle) -> Chain {
        origin.separatorStyle = style
        return self
    }
    
    func setKeyboardDismissMode(_ mode: UIScrollView.KeyboardDismissMode) -> Chain {
        origin.keyboardDismissMode = mode
        return self
    }
    
    func setShowsHorizontalScrollIndicator(_ flag: Bool) -> Chain {
        origin.showsHorizontalScrollIndicator = flag
        return self
    }
    
    func setShowsVerticalScrollIndicator(_ flag: Bool) -> Chain {
        origin.showsVerticalScrollIndicator = flag
        return self
    }
    
    func apply(_ block: (Origin) -> Void) -> Chain {
        block(origin)
        return self
    }
}
