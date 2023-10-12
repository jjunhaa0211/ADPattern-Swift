//
//  ViewController.swift
//  BasicMVVM
//
//  Created by 박준하 on 10/12/23.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    var clothesView = ClothesView()
    var clothesViewModel: ClothesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setupUI()
        self.setup()
    }
}

extension ViewController {
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(clothesView)
        
        clothesView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    func setup(){
        self.clothesViewModel = ClothesViewModel(clothes: Clothes.getData())
        self.clothesView.delegate = self
    }
}

extension ViewController: CustomDelegate {
    func buttonPressed() {
        guard let vm = clothesViewModel else { return }
        self.clothesView.updatePotatoText(info: vm.getProductInfo())
    }
}
