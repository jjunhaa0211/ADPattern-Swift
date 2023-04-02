//
//  HelloCoordinator.swift
//  ExCoordinator
//
//  Created by 박준하 on 2023/02/09.
//

import UIKit

protocol HelloCoordinatorDelegate {
    func tapHello(_ coordinator: HelloCoordinator)
}

class HelloCoordinator: Coordinator, HelloViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: HelloCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HelloViewController()
        viewController.view.backgroundColor = .black
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func hello() {
        self.delegate?.tapHello(self)
    }
}
