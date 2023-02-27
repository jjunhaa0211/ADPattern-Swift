//
//  Client.swift
//  GoF-FactoryMethodPattern
//
//  Created by 박준하 on 2023/02/27.
//

import Foundation

class Client {
    func order(f: AppleFactory) {
        let ep = f.createElectronics()
        ep.produceProduct()
    }
}
