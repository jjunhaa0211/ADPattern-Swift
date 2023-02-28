//
//  UserInFo.swift
//  GoF-SingletonPattern
//
//  Created by 박준하 on 2023/02/28.
//

import Foundation

class UserInFo {
    static let shared = UserInFo()

    var name: String?
    var password: String?
    var age: Int?
    
    private init() { }
}
