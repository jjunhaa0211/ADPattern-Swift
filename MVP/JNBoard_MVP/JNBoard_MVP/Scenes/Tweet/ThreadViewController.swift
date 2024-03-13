//
//  ThreadViewController.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import SnapKit
import UIKit
import Then

final class ThreadViewController: UIViewController {
    private var presenter: ThreadPresenter!
    
    private lazy var profileImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 30.0
    }
    
    private lazy var userNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15.0, weight: .medium)
    }

    private lazy var userAccountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13.0, weight: .bold)
        $0.textColor = .secondaryLabel
    }

    private lazy var contentsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.numberOfLines = 0
    }

    private lazy var isLikedButton = UIButton().then {
        $0.setImage(Icon.like.image, for: .normal)
        $0.addTarget(self, action: #selector(likeButtonTap), for: .touchUpInside)
    }

    private lazy var shareButton = UIButton().then {
        $0.setImage(Icon.share.image, for: .normal)
        $0.tintColor = .secondaryLabel
    }

    init(thread: Thread) {
        super.init(nibName: nil, bundle: nil)

        presenter = ThreadPresenter(viewController: self, thread: thread)
        view.backgroundColor = .systemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension ThreadViewController: ThreadProtocol {
    @objc func likeButtonTap() {
        presenter.likeButtonTap()
    }
    
    func setViews(thread thread: Thread) {
        userNameLabel.text = thread.user.name
        userAccountLabel.text = "@\(thread.user.account)"
        contentsLabel.text = thread.contents
    }

    func setupViews() {
        let userInfoStackView = UIStackView(arrangedSubviews: [userNameLabel, userAccountLabel])
        userInfoStackView.axis = .vertical
        userInfoStackView.distribution = .equalSpacing
        userInfoStackView.spacing = 4.0

        let buttonStackView = UIStackView(arrangedSubviews: [isLikedButton, shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually

        [profileImageView, userInfoStackView, contentsLabel, buttonStackView]
            .forEach { view.addSubview($0) }

        let superviewMargin: CGFloat = 16.0

        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superviewMargin)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superviewMargin)
            $0.width.equalTo(60.0)
            $0.height.equalTo(60.0)
        }

        userInfoStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().inset(superviewMargin)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }

        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(userInfoStackView.snp.trailing)
            $0.top.equalTo(profileImageView.snp.bottom).offset(8.0)
        }

        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(userInfoStackView.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(superviewMargin)
        }
    }
}
