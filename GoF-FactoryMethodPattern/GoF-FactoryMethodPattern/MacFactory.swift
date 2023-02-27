//
//  MacFactory.swift
//  GoF-FactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

class Mac: Product {
    func produceProduct() {
        print("mac 기능이 추가되었습니다.")
    }
}

class MacFactory: AppleFactory {
    func createElectronics() -> Product {
        return Mac()
    }
}
