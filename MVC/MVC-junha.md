# MVC

---
<br>

MVC란? 

- Model
    - 앱이 가지는 데이터를 정의
    - 모델 정의
    - UI 관리 변수는 Model이 아니라 ViewController에서 관리한다.
    - 앱에 대한 모델이 아니라 뷰의 데이터를 말한다.
    - UI와 독립되어있다.
    - 비지니스 로직을 담당한다.
- View
    - 뷰는 간단한 뷰들을 제공
    - 파라미터로 받아 복잡한 뷰를 커스텀
    - 뷰의 위치 정보, 표시할 데이터를 받아 생성
    - 스토리보드 파일을 포함한다.
- Controller
    - model을 생성하거나 변수를 set, get합니다.
    - api 호출 및 버튼 이벤트 레이아웃 전부 Controller에서 다룹니다.
    - 여러분이 보통 View를 나누지 않고 다 때려박았으면 자신도 모른체 MVC를 사용하고 있었던 것 입니다.
    - Model과 View의 다리로 Controller가 없으면 Model과 View는 서로의 정체를 알 수 없다.

서로의 관계

Model과 Controller

- Controller는 모델에 직접 접근 가능하지만 Model은 Controller에 Notification 또는 KVO 방식을 총해서 모델의 변화를 알립니다.
- Controller는 모델을 접근 할 수 있지만 Model은 제약있는 방식으로 접근할 수 있습니다.

Model과 View

- Model은 UI에 독립적이고 View의 정체를 알 수 없으며, Model도 View의 정체를 알 수 없습니다.

View와 Controller

- Controller는 View에 대해서 outlet을 이용해 View에게 직접 접근 가능
- View는 Controller에서 구조적으로 명시된  방식인 Controller에게 행위에 대한 delegate와 Data Souce를 할 수 있습니다.
- action과 target의 구조로 사용자의 행위에 따라 필요한 함수를 호출 할 수있습니다

장점

- 다른 패턴에 비해 코드량이 적다
- 소규모 프로젝트에 적합
- 애플에서 기본적으로 지원하고 있는 패턴이기 때문에 쉽게 접근 가능
- 많은 개발자들에게 친숙한 패턴이고 쉽게 유지보수? 가능
- 개발 속도가 빠르기 떄문에 아키텍처가 중요하지 않을 때 사용하거나 규모가 작은 프로젝트에 사용하기 좋다.

단점

- View와 Controller가 너무 밀접하게 연결되어있다.
- View와 Controller가 View의 라이프 사이클까지 관리 하기 떄문에 분리하기가 어렵다.
- 재 사용성이 너무 떨어지고 유닛 테스트를 진행하기 힘들어진다.
- 모든 코드가 너무 Controller에 밀집되어있어서 delegate나 dataSource 관리, 네트워크 등등 많은 코드가 Controller에 모여서 가독성이 떨어지고 내부가 복잡해진다.
- 사람들이 Massive View Controller라고 놀리는 말까지 생겼다.
- 한번 복잡해진 코드는 프로젝트의 규모가 커질수록 유지보수하기 힘들게 만든다.

MVC 아키텍처는 아키텍처로 사용하기 적절할까?

- **Distribution**
    - View와 Model은 분리되었다고는 하지만 View와 Controller가 너무 의존성이 강하다.
- **Testability**
    - View와 Controller가 밀접하게 되어있어서 Model만 테스트를 진행할 수 있다.
- Easy of Use
    - 가장 적은 양의 코드를 필요로 하며 경험이 적은 개발자가 쉽게 유지보수 할 수 있다.

경험이 적은 개발자 또는 아키텍처를 잘 모를 때는 사용하기 정말 편한 패턴이지만 프로젝트의 기능 또는 네트워크로 받는 데이터가 많아질 수록 점점 방대한 데이터로 인해서 유지보수가 많이 어려지고 유지보수의 비용이 점점 증가합니다.
