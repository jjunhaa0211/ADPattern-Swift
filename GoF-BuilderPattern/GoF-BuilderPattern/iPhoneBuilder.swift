//
//  iPhoneBuilder.swift
//  GoF-BuilderPattern
//
//  Created by 박준하 on 2023/02/27.
//

import UIKit

struct iPhone {
    let color: String
    let memory: Int
    let specification: String
    let plus: Bool
    
    init(color: String, memory: Int, specification: String, plus: Bool) {
        self.color = color
        self.memory = memory
        self.specification = specification
        self.plus = plus
    }
}

class iPhoneBuilder {
    private var color = "기본"
    private var memory = 100
    private var specification = "128GB"
    private var plus = false
    
    typealias BuilderClosure = (iPhoneBuilder) -> ()
    
    //자신은 반환해야 합니다
    func setColor(_ c: String) -> iPhoneBuilder {
        self.color = c
        return self
    }
    
    func setMemory(_ m: Int) -> iPhoneBuilder {
        self.memory = m
        return self
    }
    
    func setSpecification(_ s: String) -> iPhoneBuilder {
        self.specification = s
        return self
    }
    
    func setPlus(_ p: Bool) -> iPhoneBuilder {
        self.plus = p
        return self
    }
    
    func build() -> iPhone {
        return iPhone(color: color, memory: memory, specification: specification, plus: plus)
    }
    
    init(builder: BuilderClosure) {
        builder(self)
    }
}

