//
//  TabBarViewController.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarViewControllers: [UIViewController] = TabBarItem.allCases
            .map { tabCase in
                let viewController = tabCase.viewController
                viewController.tabBarItem = UITabBarItem(
                    title: tabCase.title,
                    image: tabCase.icon.default,
                    selectedImage: tabCase.icon.selected?.withTintColor(.systemIndigo)
                )

                return viewController
            }

        self.viewControllers = tabBarViewControllers
        self.tabBar.tintColor = .systemIndigo
    }
}
