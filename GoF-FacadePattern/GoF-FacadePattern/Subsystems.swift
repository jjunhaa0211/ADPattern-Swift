//
//  Subsystems.swift
//  GoF-FacadePattern
//
//  Created by 박준하 on 2023/03/23.
//

import Foundation

//1
class Subsystem1 {
    
    func operation1() -> String {
        return "subSystem1: 준비 \n"
    }
    func operationN() -> String {
        return "subSystem1: 시작 \n"
    }
}

//2
class Subsystem2 {
    func operation2() -> String {
        return "subSystem2: 준비 \n"
    }
    func operationZ() -> String {
        return "subSystem2: 시작 \n"
    }
}

class Subsystem3 {
    func operation3() -> String {
        return "suvSystem3: 준비 \n"
    }
    
    func operationX() -> String {
        return "subSystem2: 시작 \n"
    }
}
