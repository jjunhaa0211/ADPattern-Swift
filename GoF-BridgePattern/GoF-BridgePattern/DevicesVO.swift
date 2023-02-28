//
//  Devices.swift
//  GoF-BridgePattern
//
//  Created by 박준하 on 2023/02/28.
//

import Foundation

struct TV: Device {
    func turnOn() {
        print("티비 켜짐")
    }
    func setVolume(to percent: Int) {
        print("TV \(percent)")
    }
}

struct Radio: Device {
    func turnOn() {
        print("라디오 켜짐")
    }
    func setVolume(to percent: Int) {
        print("라디오 \(percent)")
    }
}
