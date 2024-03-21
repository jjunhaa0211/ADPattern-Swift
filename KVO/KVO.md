# KVO (key-value-observing)

`Observing` 어디서 많이 본거 같은데…

`RxSwift`를 공부하신 분이라면 `Observable`라는 단어가 익숙할 것 같습니다.

`Observable`도 감시자라는 뜻을 가지고 있고 `Observing`은 감시한다는 뜻을 가지고 있습니다. 그러면 지금부터 `KVO`는 어떤 것을 감시하는지 알아보도록 할까요?

결론부터 말씀드리자면 `KVO`는 다른 오브젝트의 속성을 감시하는 역할을 합니다.

아직 잘 와 닿지 않는데용…

아래 더 자세한 설명을 해드리겠습니다.

- 특정 키 값의 변화를 감지기 위한 기능
- 객체의 프로퍼티 변경 사항을 다른 객체에 알리기 위해 사용하는 코코아 프로그래밍 패턴
- `Model`과 `View` 같이 논리적으로 분리된 파트간의 변경 사항을 전달하는데 유용하다
- `KVO`는 모델 레이어와 뷰 레이어 같이 논리적으로 분리되어 있는 오브젝트 간 메세지를 전달 합니다.
- 타입 정의 외부에서 `obsever`를 추가할 때 사용한다.

### 시각화

`KVO`를 시각화 해볼게요.

```swift
값 변경 -> 감시하고 있는 오브젝트 헨들러가 호출됨 -> handler 작동
```

위 동작이 생각보다 어렵지 않죠??

이제 본격적 설명ㅇㅡ…

아! 맞다 `KVO` 를 알기 위해서 사전에 알고 가야하는 지식이 있습니다.

### 알고 가야할 것

`KVO`를 사용하기 위해서는 `NSOject`를 상속해야합니다.
상속을 받아야하기 때문에, `Class`에서만 사용이 가능하고요.
observe 하려는 프로퍼티에 `@objc attribute`와 `dynamic modifier`를 붙여주어야합니다.

이때 `Dynamic modifier`이 선언된 부분에 한해 Objc 런타임 방식을 사용하겠다는 것이고, 런타임 시점에 호출해야 할 특정 메소드의 구현을 결정하는 것이다.

### 감시자를 정의하는 방법

감시자 역할을 하는 인스턴스는 한 개 이상의 속성을 감시할 수 있습니다.
감시자의 인스터스는 `observe(_:options:changeHandler:)` 메소드에 감시를 원하는 속성의 key-path를 전달하는 것입니다. 호출하는 시점부터 속성의 값 변경을 감시합니다.

1. 파라미터에는 `\.objectToObserve`는 `objectToObserve` 인스턴스의 속은 key path입니다.
2. 파라미터인 `[.old, .new]`는 마지막 트레일링 클로저에 `oldValue`와 `newValue` 라는 속성을 사용여부 결정을 해야합니다.
    1. `oldValue`는 변경 직전의 속성의 값이고, `newValue`는 변경 이후 속성의 값입니다.
3. 파라미터는 클로저로, 값 변경시 수행할 동작을 정의해야합니다.

결론은 첫번째 파라미터에서 받는 것은 감시자 역할을 하는 오브젝트가 전달이되고 두번째 파라미터에 `NSKeyValueObservedCange<Value>` 타입의 값이 들어오는데, 이 값에서 `oldValue`와 `newValue`에 접근 할 수 있습니다.

만약 `observe` 메서드의 `options` 파라미터에 아무것도 전달되지 않는다면, `nil`로 값이 초기화됩니다.

### 본격! 사용방법!

`Model` 객체에서 값이 변경 되었을 경우, 변경된 값을 `UI` 에 반영해야합니다.
이때 컨트롤러가 모델 객체에 `observing`을 도입, 델리게이트에 메세지를 보내 처리하게해야합니다.

