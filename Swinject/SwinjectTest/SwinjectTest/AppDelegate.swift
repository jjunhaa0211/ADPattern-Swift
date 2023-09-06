//
//  AppDelegate.swift
//  SwinjectTest
//
//  Created by 박준하 on 2023/09/06.
//

import UIKit
import Swinject
import Then

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let container: Container = {
        let container = Container()
        container.register(Animal.self) { _ in Cat(name: "Mimi") }
        
          // ViewController 클래스를 등록한다.
        container.register(DIViewController.self) { resolver in
            let controller = DIViewController()
            controller.animal = resolver.resolve(Animal.self)
            return controller
        }
        return container
    }()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

