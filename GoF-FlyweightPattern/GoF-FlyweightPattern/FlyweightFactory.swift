import Foundation
import UIKit

class FlyweightFactory {
    private var flyweights: [String: Flyweight] = [:]
    
    func getFlyweight(key: String) -> Flyweight {
        if let flyweight = flyweights[key] {
            return flyweight
        } else {
            let newFlyweight = ConcreteFlyweight(value: key)
            flyweights[key] = newFlyweight
            return newFlyweight
        }
    }
}
