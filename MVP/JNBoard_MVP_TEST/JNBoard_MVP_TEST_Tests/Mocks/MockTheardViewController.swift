//
//  JNBoard_MVP_TESTTests
//
//  Created by 박준하 on 3/14/24.
//

import Foundation
@testable import JNBoard_MVP_TEST

final class MockTheardViewController: ThreadProtocol {

    var isCalledSetViews = false
    var isCalledSetupViews = false

    func setViews(thread: JNBoard_MVP_TEST.Thread) {
        isCalledSetViews = true
    }

    func likeButtonTap() {
        print("asdf")
    }

    func setupViews() {
        isCalledSetupViews = true
    }
}
