# MVP

<br>

우리가 보통 그냥 심심한데 개발 좀 해볼까? 할 때 하는 개발은 주로 MVC로 구현하기 때문에 MVC에 적응되어 있을 텐데 오늘은 조금 생소한 MVP를 알아보도록 하겠습니다.

<br>

<img width="472" alt="스크린샷 2023-04-02 오후 10 26 26" src="https://user-images.githubusercontent.com/102890390/229355730-d7c63b1d-4064-4e3b-be0b-06b7a51273e9.png">
<img width="464" alt="스크린샷 2023-04-02 오후 10 26 39" src="https://user-images.githubusercontent.com/102890390/229355741-3e1f8202-45aa-4bfc-b3e9-859a5b6ac7b0.png">

MVP란?

- MVP는 Model-View-Presenter의 약자입니다.
- 사용자 인터페이스를 모델, 뷰, 프레젠터 세 가지 역할로 나누어 관리함
- 각 역할이 분리되어 있어 유지보수와 테스트가 용이합니다.

<br>

MVP의 지켜야할 규칙

- Model과 ViewController는 Presenter를 통해 알아야하고 절대 서로를 알고 있으면 안되요
- ViewController는 유저의 버튼 또는 트리거는 프레젠터가 전부 하게 된다.
- Model은 데이터 수정과 추가를 담당해야한다
- Presenter는 API Request 즉 중간 관리자 역활을 해야합니다.
- ViewController는 View를 수정, 설정, 추가 합니다.

<br>

Model

- 데이터 모델을 정의
- 실질적인 데이터
- 데이터 형식과 속성을 정의(데이터 수정, 추가)

<br>

View

- MVC의 View와 ViewController를 모두 포함
- 사용자에게 보여지는 UI요소
- 사용자가 입력에 대한 이벤트를 Presenter에 전달하고 Presenter가 전달한 데이터를 화면에 표시

<br>

Presenter

- UIKit과 관련이 없는 로직들을 수행
- 사용자 응답에 반응하거나 UI를 업데이트하는 일을 담당
- View에서 요청한 정보를 Model로 부터 가공해

<br>

MVP 장점

- MVC는 View와 Model 사이의 의존성이 존재했지만 MVP에서는 의존성을 제거
- Presenter를 이용하여 중건저 역활을 수행하므로, View와 Model 간의 상화 작용에 유연함
- View와 Model을 쉽게 교체할 수 있다.
- 유지보수성과 테스트 용이성이 향상됩니다.

<br>

MVP 단점

- View와 Presenter 사이의 의존성
    - MVP 패턴에서 View와 Presenter는 서로 의존성이 있습니다.
    - View에서 이벤트를 처리하고 Presenter를 호출하며, Presenter는 다시 View를 업데이트 하는 번거로움이 있습니다.
    - 의존성은 앱의 복잡도가 증가할 수록 유지보수를 어렵게 만들 수 있습니다.
- Presenter의 책임과 역활
    - Presenter가 View와 Model 사이의 중개자 역활을 수행하는 이점도 있지만 Presenter의 역활이 커질 수록 코드가 길어지고 복잡해질 수 있습니다.
    - Presenter는 데이터의 변화를 감지하는 것이 어렵고 데이터 변화를 감지하므로 알림을 보내는 더 많은 코드의 필요성이 필요합니다.
- View와 Model 사이의 의존성
    - MVP 패턴에서 View는 Model을 호출합니다. View와 Model 사이의 직접적인 의존성을 만들어, View와 Model을 독립적으로 유지하는 것이 어렵고 의존성이 코드의 복잡성을 증가 시킬 수 있습니다.
- 구현의 번거로움
    - MVP 패턴은 구현하기 쉽지 않습니다.
    - V, P, M 사이의 상호작용을 처리하고 유지하는 것은 어려울 수 있습니다.
