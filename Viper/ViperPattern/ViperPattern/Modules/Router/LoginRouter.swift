//
//  LoginRouter.swift
//  ViperPattern
//
//  Created by 박준하 on 2023/06/27.
//

import UIKit
import SnapKit
import Then

class LoginRouter: LoginRouterInterface {
    weak var viewController: UIViewController!

    func navigateToMainScreen() {
    }

    func navigateToRedViewController() {
        let redViewController = RedViewController()
        viewController.navigationController?.pushViewController(redViewController, animated: true)
    }
}
