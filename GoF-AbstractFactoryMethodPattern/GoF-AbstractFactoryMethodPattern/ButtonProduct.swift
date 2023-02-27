//
//  ButtonProduct.swift
//  GoF-AbstractFactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

// 실제로 생성될 구체 Product, 객체가 가질 기능과 상태를 구현
final class IPhoneButton: CButton {
    func touchUP() {
        print("iPhoneButton")
    }
}

final class IPadButton: CButton {
    func touchUP() {
        print("iPadButton")
    }
}
