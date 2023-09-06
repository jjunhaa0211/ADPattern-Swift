//
//  DIViewController.swift
//  SwinjectTest
//
//  Created by 박준하 on 2023/09/06.
//

import UIKit
import Swinject

class DIViewController: UIViewController {
    var animal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("동물 - \(animal!.name!)")

    }
}
