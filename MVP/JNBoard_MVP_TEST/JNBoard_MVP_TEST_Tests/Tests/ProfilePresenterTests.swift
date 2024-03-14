//
//  ProfilePresenterTests.swift
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import XCTest
@testable import JNBoard_MVP_TEST

final class ProfilePresenterTests: XCTestCase {
    var sut: ProfilePresenter!

    var viewController: MockProfileViewController!

    override func setUp() {
        super.setUp()

        viewController = MockProfileViewController()
        sut = ProfilePresenter(viewController: viewController)
    }

    override func tearDown() {
        sut = nil
        viewController = nil

        super.tearDown()
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()

        XCTAssertTrue(viewController.isCalledSetupViews)
        XCTAssertTrue(viewController.isCalledSetViews)
    }

    func test_didTapSaveButton이_요청될때_name이_존재하지않으면() {
        sut.didTapSaveButton(name: nil, account: "account")

        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }

    func test_didTapSaveButton이_요청될때_account이_존재하지않으면() {
        sut.didTapSaveButton(name: "name", account: nil)

        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }

    func test_didTapSaveButton이_요청될때_name과account가_존재하지않으면() {
        sut.didTapSaveButton(name: nil, account: nil)

        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }

    func test_didTapSaveButton이_요청될때_name과account이_존재하면() {
        sut.didTapSaveButton(name: "name", account: "account")

        XCTAssertFalse(viewController.isCalledShowToast)
        XCTAssertTrue(viewController.isCalledEndEditing)
        XCTAssertTrue(viewController.isCalledSetViews)
    }
}
