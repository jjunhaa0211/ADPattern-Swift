//
//  Animal.swift
//  SwinjectTest
//
//  Created by 박준하 on 2023/09/06.
//

import Foundation
import UIKit

protocol Animal {
    var name: String? { get }
}

class Cat: Animal {
    let name: String?
    
    init(name: String?) {
        self.name = name
    }
}
