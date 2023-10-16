import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class LoginViewController: UIViewController {

    private let viewModel = LoginViewModel()
    private var output: LoginViewModel.Output!
    
    private let disposeBag = DisposeBag()

    var emailTextField = UITextField().then {
        $0.placeholder = "Email"
        $0.borderStyle = .roundedRect
    }

    var passwordTextField = UITextField().then {
        $0.placeholder = "Password"
        $0.isSecureTextEntry=true
        $0.borderStyle = .roundedRect
    }

    var loginButton=UIButton(type:.system).then{
        $0.setTitle("Login", for:.normal)
     }

     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.backgroundColor=UIColor.white

         layoutUI()

         bindViewModel()
     }

     func layoutUI(){
          view.addSubview(emailTextField)
          view.addSubview(passwordTextField)
          view.addSubview(loginButton)

          emailTextField.snp.makeConstraints { (make) in make.top.equalTo(view).offset(100)
              make.left.equalTo(view).offset(20)
              make.right.equalTo(view).offset(-20)
              make.height.equalTo(50) }

          passwordTextField.snp.makeConstraints { (make) in make.top.equalTo(emailTextField.snp.bottom).offset(20)
              make.left.right.height.equalTo(emailTextField)}

          loginButton.snp.makeConstraints { (make) in make.top.equalTo(passwordTextField.snp.bottom).offset(20)
             make.left.right.height.equalTo(emailTextField)}
     }

     func bindViewModel(){
          let input = LoginViewModel.Input(
               email: emailTextField.rx.text.orEmpty.asObservable(),
               password: passwordTextField.rx.text.orEmpty.asObservable())

      output = viewModel.transform(input :input)

      output.isValid.bind(to:self.loginButton.rx.isEnabled).disposed(by:self.disposeBag)

       loginButton.rx.tap.subscribe(onNext:{ [weak self] in self?.showAlert() }).disposed(by:self.disposeBag)

      }


      func showAlert(){
            let alert = UIAlertController(title:"RxSwift", message:"로그인에 성공했습니다.", preferredStyle:.alert)

            alert.addAction(UIAlertAction(title:"확인", style:.default, handler:nil))

            self.present(alert, animated:true, completion:nil)
       }
}
