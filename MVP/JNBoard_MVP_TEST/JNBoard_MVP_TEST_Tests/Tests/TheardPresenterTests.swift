//
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import XCTest
@testable import JNBoard_MVP_TEST 

final class TheardPresenterTests: XCTestCase {
    var sut: ThreadPresenter!

    var viewController: MockTheardViewController!
    var thread: JNBoard_MVP_TEST.Thread!

    override func setUp() {
        super.setUp()

        viewController = MockTheardViewController()
        thread = Thread(user: User(name: "name", account: "account"), contents: "contents")

        sut = ThreadPresenter(viewController: viewController, thread: thread)
    }

    override func tearDown() {
        sut = nil

        thread = nil
        viewController = nil

        super.tearDown()
    }

    func test_viewDidLoad가_요청되면() {
        sut.viewDidLoad()

        XCTAssertTrue(viewController.isCalledSetViews)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
}
