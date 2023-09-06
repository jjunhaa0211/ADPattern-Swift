//
//  ViewController.swift
//  SwinjectTest
//
//  Created by 박준하 on 2023/09/06.
//

import UIKit

//Swinject를 사용하지 않은 평소의 코드
class ViewController: UIViewController {
    let cat = Cat(name: "Mimi")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("동물 - \(cat.name!)")
    }


}

