//
//  ViewController.swift
//  GoF-PrototypePattern
//
//  Created by 박준하 on 2023/02/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let apple1 = Apple(user: 10)
        apple1.user = (apple1.user + 100)
        print(apple1.user) // 110
        
        let apple2 = apple1.clone()
        apple2.user = (apple2.user + 90)
        print(apple2.user) // 슉! 자가복제!
    }


}

