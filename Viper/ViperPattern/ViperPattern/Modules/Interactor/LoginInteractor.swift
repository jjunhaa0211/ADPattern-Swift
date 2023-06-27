import UIKit

class LoginInteractor: LoginInteractorInput {
    weak var output: LoginInteractorOutput!

    func login(username: String, password: String) {
        let success = (username == "user" && password == "password")
        output.loginResult(status: success)
    }
    
    
}

