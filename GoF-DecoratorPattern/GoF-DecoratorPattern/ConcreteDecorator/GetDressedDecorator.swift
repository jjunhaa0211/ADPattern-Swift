//
//  GetDressedDecorator.swift
//  GoF-DecoratorPattern
//
//  Created by 박준하 on 2023/03/01.
//

import Foundation

// Decorator
//GetDressedDecorator -> Clothes
protocol GetDressedDecorator: GetDressedComponent {
    var wrappee: GetDressedComponent { get set }
    init(notifier: GetDressedComponent)
}
