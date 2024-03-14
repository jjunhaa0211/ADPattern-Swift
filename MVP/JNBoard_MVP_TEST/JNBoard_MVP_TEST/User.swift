//
//  User.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import Foundation

struct User: Codable {
    var name: String
    var account: String

    static var shared = User(name: "Junha", account: "ioio_dev")
}
