//
//  Product.swift
//  GoF-AbstractFactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

// 추상화된 Product
protocol CButton {
    func touchUP()
}

protocol CLable {
    var title: String { get }
}
