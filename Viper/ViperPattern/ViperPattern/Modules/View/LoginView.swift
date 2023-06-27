import SnapKit
import Then
import UIKit

class LoginView: UIView {
    let usernameTextField = UITextField().then {
        $0.placeholder = "Username"
        $0.borderStyle = .roundedRect
    }

    let passwordTextField = UITextField().then {
        $0.placeholder = "Password"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
    }

    let loginButton = UIButton(type: .system).then {
        $0.setTitle("Login", for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)

        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.centerX.width.height.equalTo(usernameTextField)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
