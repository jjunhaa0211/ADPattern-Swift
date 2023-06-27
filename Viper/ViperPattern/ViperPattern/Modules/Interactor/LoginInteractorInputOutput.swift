//
//  LoginInteractorInputOutput.swift
//  ViperPattern
//
//  Created by 박준하 on 2023/06/27.
//

import UIKit

protocol LoginInteractorInput: AnyObject {
    func login(username: String, password: String)
}

protocol LoginInteractorOutput: AnyObject {
    func loginResult(status: Bool)
}
