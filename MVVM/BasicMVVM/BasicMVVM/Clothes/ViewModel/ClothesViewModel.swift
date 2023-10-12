//
//  ClothesViewModel.swift
//  BasicMVVM
//
//  Created by 박준하 on 10/12/23.
//

import UIKit

class ClothesViewModel {
    private let clothes: Clothes
    
    init(clothes: Clothes) {
        self.clothes = clothes
    }
    
    var name: String {
        return self.clothes.name
    }
    
    private func getPrice(size: Clothes.Size) -> String {
        switch size {
        case .small:
            return "10만원"
        case .medium:
            return "20만원"
        case .large:
            return "30만원"
        }
    }
    
    func getProductInfo() -> String {
        return "상품명: \(clothes.name) 가격: \(getPrice(size: clothes.size))"
    }
}
