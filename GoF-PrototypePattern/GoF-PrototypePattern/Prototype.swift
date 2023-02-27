//
//  Prototype.swift
//  GoF-PrototypePattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

protocol Prototype: AnyObject {
    func clone() -> Self
}
