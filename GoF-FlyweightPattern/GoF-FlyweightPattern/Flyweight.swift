//
//  Flyweight.swift
//  GoF-FlyweightPattern
//
//  Created by 박준하 on 2023/04/05.
//

import Foundation

protocol Flyweight {
    var value: String { get }
}

class ConcreteFlyweight: Flyweight {
    var value: String
    
    init(value: String) {
        self.value = value
    }
}
