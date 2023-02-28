//
//  UserInFo.swift
//  GoF-SingletonPattern
//
//  Created by 박준하 on 2023/02/28.
//

import Foundation

class UserInFo {
    //static let 프로퍼티가 추가
    // let 으로 선언되었기 때문에 인스턴스 자체를 변경 할수도 없습니다.
    static let shared = UserInFo()

    var name: String?
    var password: String?
    var age: Int?
    
    // Instance를 또 생생하는 것을 막기 위해 private 추가
    private init() { }
}
