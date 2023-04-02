//
//  ByeViewController.swift
//  ExCoordinator
//
//  Created by 박준하 on 2023/02/09.
//

import UIKit

protocol ByeViewControllerDelegate {
    func bye()
}

class ByeViewController: UIViewController {

    var delegate: ByeViewControllerDelegate?
    
    private lazy var byeButton = UIButton().then {
        $0.setTitle("잘가~~", for: .normal)
        $0.addTarget(self, action: #selector(byeButtonDidTap), for: .touchUpInside)
        $0.backgroundColor = .black
        $0.setTitleColor(UIColor.white, for: .normal)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "잘가", style: .plain, target: self, action: #selector(byeButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        
        view.addSubview(byeButton)
        byeButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(150)
        }
    }

    @objc
    func byeButtonDidTap() {
        self.delegate?.bye()
    }
}
