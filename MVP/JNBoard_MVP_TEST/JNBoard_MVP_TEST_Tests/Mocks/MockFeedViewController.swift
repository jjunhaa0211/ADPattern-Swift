//
//  MockFeedViewController.swift
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import Foundation
@testable import JNBoard_MVP_TEST

final class MockFeedViewController: FeedProtocol {
    var isCalledSetupView = false
    var isCalledReloadTableView = false
    var isCalledMoveToTheardViewController = false
    var isCalledMoveToWriteViewController = false

    func setupView() {
        isCalledSetupView = true
    }

    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    func moveToThreadViewController(with thread: JNBoard_MVP_TEST.Thread) {
        isCalledMoveToTheardViewController = true
    }

    func moveToWriteViewController() {
        isCalledMoveToWriteViewController = true
    }
}
