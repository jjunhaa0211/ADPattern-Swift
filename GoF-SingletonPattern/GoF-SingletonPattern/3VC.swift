//
//  3ViewController.swift
//  GoF-SingletonPattern
//
//  Created by 박준하 on 2023/02/28.
//

import UIKit

class ViewController3: UIViewController {
    
    let u = UserInFo.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        u.age = 123
        print(u.name)
        print(u.password)
        print(u.age)
    }
}
