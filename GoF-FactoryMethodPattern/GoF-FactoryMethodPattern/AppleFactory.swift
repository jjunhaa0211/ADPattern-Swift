//
//  AppleFactory.swift
//  GoF-FactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

protocol AppleFactory {
    func createElectronics() -> Product
}
