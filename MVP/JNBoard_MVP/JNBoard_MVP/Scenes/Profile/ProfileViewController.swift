//
//  ProfileViewController.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//
import Toast
import SnapKit
import UIKit
import Then

final class ProfileViewController: UIViewController {
    private lazy var presenter = ProfilePresenter(viewController: self)

    private lazy var nameTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 20.0, weight: .medium)
        $0.delegate = self
    }

    private lazy var accountTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.delegate = self
    }

    private lazy var saveButton = UIButton().then {
        $0.setTitle("Save", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
        $0.layer.cornerRadius = 15.0
        $0.backgroundColor = .systemIndigo
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ProfileViewController: ProfileProtocol {
    func setupViews() {
        navigationItem.title = "Profile"

        [nameTextField, accountTextField, saveButton]
            .forEach { view.addSubview($0) }

        nameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16.0)
        }

        accountTextField.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(nameTextField.snp.bottom).offset(16.0)
        }

        saveButton.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(accountTextField.snp.bottom).offset(32.0)
        }
    }

    func setViews(with name: String, account: String) {
        nameTextField.text = name
        accountTextField.text = account
    }

    func endEditing() {
        view.endEditing(true)
    }

    func showToast() {
        view.makeToast("Please enter what you want to change.")
    }
}

private extension ProfileViewController {
    @objc func didTapSaveButton() {
        presenter.didTapSaveButton(name: nameTextField.text, account: accountTextField.text)
    }
}
