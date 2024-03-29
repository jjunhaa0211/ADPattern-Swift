# [구조 패턴] Bridge Pattern
---

### 브리지 패턴이란?

브리지 패턴이란 구현부에서 추상층을 분리하여 각자 독립적으로 변형할 수 있게 하는 패턴입니다.
말이 조금 어렵나요? 조금 쉽게 말하면 호환되지 않는 인터페이스를 가진 객체들이 협업할 수있도록 하는 디자인 패턴입니다.
<br>
예를 들어서 자동차가 하늘을 날 수는 없죠? 하지만 비행기가 자동차를 실으면 하늘을 날 수 있죠 (너무 직설적인가...) 객체들끼리의 협업? 이라고 생각하면 될 것 같습니다.

<br>

### 브리지 패턴 더욱 쉽게 알기 + 브리지 패턴을 사용하는 경우

예를 들어서 아이폰있다고 생각해봅시다.
아이폰도 모양이 달라지고 색깔도 가면갈 수록 다양해집니다.
<br>
만약 모양이 달라질 때 마다 색깔이 달라진다고 가정하면 일일이 저희가 수정해야하는 상황이 오면 많이 불편하죠
그래서 브리지 패턴을 사용하면 색깔과 모양을 따로 받아서 독립적으로 수정, 확장 할 수 있도록 합니다.
또는 하나의 클래스가 점점 커지면서 다양한 일들을 수행하게 된다면 복잡해지는 단점이 존재하는데 이 때 기능과 추상화를 나누기 위해 사용합니다.

<br>

### 브리지 패턴 구조를 이해해보자!

> Refined Abstraction -> Abstraction -> Implementor -> Concrete Implementor
<br>
-   Refined Abstraction
    -   Abstraction에서 정의한 인터페이스를 확장하는 역활을 합니다.
-   Abstraction
    -   추상화의 인터페이스를 정의합니다.
    -   Implementor 타입의 객체에 대한 참조를 유지합니다.
    -   Client가 사용하는 최상의 타입입니다.
-   Implementor
    -   구현 클래스의 인터페이스를 정의 합니다. 여기서 정의한 인터페이스는 Avstraction의 인터페이스와 일치하지 않을 수 있습니다.
    -   Concrete Implementation는 Implementation을 채택해 실제 기능을 구현한 구체타입입니다.
-   Concrete Implementor
    -   Implementor 인터페이스의 구체적으로 구현합니다.

<br>

### 브리지 패턴의 장단점

#### 장점
-   단일 책임 원칙 준수
-   비지니스 로직에서 인터페이스 또는 데이터 변환 코드를 분리할 수 있습니다.
-   개방/패쇄 원칙 준수

<br>

#### 단점
-   다수의 인터 페이스와 클래스를 도입하기 떄문에 코드가 복잡해질 수 있습니다.
-   때로는 브리지 패턴을 사용하지 않고 코드의 나머지 부분과 작동하도록 서비스 클래스를 변경하는 것이 방법일 될 수 있습니다.
-   결합도가 높은 클래스에 적용할 경우 분리하기 힘들거나 타입이 많아져 오히려 코드가 더 복잡해질 가능성이 존재합니다.

<br>

###  브리지 패턴 예제 코드

[Bridge Pattern 예제코드](https://github.com/jjunhaa0211/ADPattern-Swift/tree/main/GoF-BridgePattern)
<br>


오늘도 수고 많으셨습니다.!!!
