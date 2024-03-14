//
//  WritePresenterTests.swift
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import XCTest
@testable import JNBoard_MVP_TEST

final class WritePresenterTests: XCTestCase {
    var sut: WritePresenter!

    var viewController: MockWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!

    override func setUp() {
        super.setUp()

        viewController = MockWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()

        sut = WritePresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
    }

    override func tearDown() {
        sut = nil
        userDefaultsManager = nil
        viewController = nil

        super.tearDown()
    }

    func test_viewDidLoad가_요청되면() {
        sut.viewDidLoad()

        XCTAssertTrue(viewController.isCalledSetupViews)
    }

    func test_didTapLeftBarButtonItem가_요청되면() {
        sut.didTapLeftBarButtonItem()

        XCTAssertTrue(viewController.isCalledDismiss)
    }

    func test_didTapRightBarButtonItem이_요청되면() {
        sut.didTapRightBarButtonItem(text: "")

        XCTAssertTrue(userDefaultsManager.isCalledSetTheard)
        XCTAssertTrue(viewController.isCalledDismiss)
    }
}
