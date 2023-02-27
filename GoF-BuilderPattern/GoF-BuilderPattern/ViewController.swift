//
//  ViewController.swift
//  GoF-BuilderPattern
//
//  Created by 박준하 on 2023/02/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let iphoen12 = iPhoneBuilder(builder: {
        $0.setPlus(false).setMemory(200).setColor("red").setSpecification("128GB").build()
    })
    
    let custemiPhone = iPhoneBuilder(builder: {
        $0.build()
    })
    
}


