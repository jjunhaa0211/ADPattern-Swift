//
//  ViewController.swift
//  GoF-CompositPattern
//
//  Created by 박준하 on 2023/04/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // 예제 사용법
        let jewel1 = Jewel(name: "보석바1", price: 1000)
        let jewel2 = Jewel(name: "의자2", price: 1000)
        let nougat = Nougat(name: "누가바", price: 100)
        let porkbar = Porkbar(name: "돼지바", price: 2000)

        let iceCreamSet1 = iceCreamSet(name: "여름철 세트")
        iceCreamSet1.add(component: jewel1)
        iceCreamSet1.add(component: jewel2)
        iceCreamSet1.add(component: nougat)

        let iceCreamSet2 = iceCreamSet(name: "가을철 세트")
        iceCreamSet2.add(component: porkbar)
        iceCreamSet2.add(component: jewel1)

        let iceCreamSet = iceCreamSet(name: "아이스크림 종합 세트")
        iceCreamSet.add(component: iceCreamSet1)
        iceCreamSet.add(component: iceCreamSet2)

        print(iceCreamSet.getInfo())

    }


}

class Jewel: iceCreamComponent {
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func getInfo() -> String {
        return "\(name) (\(price)원)"
    }
}

class Nougat: iceCreamComponent {
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func getInfo() -> String {
        return "\(name) (\(price)원)"
    }
}

class Porkbar: iceCreamComponent {
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func getInfo() -> String {
        return "\(name) (\(price)원)"
    }
}

class iceCreamSet: iceCreamComponent {
    var name: String
    var price: Int = 0
    var components: [iceCreamComponent] = []
    
    init(name: String) {
        self.name = name
    }
    
    func add(component: iceCreamComponent) {
        components.append(component)
        price += component.price
    }
    
    func getInfo() -> String {
        var info = "\(name) (\(price)원)"
        for component in components {
            info += "\n--" + component.getInfo()
        }
        return info
    }
}
