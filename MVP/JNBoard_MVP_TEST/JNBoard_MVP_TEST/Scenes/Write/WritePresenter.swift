//
//  WritePresenter.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import Foundation

protocol WriteProtocol: AnyObject {
    func setupViews()
    func dismiss()
}

final class WritePresenter {
    private weak var viewController: WriteProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtcol

    init(
        viewController: WriteProtocol,
        userDefaultsManager: UserDefaultsManagerProtcol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }

    func viewDidLoad() {
        viewController?.setupViews()
    }

    func didTapLeftBarButtonItem() {
        viewController?.dismiss()
    }

    func didTapRightBarButtonItem(text: String) {
        let thread = Thread(user: User.shared, contents: text)
        userDefaultsManager.setThread(thread)
        viewController?.dismiss()
    }
}
