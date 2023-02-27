//
//  Factory.swift
//  GoF-AbstractFactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

// 추상화된 Factory
protocol AbstractFactory {
    func customButton() -> CButton
    func customLabel() -> CLable
}

final class iPadUIFactoy: AbstractFactory {
    func customButton() -> CButton {
        return IPadButton()
    }

    func customLabel() -> CLable {
        return IPadLabel()
    }
}

final class iPhoneUIFactory: AbstractFactory {
    func customButton() -> CButton {
        return IPhoneButton()
    }

    func customLabel() -> CLable {
        return IPhoneLabel()
    }
}
