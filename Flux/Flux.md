# Flux

<img width="1051" alt="스크린샷 2024-03-14 오후 6 49 53" src="https://github.com/jjunhaa0211/ADPattern-Swift/assets/102890390/1b5489d7-a96d-4bfc-bdbb-963bdd626f35">

> 웹 애플리케이션을 위해 facebook에 의해 개발된 아키텍처입니당!!
> 

## 등장 이유

> MVC 패턴의 복잡성과 데이터 흐름의 양방향성 문제를 해결하기 위해서 등장
> 

## 핵심

- Flux의 핵심은 단방향 흐름입니다.

<img width="512" alt="스크린샷 2024-03-14 오후 6 51 51" src="https://github.com/jjunhaa0211/ADPattern-Swift/assets/102890390/6073a0ae-2299-4492-84e5-eb906ed6a51b">

## 구성 요소

- Action
    - 사용자의 행동이나 시스템에서 발생하는 이벤트를 정의한 객체
    - 사용자가 버튼을 누르는 행동이 이에 해당합니다.
- Dispatcher
    - 액션을 받아서 모든 Store에 전달하는 역할
    - Dispatcher는 애플리케이션 내에서 하나만 존재하며, 모든 데이터 흐름을 관리합니다.
- Store
    - 애플리케이션 상태와 로직을 담당
    - Store는 Dispatcher로부터 액선을 받아 상태를 변경하고, 변경사항이 있을 때 View를 업데이트함
- View
    - 사용자 인터페이스 담당
    - iOS에는 주로 UIView나 UIViewController가 View의 역할을 합니다.
    - Store를 통해서 상태 변화를 감지하고 화면을 업데이트합니다.

## 장점

- Flux의 아키텍처를 적용하면 복잡한 상호작용과 더 잘 관리할 수 있습니다.
- 컴포넌트 간의 의존성을 줄이고 앱의 확장성과 유지보수성을 향상합니다.
