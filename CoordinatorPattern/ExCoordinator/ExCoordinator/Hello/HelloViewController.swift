//
//  HelloViewController.swift
//  ExCoordinator
//
//  Created by 박준하 on 2023/02/09.
//

import UIKit
import SnapKit
import Then

protocol HelloViewControllerDelegate {
    func hello()
}

class HelloViewController: UIViewController {

    var delegate: HelloViewControllerDelegate?
    
    private lazy var helloButton = UIButton().then {
        $0.setTitle("안녕!!", for: .normal)
        $0.addTarget(self, action: #selector(HelloButtonDidTap), for: .touchUpInside)
        $0.backgroundColor = .white
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "안녕", style: .plain, target: self, action: #selector(HelloButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        
        view.addSubview(helloButton)
        helloButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(150)
        }
    }
    
    @objc
    func HelloButtonDidTap() {
        self.delegate?.hello()
    }
}
