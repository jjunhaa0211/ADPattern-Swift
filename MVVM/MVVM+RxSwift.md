# MVVM

---
## RxSwift는 mvvm과 함께 쓰는데 왜 사용하는 걸까?

- 리액티브 프로그래밍은 코드 없데이트가 변경 사항을 자동으로 반영하도록 설정하자에서 시작함
- 데이터 스트림과 변경 사항의 전파를 중심으로 하는 비동기 프로그래밍이라고 정리함
- 리엑티브를 사용하는 이유는 특정 상태를 유지하는 것보다 로직에 조금 더 집중할 수 있기 때문입니다
- 이러한 라이브러리가 ReactiveX이고 swift 와 함께 사용할 수 있는 것이 RxSwift입니다
- RxSwift는 mvvm 패턴에서 데이터 바인딩하는 대표적인 방법입니다
- view model을 통해서 view와 model의 양방향 바인딩이 가능합니다.
    - rxswift는 이 양방향 바인딩을 도와주는 operator들이 있기 때문에 쉽게 처리할 수 있습니다.

## RxCocoa는 무엇일까?

- RxCocoa는 UI에 집중할 수 있도록 애플리케이션을 제작하기 위한 도구들의 모음인 Cocoa Framework를 rx와 합친 기능을 제공하는 라이브러리 입니다.
- RxCocoa를 사용하여 UI 구성요소에 반응형 확장 기능을 추가하여 UI 이벤트를 추가할 수 있습니다

## MVVM + RxSwift

- view에 액션 추가, 터치 시에 해당 색상 변경, 터치가 벗어나거나 손가락이 떨어지면 색상 복귀
- 액션에 화면 전환 로직 추가
- 테스트 코드 작성

## MVVM

- MVVM의 단점은 정형화된 패턴이 없습니다
- input - ouput
- model - view - view model
- 구조
    - model에서 가져온 view를 업데이트할 데이터를 view model 에서 처리하게 함으로써 Controller가 복잡해지는 것을 줄여줍니다
    - Data Binding
        - view model과 view는 서로에게 데이터의 변경을 알려줄 수 있는 방법이 필요합니다.
    - Model
        - data를 담당
        - model은 view 나 view model 과 관계없이 독립적으로 구성
        - 앱이 사용자에게 보여지는 모습이나 제공방식과 관련이 없음
    - View
        - 화면을 담당
        - 뷰 레이아웃 관련
        - 이벤트 발생 시에 view는 view model에게 알림
            - view에서만 viewmodel에 접근 가능 뷰 모델 프로퍼티 소유
            - input-output을 적용하면서 transform 함수를 가짐
    - viewModel
        - 뷰에 대한 모델
        - view의 모습이 어떤지 모름
        - view와 view model 간에 의존성이 없기 떄문에 유닛 테스트를 하기에 좋음
        - 뷰가 가지는 모델을 포함함
        - 비즈니스 로직을 담당하는 model 프로퍼티 소유
            - Model 의 역할이 비즈니스 로직까지이기 때문에 Entity + Service 로 보면되고 주로 역할에 따라 분리함
            - 서버 통신을 예시로 Repository 에서 서버에서 전달받은 jSON 자료형을 디코딩하여 Entity 로 변환
            - Service 역할은 Repository 에서 변환한 Entity 를 가공하는 비지니스 로직을 수행(예를 들어, Date 자료형의 dateFormat 을 변경하여 원하는 문자열로 가공. 이 문자열이 Model 에 들어감. 이 Model 객체를 View Model 에서 소유)

## input - output

- 뷰로 부터 input이 들어와서 뷰 모델에서 비즈니스 로직을 통해 ouput으로 전달되는 흐름이 이해하기 쉬었다.
- 뷰에서 출발한 스트림이 끊어지지 않고 변하면서 값이 전달되는 이러한 특성은 rx에 반응형 프로그래밍을 나타내기에 적절합니다.
- subscribe은 스트림의 종착점인 viewController 에서 이루어지는 것이 좋습니다.
- 중간에 subscribe을 통해서 스트림을 가공하는 형태가 아닌 Operator를 통해 데이터를 가공하거나 사이드 이펙트를 반영할 수 있습니다.

```swift
protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
 }
```

## bind

- bind를 통해서 subscribe 수행할 수 있습니다.
- bind와 이벤트를 핸들링하는 클로저에서 약한 참조를 사용하는 것은 여러 방법이 있습니다.

```swift
.bind(onNext: { [weak self] data in
    guard let self = self else { return }
    self.task1(data)
    self.task2(data)
})
.disposed(by: disposeBag)
```

bind를 사용하면서 아래의 operator는 사용하지 않아도 됩니다.

```swift
.withUnretained(self)
.bind(onNext: { owner, data in
    owner.task1(data)
    owner.task2(data)
})
.disposed(by: disposeBag)
```

withUnretained는 share과 같이 사용할 때 retain cycle이 발생할 수 있다.

그래서 Driver와는 사용할 수 없다고 함

```swift
.bind(with: self, onNext: { owner, data in
    owner.task1(data)
    owner.task2(data)
})
.disposed(by: disposeBag)
```

bind(with:onNext:)를 사용하면 약한 참조의 인스턴스를 전달할 수 있다.

```swift
.bind(onNext: { [weak self] data in
    self?.task1(data)
    self?.task2(data)
})
.disposed(by: disposeBag)
```

self? 을 사용해야 한다면 다음과 같이 캡처리스트를 생성하고 진행

bind 코드를 살펴보면 guard let 으로 강한 참조하여 전달하고 있다.

## bind와 drive의 차이

- bind 와 drive 모두 main thread 에서 실행되기 때문에 UI 작업을 하기에 적절합니다.
- drive 는 Observable 에서 `asDriver()` 메소드를 통해 변환된 Driver 타입의 핸들링을 합니다.
    - Driver 는 RxCocoa 가 제공하는 UI 처리에 특화된 Observable 인 Traits 의 하나입니다.
- bind 는 Observer 가 추가될때마다 새로운 스트림이 실행됩니다. 반면, drive 는 스트림을 공유합니다. 그래서 하나의 스트림을 여러 곳에서 관찰하는 경우에 bind 보다 메모리의 이점이 존재합니다.
- bind 코드를 살펴보면 onError 가 없습니다. (Driver 는 error 를 방출하지 않기 때문에 bind 와 달리 애초에 없습니다.)
- 또한, drive 는 onCompleted, onDisposed 파라미터가 있기 때문에 사이드 이펙트를 처리하기에 용이합니다.
