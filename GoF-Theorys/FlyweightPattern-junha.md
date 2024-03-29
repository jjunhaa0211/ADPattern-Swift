# [구조 패턴] Flyweight Pattern
---

### Flyweight Pattern 이란?

- 동일거나 유사한 객체들 사이에 가능한 많은 데이터를 서로 공유하여 사용하도록 하여 메모리 사용을 절약하는 디자인 패턴

<br>

### Flyweight Pattern 쉽게 이해하기

- 여러 게임 캐릭터 객체를 만들다고 할 때, 캐릭터 마다 모든 특징? 을 객체로 만든다고 하면 메모리 낭비가 될 수 있습니다. 그래서 Flyweight Pattern을 사용하면 캐릭터마다 공통된 속성은 하나의 객체로 관리하고, 개별적인 속성만 별로듸 객체로 생성해서 관리한다고 생각하면 쉽습니다. 위와 같이 하면 객체 수를 줄이고 메모리를 효율적으로 사용할 수 있습니다.

<br>

### Flyweight Pattern은 어떤 경우 사용할까?

- 객체 생성 비용이 높은 상황에서 성능을 향상시키거나 메모리를 관리해야하는 시점에서 사용합니다. 여기서 객체 생성 비용이 높다는 뜻은 객체를 생성하는데 자원, 시간, 비용이 많이 든다는 뜻 입니다.
- Flyweight Pattern을 사용한다는 것은 객체 생성 비용을 줄이고, 객체의 재사용성을 향상시킨다는 뜻 입니다.

<br>

### Flyweight Pattern의 장단점

- 장점
    - 메모리 사용량을  줄여 성능을 향상시킵니다.
        - Flyweight 객체는 동일한 데이터를 공유해서 객체의 인스턴스 수를 줄입니다.
    - 객체 생성 비용을 줄입니다.
    - 객체의 재사용성이 높아집니다.
    - 유연성이 높습니다.
        - 객체를 생성하는 데 필요한 데이터를 캡슐화하여 객체를 생성할 때 동일한 데이터를 사용할 수 있습니다.
    - 유지 보수성이 높습니다.
    - 코드 가독성이 높아집니다.
- 단점
    - 공유 객체의 상태가 변경될 경우에는 주의 해야합니다.
        - 하나의 객체를 공유하기 때문에 하나의 객체에서 상태 변화가 이뤄지면  모든 객체의 영향을 미칩니다.
    - Flyweight 객체들은 공유되는 데이터를 저장하기 때문에, 데이터의 일부분이 자주 변경되는 경우 재사용성이 적합하지 않을 수 있습니다.

<br>

### swift에 Flyweight Pattern이 적합한가?

- swift도 객체 지향 프로그램이므로, Flyweight를 적용하는 것이 적합합니다.
- 클래스는 Flyweight 객체를 구현하는 데 적합한 데이터 타입입니다.
    - 구조체는 객체를 복사하면 값이 복사되므로 값을 공유하는 것은 불가능합니다.
    - Flyweight 패턴을 구현할 떄는 class를 사용하는 것 적절합니다.

<br>

### Flyweight Pattern 구현 방법

1. Flyweight 객체를 생성하는 팩토리 클래스 또는 메소드를 작성합니다.
2. 공유할 데이터를 캡슐화하는 Flyweight 객체를 작성합니다.
3. Flyweight 팰토리에 이미 생성된 객체를 저장하고 재사용합니다.

수고 많았습니다!!

아래는 코드 예제입니다.
<br>
[이동 하기](https://github.com/jjunhaa0211/ADPattern-Swift/tree/main/GoF-FlyweightPattern)
