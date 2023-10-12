//
//  ClothesView.swift
//  BasicMVVM
//
//  Created by 박준하 on 10/12/23.
//

import UIKit
import SnapKit
import Then

protocol CustomDelegate{
    func buttonPressed()
}

class ClothesView: UIView {
    let titleLabel = UILabel().then {
        $0.text = "현재 상품을 보시겠습니까?"
        $0.font = UIFont.systemFont(ofSize: 20.0)
    }
    
    let productLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 17.0)
    }
    
    let searchButton = UIButton(type: .custom).then {
        $0.setTitle("상품보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .red
        $0.addTarget(self, action: #selector(searchButtonTap), for: .touchUpInside)
    }
    
    var delegate: CustomDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    @available(*,unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    
    func layout(){
        self.addSubview(titleLabel)
        self.addSubview(productLabel)
        self.addSubview(searchButton)
        
        self.titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        self.productLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(50)
        }
        
        self.searchButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets.bottom).inset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
    }
    
    func updatePotatoText(info: String){
        self.productLabel.text = info
    }
    
    @objc func searchButtonTap() {
        self.delegate?.buttonPressed()
    }
}
