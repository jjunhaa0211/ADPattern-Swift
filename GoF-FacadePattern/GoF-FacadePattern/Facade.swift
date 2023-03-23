//
//  Facade.swift
//  GoF-FacadePattern
//
//  Created by 박준하 on 2023/03/23.
//
import Foundation

// 클래스를 한번에 실행 시키거나 순차적으로 실행시키는 경우
class Facade {
    private var subsystem1: Subsystem1
    private var subsystem2: Subsystem2
    private var subsystem3: Subsystem3
    
    init(subsystem1: Subsystem1 = Subsystem1() ,
         subsystem2: Subsystem2 = Subsystem2() ,
         subsystem3: Subsystem3 = Subsystem3()) {
        self.subsystem1 = subsystem1
        self.subsystem2 = subsystem2
        self.subsystem3 = subsystem3
    }
    
    func operation() -> String {
        var r = " 퍼사드 초기화 : \n"
        r = r + " " + subsystem1.operation1()
        r = r + " " + subsystem2.operation2()
        r = r + " " + subsystem3.operation3()
        
        r = r + "\n" + " 퍼사드 하위 시스템 순서대로 작동 시작 : \n"
        
        r = r + " " + subsystem1.operationN()
        r = r + " " + subsystem2.operationZ()
        r = r + " " + subsystem3.operationX()
        return r
    }
}
