//
//  Chainable.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import Foundation

class Chain<Origin> {
    var origin: Origin
    
    init(origin: Origin) {
        self.origin = origin
    }
}

protocol Chainable {}

extension Chainable {
    var chain: Chain<Self> {
        return Chain(origin: self)
    }
}
