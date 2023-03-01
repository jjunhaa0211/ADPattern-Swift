//
//  SweaterDecorator.swift
//  GoF-DecoratorPattern
//
//  Created by 박준하 on 2023/03/01.
//

import Foundation

// Concrete Decorator
// SweaterDecorator -> GetDressedDecorator -> Clothes
class SweaterDecorator: GetDressedDecorator {
    var wrappee: GetDressedComponent
    
    required init(notifier: GetDressedComponent) {
        self.wrappee = notifier
    }
    
    func notify(message: String) {
        print("\(message) 스웨터 입기 완료")
        self.wrappee.notify(message: message)
    }
}
