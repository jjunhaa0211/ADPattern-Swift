//
//  Icon.swift
//  JNBoard_MVP
//
//  Created by 박준하 on 3/12/24.
//

import UIKit

enum Icon {
    case message
    case share
    case like
    case write
    case swift

    var image: UIImage? {
        let systemName: String

        switch self {
        case .message: systemName = "message"
        case .share: systemName = "square.and.arrow.up"
        case .like: systemName = "heart"
        case .write: systemName = "square.and.pencil"
        case .swift: systemName = "swiftdata"
        }

        return UIImage(systemName: systemName)
    }
}
