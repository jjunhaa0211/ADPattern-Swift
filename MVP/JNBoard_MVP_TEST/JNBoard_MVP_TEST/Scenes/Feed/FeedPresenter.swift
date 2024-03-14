//
//  FeedPresenter.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import UIKit

protocol FeedProtocol: AnyObject {
    func setupView()
    func reloadTableView()
    func moveToThreadViewController(with thread: Thread)
    func moveToWriteViewController()
}

final class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtcol

    private var threads: [Thread] = []

    init(
        viewController: FeedProtocol,
        userDefaultsManager: UserDefaultsManagerProtcol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }

    func viewDidLoad() {
        viewController?.setupView()
    }

    func viewWillAppear() {
        threads = userDefaultsManager.getThread()
        viewController?.reloadTableView()
    }

    func didTapWriteButton() {
        viewController?.moveToWriteViewController()
    }
}

extension FeedPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        threads.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FeedTableViewCell.identifier,
            for: indexPath
        ) as? FeedTableViewCell

        let thread = threads[indexPath.row]
        cell?.setup(thread: thread)

        return cell ?? UITableViewCell()
    }
}

extension FeedPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thread = threads[indexPath.row]
        viewController?.moveToThreadViewController(with: thread)
    }
}
