//
//  iceCreamComponent.swift
//  GoF-CompositPattern
//
//  Created by 박준하 on 2023/04/07.
//

import UIKit

protocol iceCreamComponent {
    var name: String { get }
    var price: Int { get }
    func getInfo() -> String
}
