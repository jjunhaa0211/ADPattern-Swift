import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    var iPadContent = UIContent(a: iPadUIFactoy())
    var iPhoneContent = UIContent()
    
    internal lazy var iPadContentButton = UIButton().then {
        $0.setTitle(iPadContent.label?.title ?? "", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .black), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .red
    }
    
    internal lazy var iPhoneContentButton = UIButton().then {
        $0.setTitle(iPhoneContent.label?.title ?? "", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .black), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .gray
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        view.addSubview(iPadContentButton)
        view.addSubview(iPhoneContentButton)
        
        iPadContentButton.snp.makeConstraints {
            $0.height.width.equalTo(200)
            $0.centerX.centerY.equalToSuperview()
        }
        
        iPhoneContentButton.snp.makeConstraints {
            $0.top.equalTo(iPadContentButton.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(150.0)
        }
        
        iPadContentButton.rx.tap
            .bind {
                self.iPadContent.button?.touchUP()
            }
        
        iPhoneContentButton.rx.tap
            .bind {
                self.iPhoneContent.button?.touchUP()
            }
    }
}

