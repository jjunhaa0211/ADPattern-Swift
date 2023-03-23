//
//  ViewController.swift
//  GoF-FacadePattern
//
//  Created by 박준하 on 2023/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let facade = Facade(subsystem1: Subsystem1(), subsystem2: Subsystem2(), subsystem3: Subsystem3())
        print(facade.operation())
    }


}

