//
//  AdvancedRemoteControl.swift
//  GoF-BridgePattern
//
//  Created by 박준하 on 2023/02/28.
//

// AdvancedRemoteControl -> RemoteControl -> Device <- TV, Radio
class AdvancedRemoteControl: RemoteControl {
    func mute() {
        device.setVolume(to: 0)
    }
}
