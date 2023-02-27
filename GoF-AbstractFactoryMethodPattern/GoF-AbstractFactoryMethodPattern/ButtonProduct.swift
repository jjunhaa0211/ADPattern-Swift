//
//  ButtonProduct.swift
//  GoF-AbstractFactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

// Product를 구현하고 안에 들어가는 함수 구현하는 곳
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
