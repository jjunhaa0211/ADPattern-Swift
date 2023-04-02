//
//  Coordiantor.swift
//  ExCoordinator
//
//  Created by 박준하 on 2023/02/09.
//

import Foundation

protocol Coordinator : class {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
