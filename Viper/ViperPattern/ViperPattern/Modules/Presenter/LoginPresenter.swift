import UIKit

class LoginPresenter: LoginPresenterInterface {
    var view: LoginViewInterface!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInterface!
    
    func viewDidLoad() {
        
    }
    
    func handleLogin(username: String, password: String) {
        interactor.login(username: username, password: password)
    }
    
    func navigateToRedViewController() {
        router.navigateToRedViewController()
    }
}


extension LoginPresenter: LoginInteractorOutput {
    func loginResult(status: Bool) {
        DispatchQueue.main.async {
            self.view.updateLoginStatus(status: status)
            if status {
                self.router.navigateToRedViewController()
            }
        }
    }
}
