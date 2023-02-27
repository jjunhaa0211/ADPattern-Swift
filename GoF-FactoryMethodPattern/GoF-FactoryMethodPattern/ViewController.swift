//
//  ViewController.swift
//  GoF-FactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import UIKit

class ViewController: UIViewController {
    
    var client = Client()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.order(f: iPhoneFactory())
        client.order(f: MacFactory())
    }


}

