import UIKit

class ViewController: UIViewController {

        //UI를 가지고 있는 인스턴스 기기별로 설정
    var iPadContent = UIContent(a: iPadUIFactoy())
    var iPhoneContent = UIContent()

    override func viewDidLoad() {
        super.viewDidLoad()
        touchButton()
        printLabel()
    }

    func touchButton() {
        iPadContent.button?.touchUP()
        iPhoneContent.button?.touchUP()
    }

    func printLabel() {
        print(iPadContent.label?.title ?? "")
        print(iPhoneContent.label?.title ?? "")
    }
}

