//
//  UIContent.swift
//  GoF-AbstractFactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

//Factory를 통해 가지고 오는 UIContent 설정
class UIContent {
    var abstractFactory: AbstractFactory
    var label: CLable?
    var button: CButton?

    //Default 값은 iPhone
    init(a: AbstractFactory = iPhoneUIFactory()) {
        self.abstractFactory = a
        setup()
    }

    func setup() {
        label = abstractFactory.customLabel()
        button = abstractFactory.customButton()
    }
}
