//
//  FeedViewController.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import SnapKit
import UIKit
import Then

final class FeedViewController: UIViewController {
    
    private lazy var presenter = FeedPresenter(viewController: self)
    
    private let writeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "pencil")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        $0.backgroundColor = .systemIndigo
        $0.layer.cornerRadius = 25
    }
    
    private lazy var tableView = UITableView().then {
        $0.delegate = presenter
        $0.dataSource = presenter
        
        $0.register(
            FeedTableViewCell.self,
            forCellReuseIdentifier: FeedTableViewCell.identifier
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWriteButton()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
    private func setupWriteButton() {
        view.addSubview(writeButton)
        writeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20.0)
            $0.width.height.equalTo(50)
        }
        writeButton.addTarget(self, action: #selector(didTapWriteButton), for: .touchUpInside)
    }
    
    @objc private func didTapWriteButton() {
        presenter.didTapWriteButton()
    }
}

extension FeedViewController: FeedProtocol {
    func setupView() {
        navigationItem.title = "Feed"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(writeButton)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func moveToThreadViewController(with thread: Thread) {
        let threadViewController = ThreadViewController(thread: thread)
        navigationController?.pushViewController(threadViewController, animated: true)
    }
    
    func moveToWriteViewController() {
        let writeViewController = UINavigationController(rootViewController: WriteViewController())
        writeViewController.modalPresentationStyle = .fullScreen
        
        present(writeViewController, animated: true)
    }
}
