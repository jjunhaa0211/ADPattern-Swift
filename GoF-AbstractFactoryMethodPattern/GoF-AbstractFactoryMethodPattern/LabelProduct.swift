//
//  LabelProduct.swift
//  GoF-AbstractFactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

//출력되는 라벨설정
final class IPhoneLabel: CLable {
    var title: String = "iPhoneLabel"
}

final class IPadLabel: CLable {
    var title: String = "iPadLabel"
}
