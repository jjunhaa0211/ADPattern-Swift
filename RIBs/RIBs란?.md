## RIBs 가 나온 이유

- 모듈화에 대하여
    - MVC를 사용할 때 새로운 기능이 늘어나며 앱의 복잡성 증가
    - 모듈이 증가할 수록 테스트 하기 어려워짐
    - 하나의 ViewController파일이 너무 많이 증가
        - 테스트가 어려운 구조
        - 비즈니스 로직, 데이터 변경, 데이터 검증, 네트워크 로직, 라우팅 로직이 나눠짐

## VIPER 아키텍쳐의 등장

- View
- Interactor
    - 비즈니스 로직 포함, API나 DB로 Data를 받아서 Entity 생성
- Presenter
    - View에서 유저 액션을 받고, Interactor에 Data를 요쳥하여 View에 그림
- Entity
    - Interactor에 의해 만들어지는 모델
- Router
    - 화면 전환 로직

VIPER 는 MVC에 비해서 VIPER는 더 추상적이었으며 가볍게 유닛 테스트가 가능했습니다.

## RIBs 탄생 배경

- VIPER 단점 보완
- RIBs의 목표는 제대로 된 모듈화가 목적이지만 VIPER는 그러지 않았다.
- View 트리를 중심으로 앱이 진행되는 단점
- View에 의해 앱 상태가 동작되는 장점

## RIBs 아이디어

- view가 아닌 business logic 중심구조
    - state 변화는 view가 아닌 business logic 관리
    - 하나의 화면이 여러 viewcontroller로 이루어질 수 있다는 점이 존재

## RIBs 구조

### Interactor

- 비지니스 로직을 포함합니다.
- Rx Sequence에 대한 Subsciption 수행
- child RIB을 붙일지 말지 결정
- 부모 자식 RIB 간의 통신

### Router

- Interactor를 바라보고 있다가 RIBs를 붙이거나 떼버리거나 합니다.
- Interactor의 결정이 오면 RIB 노드를 attach 하거나 detach 하는 작업을 진행하여 논리적인 트리 구조 형성

### Builder

- RIB의 모든 컴포넌트를 생성하고 DI를 정의
- Router, Interactor, View, Component를 생성
- 각 컴포너트 클래스들을 생성하고 자식 Interactor와 부모 Interactor의 Listenr 인터페이스 연결을 구성하고 Router를 Output으로 반환하게 된다.
- Builder는 본인의 역활을 위해서 Buildable와 Builder이 있습니다.

### View

- View는 UI 화면을 구성하고 생성하며, 사용자로 부터 들어온 UIEvent를 Presenter에게 전달하거나 UI를 업데이트하는 역활을 합니다.

### Presenter

- 비지니스 로직을 수행하는 Interactor와 UI를 구성하는 View 사이에서 통신을 담당합니다.
- Router, Interactor, Builder 3가지는 RIB의 필수 구성 요소이며 그 외 Optional로 View와 Presenter라는 컴포넌트가 존재합니다.