```swift
class Person: NSObject {
		@objc dynamic var name: String
		
		init(name: Stirng) {
				self.name = name
		}
}

var person = Person(name: "Junha")
person.observe(\.name, options: [.old, .new]) { (object, change) in
		print("name changed form \(change.oldValue) to \(change.newValue)")
}

person.name = "준하" // Name changed from Optional("Junha") to Optional("도리")

// 예제 출처[https://velog.io/@jee/KVO-Key-Value-Observing]
```

프로퍼티 값이 `Junha`에서 `준하`로 변경되어서 `Observer`의 change handler가 호출 했기 때문에 `handler` 내의 `oldValue`와 `newValue`를 가져올 수 있게 된다.

그리고 `Option`에 `old/new` 말고도 `initial`과 `prior`가 있으며 설명은 아래와 같습니다.

- old
    - 변경 전 값
- new
    - 변경 후 값
- initial
    - Observer 등록 전 handler 호출 시 (newValue로 들어갑니다)
    - 예제
    
    ```swift
    var person = Person(name: "junha")
    person.observe(\.name, options: [.old, .new, .initial]) { (object, change) in
    		print("name changed form \(change.oldValue) to \(change.newValue)")
    }
    
    // Name changed from nil to Optional("junha")
    ```
    
- prior
    - 변경 전, 후 상태 모두 파악시
    - 예제
    
    ```swift
    var person = Person(name: "junha")
    person.observe(\.name, options: [.old, .new, .prior]) { (object, change) in
        print("Name changed from \(change.oldValue) to \(change.newValue)")
    }
    
    person.name = "준하"
    
    // Name changed from Optional("junha") to nil
    // Name changed from Optional("junha") to Optional("준하")
    ```
    

### KVO의 장점

1. 두 객체 간의 동기화
    1. `Model`과 `View` 같이 분리된 파트간의 변경 사항 전달
2. 내부 소스 변경 없이, 상태 변화에 대응할 수 있다
3. 변경 전/후 값을 파악할 수 있다

### KVO의 단점

1. Objc 런타임에 의존 및 클래스만 구현 가능 (`NSObject` 상속)
2. `dealloc`될 때 옵저버를 지워줘야 한다.

### KVO 왜 사용하는데?

1. `RxSwift`의 `Subscribe` 처럼 논리적인 분리가 가능해집니다.
    1. 예시
        1. `ViewModel`의 어떤 프로퍼티가 변화를 하였을 때, `view`에서의 변화를 유도할 때 사용이 가능합니다.
        2. 하지만 `KVO`의 경우 objc 런타임을 이동하기 때문에 `class`가 `final`이거나 `static dispatch`로 사용이 가능할 때, 모두 objc의 런타임을 이용해 `dynamic dispatch`를 사용하게 된다면 성능에 조금 떨어질 것 같습니다.
2. 제일 큰 장점은 내부의 코드를 건드리지 않고 외부에서 해당 값의 변화를 관찰해서 동작하는 것이 가능합니다.
    1. 비슷한 기능으로 `willSet`과 `didSet`의 경우에는 `class` 내부에 구현해야하지만 `KVO`를 이용한다면 논리적인 분리가 가능해서  외부에서 관찰하는 것이 가능해집니다.
    2. 외부 라이브러리 또는 남이 짠 코드 또는 SDK를 이용하는 내부의 코드를 건들이기 힘든 상황에서 `NSObject`를 상속받고 접근이 가능하다면 외부에서 관찰할 수 있는 설계를 할 수 있어서 용의합니다.
        1. 하지만 이제 이것도 `NSObject`를 상속 받고 `@objc dynamic`으로 Objc 런타임 중에 접근이 가능할 경우에만 된다는 것 알아주세요.
3. 기존 내장 프레임워크에서 아직 objc 코드가 swift로 전달되지 않은 곳에서는 `KVO`를 사용해서 접근이 가능한 것들이 있습니다.
    1. 예를 들어서 `AVFoundation`같은 것들은 내부 변수들을 참조할때, 사용하는 경우가 많습니다.
    

긴글 읽어주셔서 감사합니다~~^^