//
//  RemoteControl.swift
//  GoF-BridgePattern
//
//  Created by 박준하 on 2023/02/28.
//

import Foundation

// client가 사용하는 최상위 타입
// Implementation을 참조하고 위임
// RemoteControl을 상속한 AdvancedRemoteControl mute()를 가짐
class RemoteControl {
    var device: Device
    init(device: Device) {
        self.device = device
    }
    func togglePower() {
        device.turnOn()
    }
}
