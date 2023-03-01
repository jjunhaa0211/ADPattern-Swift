//
//  ViewController.swift
//  GoF-DecoratorPattern
//
//  Created by 박준하 on 2023/03/01.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let c = Clothes()
        let s = SweaterDecorator(notifier: c)
        let p = PattingDecorator(notifier: c)
        s.notify(message: "아디다스")
        p.notify(message: "나이키")
    }
}
