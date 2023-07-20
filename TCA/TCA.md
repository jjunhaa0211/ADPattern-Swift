# TCA

---

## TCA란?

- 일관되고 이해할 수 있는 방식으로 앱을 만들기 위해 탄생한 라이브러리
- 다양한 목적과 복잡도를 가진 앱을 만들기 위해 필요한 핵심 아키텍처
- 합성, 테스팅 그리고 인체공학을 염두에 둔 TCA는 UI, UIKit 전부 지원하며 애플 플랫폼에서 사용가능합니다.

## TCA 특징

- Elm이나 Redux 같은 다른 라이브러리들의 아이디어 기반으로 만들어짐
- TCA도 Fiux 가반이라고 할 수 있음
- Composable 한다는 것은 조립할 수 있는 객체를 작게 나눌 수 있다는 것을 의미한다.

## TCA 탄생 배경

- 기존 MVC 패턴은 데이터가 양방향으로 흘러서 한눈에 파악하기 어려움

### 기존 흐름

1. view = 사용자 입력 이벤트가 들어오면 controller에 알린다.
2. controller = view로 받은 것을 model에 전달하고 update 요청을 한다
3. model = controller로 받은 update 요청을 실행, controller에게 결과 값을 알려준다.
4. controller = model로 부터 받은 결과 값을 사용해 view에게 업데이트 요청

## Flux의 등장

기존 양방향으로 이동하다보면 여러기능, 화면 UI가 많을 수록 더 복잡해지기 때문에 facebook에서는 flux 아키텍처를 고안하게 되었다. (참고로 flux는 단방향으로 고안되었다)

![스크린샷 2023-07-20 오후 6.13.03.png](TCA%20326a49ba5921444bafec444e4ee0173c/%25E1%2584%2589%25E1%2585%25B3%25E1%2584%258F%25E1%2585%25B3%25E1%2584%2585%25E1%2585%25B5%25E1%2586%25AB%25E1%2584%2589%25E1%2585%25A3%25E1%2586%25BA_2023-07-20_%25E1%2584%258B%25E1%2585%25A9%25E1%2584%2592%25E1%2585%25AE_6.13.03.png)

1. view는 action을 dispatcher에 보냄
2. dispatcher는 모든 store에 Action으로 보냄
3. store는 데이터를 view로 보낸다

## Flux 객체 뜯어보기

### Dispatcher

- 등록된 store는 작업을 dispatch한다,
- 앱의 모든 store는 모든 Action에 수신한다.

### Store

- 앱의 데이터 보관
- Store의 데이터는 action에 대한 응답을 통해서만 변경
- Store의 데이터가 바뀔 때마다 change 발생
- App에는 많은 store가 있음

### Action

- 앱의 내부 API를 정의

### View

- Stroe의 데이터를 사용하는 경우, 해당 Store의 변경 이벤트도 주목해야한다. 그러면 Store가 변경사항을 보낼 때 view는 변경된 데이터를 가져와 다시 화면에 그릴 수 있다.

## Flux VS Redux

- Flux는 Singleton dispatcher를 가지지만 Redux는 dispatcher가 없다
- Flux는 여러 Store를 가지지만, Redux는 하나의 Store만 가진다.
- Flux는 mutable state, redux는 immutable state를 가진다.

## TCA의 구조

![스크린샷 2023-07-20 오후 6.20.52.png](TCA%20326a49ba5921444bafec444e4ee0173c/%25E1%2584%2589%25E1%2585%25B3%25E1%2584%258F%25E1%2585%25B3%25E1%2584%2585%25E1%2585%25B5%25E1%2586%25AB%25E1%2584%2589%25E1%2585%25A3%25E1%2586%25BA_2023-07-20_%25E1%2584%258B%25E1%2585%25A9%25E1%2584%2592%25E1%2585%25AE_6.20.52.png)

## State

- 비지니스 로직을 수행하기 위해 logic과 UI를 렌더링 하는데 필요한 데이터를 설명하는 타입

## Action

- 정의한 기능에서 일어나는 모든 action 관리

## Reducer

- 어떤 Action이 주어졌을 때 현재 State를 다음 State로 진화 시키는 방법을 설명
- 이펙트를 반환 (이펙트는 API 리퀘스트 같은 것을 말한다.)

## Store

- 실제로 기능이 동작하는 공간
- 우리는 모든 유저의 Action을 Store로 보내지고 Store에서 상태 변경을 관찰하여 UI 업데이트

## TCA 어떻게 하는 것일까?

- 현재는 SPM만 지원합니다.
- https://github.com/pointfreeco/swift-composable-architecture

다음에는 코드로 다시 돌아오겠습니다!