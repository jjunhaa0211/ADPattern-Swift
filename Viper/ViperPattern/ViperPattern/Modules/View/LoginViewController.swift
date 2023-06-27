import SnapKit
import Then
import UIKit

class LoginViewController: UIViewController, LoginViewInterface {
    var presenter: LoginPresenterInterface?

    private lazy var mainView = LoginView()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        guard let presenter = presenter else { return }
        presenter.viewDidLoad()
    }
    
    @objc private func loginButtonTapped() {
        guard let username = mainView.usernameTextField.text, let password = mainView.passwordTextField.text, let presenter = presenter else {
            return
        }
        presenter.handleLogin(username: username, password: password)
    }
    
    func updateLoginStatus(status: Bool) {
        if status {
            print("Login success")
            presenter?.navigateToRedViewController()
        } else {
            print("Login failed")
        }
    }
}
