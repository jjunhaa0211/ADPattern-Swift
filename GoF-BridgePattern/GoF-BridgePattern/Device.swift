//
//  Device.swift
//  GoF-BridgePattern
//
//  Created by 박준하 on 2023/02/28.
//

import Foundation

// RemteControl로 인해서 추상화 당함
// Abstraction의 기능을 구현하는 인터페이스
// Device를 상속받은 TV와 Radio 구체 타입이 존재함
protocol Device {
    func turnOn()
    func setVolume(to: Int)
}
