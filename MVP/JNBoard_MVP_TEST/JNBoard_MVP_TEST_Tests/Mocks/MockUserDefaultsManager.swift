//
//  MockUserDefaultsManager.swift
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import Foundation
@testable import JNBoard_MVP_TEST

final class MockUserDefaultsManager: UserDefaultsManagerProtcol {

    var theards: [JNBoard_MVP_TEST.Thread] = []
    var newTheard: JNBoard_MVP_TEST.Thread!

    var isCalledGetTheard = false
    var isCalledSetTheard = false

    func getThread() -> [JNBoard_MVP_TEST.Thread] {
        isCalledGetTheard = true
        return theards
    }
    
    func setThread(_ newValue: JNBoard_MVP_TEST.Thread) {
        isCalledSetTheard = true
        self.newTheard = newValue
    }
}
