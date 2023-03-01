//
//  Clothes.swift
//  GoF-DecoratorPattern
//
//  Created by 박준하 on 2023/03/01.
//

import Foundation

// Concrete Component
class Clothes: GetDressedComponent {
    func notify(message: String) {
        print("\(message) 입기")
    }
}
