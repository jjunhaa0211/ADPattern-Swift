//
//  ThreadPresenter.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import Foundation

protocol ThreadProtocol: AnyObject {
    func setViews(thread: Thread)
    func setupViews()
    func likeButtonTap()
}

final class ThreadPresenter {
    private weak var viewController: ThreadProtocol?
    private let thread: Thread

    init(
        viewController: ThreadProtocol,
        thread: Thread
    ) {
        self.viewController = viewController
        self.thread = thread
    }

    func viewDidLoad() {
        viewController?.setViews(thread: thread)
        viewController?.setupViews()
    }
    
    func likeButtonTap() {
        print("하트버튼이 클릭됨")
    }
}
