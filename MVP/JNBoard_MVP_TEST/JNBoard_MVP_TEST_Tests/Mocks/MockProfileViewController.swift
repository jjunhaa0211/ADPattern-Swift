//
//  MockProfileViewController.swift
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import Foundation
@testable import JNBoard_MVP_TEST

final class MockProfileViewController: ProfileProtocol {
    var isCalledSetupViews = false
    var isCalledSetViews = false
    var isCalledEndEditing = false
    var isCalledShowToast = false

    func setupViews() {
        isCalledSetupViews = true
    }

    func setViews(with name: String, account: String) {
        isCalledSetViews = true
    }

    func endEditing() {
        isCalledEndEditing = true
    }

    func showToast() {
        isCalledShowToast = true
    }
}
