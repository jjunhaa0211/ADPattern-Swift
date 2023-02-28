//
//  2ViewController.swift
//  GoF-SingletonPattern
//
//  Created by 박준하 on 2023/02/28.
//

import UIKit

class ViewController2: UIViewController {
    
    let u = UserInFo.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        u.password = "12345678"
        print(u.name)
        print(u.password)
        print(u.age)
    }
}
