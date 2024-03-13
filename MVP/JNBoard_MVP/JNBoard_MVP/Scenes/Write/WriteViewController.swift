//
//  WriteViewController.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import SnapKit
import UIKit
import Then

final class WriteViewController: UIViewController {
    private lazy var presenter = WritePresenter(viewController: self)

    private lazy var leftBarButtonItem = UIBarButtonItem(
        title: "cancel",
        style: .plain,
        target: self,
        action: #selector(didTapLeftBarButtonItem)
    ).then {
        $0.tintColor = .systemIndigo
    }

    private lazy var rightBarButtonItem = UIBarButtonItem(
        title: "post",
        style: .plain,
        target: self,
        action: #selector(didTapRightBarButtonItem)
    ).then {
        $0.tintColor = .systemIndigo
    }

    private lazy var textView = UITextView().then {
        $0.delegate = self
        
        $0.textColor = .secondaryLabel
        $0.text = "What is going on?"
        
        $0.font = .systemFont(ofSize: 16.0, weight: .medium)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension WriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }

        textView.text = nil
        textView.textColor = .label
    }

    func textViewDidChange(_ textView: UITextView) {
        guard textView.textColor != .secondaryLabel else { return }

        rightBarButtonItem.isEnabled = !textView.text.isEmpty
    }
}

extension WriteViewController: WriteProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground

        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem

        view.addSubview(textView)

        let superviewInset: CGFloat = 16.0
        textView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(superviewInset)
            $0.leading.equalToSuperview().inset(superviewInset)
            $0.trailing.equalToSuperview().inset(superviewInset)
            $0.height.equalTo(160.0)
        }
    }

    func dismiss() {
        dismiss(animated: true)
    }
}

private extension WriteViewController {
    @objc func didTapLeftBarButtonItem() {
        presenter.didTapLeftBarButtonItem()
    }

    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem(text: textView.text)
    }
}
