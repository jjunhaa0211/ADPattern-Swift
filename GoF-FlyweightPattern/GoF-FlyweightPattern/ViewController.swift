//
//  ViewController.swift
//  GoF-FlyweightPattern
//
//  Created by 박준하 on 2023/04/05.
//

import UIKit

class ViewController: UIViewController {

    let client = Client()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        client.operation(text: "Hello, World!")
    }


}

