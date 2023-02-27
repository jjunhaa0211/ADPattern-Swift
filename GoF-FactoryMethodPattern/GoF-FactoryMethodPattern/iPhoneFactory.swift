//
//  iPhoneFactory.swift
//  GoF-FactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

class iPhone: Product {
    func produceProduct() {
        print("아이폰 기능이 추가되었습니다.")
    }
}

class iPhoneFactory: AppleFactory {
    func createElectronics() -> Product {
        return iPhone()
    }
}
