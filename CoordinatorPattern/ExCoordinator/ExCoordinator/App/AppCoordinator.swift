//
//  AppCoordinator.swift
//  ExCoordinator
//
//  Created by 박준하 on 2023/02/09.
//

import UIKit

class AppCoordinator: Coordinator, ByeCoordinatorDelegate, HelloCoordinatorDelegate {

    // child Coordinator가 할당 해제되는 것을 방지하기 위해 배열을 사용한다
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var greeting: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if self.greeting {
            self.showHelloViewController()
        } else {
            self.showByeViewController()
        }
    }
    
    private func showHelloViewController() {
        let coordinator = HelloCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    private func showByeViewController() {
        let coordinator = ByeCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    func tapBye(_ coordinator: ByeCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showHelloViewController()
    }
    
    func tapHello(_ coordinator: HelloCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showByeViewController()
    }
}
