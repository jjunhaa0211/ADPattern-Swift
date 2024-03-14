//
//  FeedTableViewCell.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import SnapKit
import UIKit
import Then

final class FeedTableViewCell: UITableViewCell {
    static let identifier = "FeedTableVieCell"

    private lazy var profileImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 21.0
    }

    private lazy var writterNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15.0, weight: .bold)
    }

    private lazy var writterAccountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.textColor = .secondaryLabel
    }

    private lazy var contentsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15.0, weight: .medium)
        $0.numberOfLines = 0
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(Icon.like.image, for: .normal)
        $0.tintColor = .secondaryLabel
    }

    private lazy var commentButton = UIButton().then {
        $0.setImage(Icon.message.image, for: .normal)
        $0.tintColor = .secondaryLabel
    }

    private lazy var shareButton = UIButton().then {
        $0.setImage(Icon.share.image, for: .normal)
        $0.tintColor = .secondaryLabel
    }
    
    private lazy var swiftButton = UIButton().then {
        $0.setImage(Icon.swift.image, for: .normal)
        $0.tintColor = .secondaryLabel
    }

    func setup(thread: Thread) {
        selectionStyle = .none

        setupLayout()

        writterNameLabel.text = thread.user.name
        writterAccountLabel.text = "@\(thread.user.account)"
        contentsLabel.text = thread.contents
    }
}

private extension FeedTableViewCell {
    func setupLayout() {
        let buttonStackView = UIStackView(
            arrangedSubviews: [likeButton, commentButton, shareButton, swiftButton]
        )
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually

        [
            profileImageView,
            writterNameLabel,
            writterAccountLabel,
            contentsLabel,
            buttonStackView
        ].forEach { addSubview($0) }

        let superviewMargin: CGFloat = 16.0

        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superviewMargin)
            $0.top.equalToSuperview().inset(superviewMargin)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }

        writterNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(superviewMargin)
            $0.top.equalTo(profileImageView.snp.top)
        }

        writterAccountLabel.snp.makeConstraints {
            $0.leading.equalTo(writterNameLabel.snp.trailing).offset(2.0)
            $0.bottom.equalTo(writterNameLabel.snp.bottom)
        }

        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(writterNameLabel.snp.leading)
            $0.top.equalTo(writterNameLabel.snp.bottom).offset(4.0)
            $0.trailing.equalToSuperview().inset(superviewMargin)
        }

        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(writterNameLabel.snp.leading)
            $0.trailing.equalTo(contentsLabel.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(12.0)
            $0.bottom.equalToSuperview().inset(superviewMargin)
        }
    }
}
