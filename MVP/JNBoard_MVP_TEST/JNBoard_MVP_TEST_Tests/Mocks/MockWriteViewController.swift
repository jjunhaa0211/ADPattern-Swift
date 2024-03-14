//
//  MockWriteViewController.swift
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import Foundation
@testable import JNBoard_MVP_TEST

final class MockWriteViewController: WriteProtocol {
    var isCalledSetupViews = false
    var isCalledDismiss = false

    func setupViews() {
        isCalledSetupViews = true
    }

    func dismiss() {
        isCalledDismiss = true
    }
}
