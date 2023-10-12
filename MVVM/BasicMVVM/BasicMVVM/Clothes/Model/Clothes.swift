import UIKit

struct Clothes {
    enum Size {
        case small
        case medium
        case large
    }
    
    var name: String
    var size: Size
    
//    init(name: String, size: Size) {
//        self.name = name
//        self.size = size
//    }
}

extension Clothes {
    static func getData() -> Clothes {
        return Clothes(name: "NIKE", size: .small)
    }
}
