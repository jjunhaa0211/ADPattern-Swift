//
//  UserDefaultsManager.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import Foundation

protocol UserDefaultsManagerProtcol {
    func getThread() -> [Thread]
    func setThread(_ newValue: Thread)
}

struct UserDefaultsManager: UserDefaultsManagerProtcol {
    enum Key: String {
        case thread

        var value: String {
            self.rawValue
        }
    }

    func getThread() -> [Thread] {
        guard let data = UserDefaults.standard.data(forKey: Key.thread.value) else { return [] }

        return (try? PropertyListDecoder().decode([Thread].self, from: data)) ?? []
    }

    func setThread(_ newValue: Thread) {
        var currentThread: [Thread] = getThread()
        currentThread.insert(newValue, at: 0)

        UserDefaults.standard.setValue(
            try? PropertyListEncoder().encode(currentThread),
            forKey: Key.thread.value
        )
    }
}
