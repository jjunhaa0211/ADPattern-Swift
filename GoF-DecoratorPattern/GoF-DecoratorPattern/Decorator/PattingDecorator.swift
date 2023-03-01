//
//  PattingDecorator.swift
//  GoF-DecoratorPattern
//
//  Created by 박준하 on 2023/03/01.
//

import Foundation

// Concrete Decorator
// PattingDecorator -> GetDressedDecorator -> Clothes
class PattingDecorator: GetDressedDecorator {
    var wrappee: GetDressedComponent
    
    required init(notifier: GetDressedComponent) {
        self.wrappee = notifier
    }
    
    func notify(message: String) {
        print("\(message) 패딩 입기 완료")
        wrappee.notify(message: message)
    }
}
