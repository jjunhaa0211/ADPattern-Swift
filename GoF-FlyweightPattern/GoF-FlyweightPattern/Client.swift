import Foundation
import UIKit

class Client {
    private var flyweightFactory = FlyweightFactory()
    
    func operation(text: String) {
        for char in text {
            let flyweight = flyweightFactory.getFlyweight(key: String(char))
            print(flyweight.value)
        }
    }
}
