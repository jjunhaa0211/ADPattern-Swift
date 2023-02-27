//
//  Apple.swift
//  GoF-PrototypePattern
//
//  Created by 박준하 on 2023/02/27.
//

import UIKit

class Apple: Prototype {
    var user: Int
    
    init(user: Int) {
        self.user = user
    }
    
    func clone() -> Self {
        return (Apple(user: self.user) as? Self)!
    }
}
