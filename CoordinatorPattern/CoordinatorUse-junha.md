# Coordinator Pattern 사용

---

### **Coordinator** 사용방법

사용방법을 설명하기 위해서 간단한 버튼을 눌르면 다른 화면으로 전환되는 view를 만들어보겠습니다.

```
protocol Coordinator : class {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
```

<br>

일단 **Coordinator**는 계속 사용하기 때문에 **Coordinator**를 하나 만들면 하위 **Coordinator**가 있다고 생각하시면 됩니다

<br>

```
class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var greeting: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
        func start() {
        if self.greeting {
            self.showHelloViewController()
        } else {
            self.showByeViewController()
        }
    }
    
    func showHelloViewController() {
    
    }
    
    func showByeViewController() {
    
    }
}
```

<br>

일단 AppCoordinator는 전반적인 모든 **Coordinator**에 흐름을 조정하기 때문에 이곳이 자신이 만든 **Coordinator**들을 선언해줍니다.

저희는 간단한 인사하는 앱을 만들기 위해 greeting이라는 변수와 if문을 작성했습니다.

그럼 start는 어떤 역활을 할까요?

start는 컨트롤러 생성, 화면 전환 및 종속성 주입의 역할을 합니다. 쉽게 생각해서 start에서 화면 전환 등등의 이벤트가 방출됩니다.

그럼 childCoordinator는 왜 배열로 선언할까요? childCoordinator는 child Coordinator가 할당 해제되는 것을 방지하기 위해 배열을 사용합니다.

<br>

```
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window

            let navigationController = UINavigationController()
            self.window?.rootViewController = navigationController
            
            let coordinator = AppCoordinator(navigationController: navigationController)
            coordinator.start()
            
            self.window?.makeKeyAndVisible()
        }
    }

}
```

<br>

이런식으로 AppCoordinator를 사용해서 흐름을 제어하는 것을 볼 수 있습니다.

<br>

```
import UIKit

protocol HelloCoordinatorDelegate {
    func tapHello(_ coordinator: HelloCoordinator)
}

class HelloCoordinator: Coordinator, HelloViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: HelloCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HelloViewController()
        viewController.view.backgroundColor = .red
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func hello() {
        self.delegate?.tapHello(self)
    }
}
```

<br>

### 흐름

본격적으로 요번 앱에 **Coordinator** 흐름입니다.

HelloViewController -> AppCoordinator -> AppCoordinator 이라고 이해하시면 편합니다.

HelloViewController가 나 이런 이벤트가 호출되었어! 라고 AppCoordinator에게 전하는 AppCoordinator가 AppCoordinator에게 진행시켜! 라고 전해주는 것입니다.

다시 본래로 돌아와서 HelloViewController를 만들기 전에 Delegate를 설정해주어야합니다.

<br>

```
import UIKit
import SnapKit
import Then

protocol HelloViewControllerDelegate {
    func hello()
}

class HelloViewController: UIViewController {

    var delegate: HelloViewControllerDelegate?
    
    private lazy var helloButton = UIButton().then {
        $0.setTitle("안녕!!", for: .normal)
        $0.addTarget(self, action: #selector(HelloButtonDidTap), for: .touchUpInside)
        $0.backgroundColor = .blue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "안녕", style: .plain, target: self, action: #selector(HelloButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        
        view.addSubview(helloButton)
        helloButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(150)
        }
    }
    
    @objc
    func HelloButtonDidTap() {
        self.delegate?.hello()
    }
}
```

<br>

HelloCoordinator에서 받은 것을 delegate를 통해 호출해줍니다.

그리고 똑같이 ByeViewController와 ByeCoordinator를 설정해주도록 하겠습니다.

<br>

```
import UIKit

protocol ByeViewControllerDelegate {
    func bye()
}

class ByeViewController: UIViewController {

    var delegate: ByeViewControllerDelegate?
    
    private lazy var byeButton = UIButton().then {
        $0.setTitle("잘가~~", for: .normal)
        $0.addTarget(self, action: #selector(byeButtonDidTap), for: .touchUpInside)
        $0.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "잘가", style: .plain, target: self, action: #selector(byeButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        
        view.addSubview(byeButton)
        byeButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(150)
        }
    }

    @objc
    func byeButtonDidTap() {
        self.delegate?.bye()
    }
}
```

```
import UIKit

protocol ByeCoordinatorDelegate {
    func tapBye(_ coordinator: ByeCoordinator)
}

class ByeCoordinator: Coordinator, ByeViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: ByeCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ByeViewController()
        viewController.view.backgroundColor = .blue
        viewController.delegate = self
        
        self.navigationController.viewControllers = [viewController]
    }
    
    func bye() {
        self.delegate?.tapBye(self)
    }
}
```

<br>

이제 AppCoordinator 다시 설정해보도록 하겠습니다.

```
import UIKit

class AppCoordinator: Coordinator, ByeCoordinatorDelegate, HelloCoordinatorDelegate {

    // child Coordinator가 할당 해제되는 것을 방지하기 위해 배열을 사용한다
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var greeting: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if self.greeting {
            self.showHelloViewController()
        } else {
            self.showByeViewController()
        }
    }
    
    private func showHelloViewController() {
        let coordinator = HelloCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    private func showByeViewController() {
        let coordinator = ByeCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    func tapBye(_ coordinator: ByeCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showHelloViewController()
    }
    
    func tapHello(_ coordinator: HelloCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showByeViewController()
    }
}
```

<br>

### 글을 마치며..

이렇게 간..단한? **Coordinator** 예제를 통해서 Coordinator를 알아보았는데요 실행화면을 보면 전에 present 했던 것처럼 나오지만 present는 그냥 때..려박다? 이런 느낌이면 Coordinator를 통해서 HelloViewController -> AppCoordinator -> AppCoordinator 이렇게 흐름을 제어해봤습니다. 

전체 코드는 아래에 걸어두겠습니다.

[코드 예제](Coordinator](https://github.com/jjunhaa0211/ADPattern-Swift/tree/main/CoordinatorPattern/ExCoordinator)
