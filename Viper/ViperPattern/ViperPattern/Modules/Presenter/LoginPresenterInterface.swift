import UIKit

protocol LoginPresenterInterface: AnyObject {
    func viewDidLoad()
    func handleLogin(username: String, password: String)
    func navigateToRedViewController()
}
