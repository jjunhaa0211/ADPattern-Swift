# [생성 패턴] SingletonPattern
---

### 싱글턴 패턴이란?

싱글턴 패턴이란 클래스에 인스턴스가 하나만 있도록 하면서 그 하나의 인스턴스를 전역 접근으로 지정하는 것을 제공하는 디자인 패턴입니다.
즉 하나의 생성자가 여러개 호출되더라도 실제 객체는 하나이고 최초 생성 이후에 최초 생성자가 생성된 객체를 return하는 것입니다.

<br>

### 주로 사용하는 경우 + 쉽게 이해하기

예를 들어서 우리가 swif를 하면서 회원의 정보를 받아야할 상황이 온다고 가정합시다.
1VC는 name을 받고 2VC는 password를 받고 3VC를 받는 다고 생각해보자.
평소우리는 대부분 밑에 처럼 할 것입니다.

<br>

```
Class UserInFo {
    var name: String
    var password: String
    var age: Int
}

//1VC = name
Class 1VC {
    let u = UserInFo()
    u.name = "하하"
    u.password = nil
    u.age = nil
}

// 2VC = password
Class 2VC {
    let u = UserInFo()
    u.name = nil
    u.password = "12345678"
    u.age = nil
}

// 3VC = age
Class 3VC {
    let u = UserInFo()
    u.name = nil
    u.password = nil
    u.age = 18
}
```

<br>

제가 원하는 값은 각각 하나인데 만약 넣어주지 않는다면 자동으로 nil값 또는 제가 일일이 nil이라는 것을 명시해주어야합니다.
하나의 인스턴스에 저장되지 않고 각각의 인스턴스에 저장될 것입니다.
이런 경우 싱글톤 패턴을 사용하면 코드가 예뻐질 수 잆습니다.
이런 경우 싱글톤 패턴의 경우 한 인스턴스가 전역이되어서 어떤 클래스든 왔다갔다 할 수 있습니다.
위의 말을 한마디로 서술하면 전역적으로 접근할 수 있는 유일 객체를 만드는 것이 목표입니다.

<br>

### 싱글턴 패턴을 구조체로 사용가능할까..?

싱글턴 패턴은 주로 Class에서 사용하는 경우가 다반사지만 물론 구조체로 사용하지 못한다? 이거는 아닙니다.
하지만 구조체로 사용하게 되면 싱글턴 패턴에서 제일 중요한 유일 객체에 어긋나게 됩니다. 만약 구ㅜ조체로 사용하면 인스턴스화하게 될 때 구조체는 유일 객체가 되지 못합니다. 하지만 구조체를 인스턴스화만 하지 않는다면 구조체를 싱글턴 페턴처럼 사용할 수 있기는 합니다.

<br>

### 싱글턴 패턴의 장단점

#### 장점
-   유일한 객체를 만들어서 다양한 객체들에게 공유되는 객체를 만들 수 있다는 장점이 있습니다.
-   재사용성이 높아서 메모리 낭비를 방지할 수 있다는 장점도 있습니다.
-   코드 중복 방지

<br>

#### 단점
-   싱글턴 패턴은 인스턴스들 간에 결합도가 높아져서 OCP(개방 패쇄 원칙)을 위반 합니다.
-   다중 스레드 환경일 경우 싱글턴 객체를 여러번 생성하지 않도록 처리해야합니다
-   수정과 테스트가 어렵습니다

<br>

### 우리의 개발 속 잠입해있었던 싱글턴 패턴

개발을 하다보면 사용하는
-   UIScreen.main
-   URLSession.shared
-   UserDefaults.standard
-   NotificationCenter.default

등등 에 전부 싱글턴 패턴을 사용하고 있었습니다.

<br>

### 싱글턴 패턴 코드 예제

[Singleton Pattern 예제코드](https://github.com/jjunhaa0211/ADPattern-Swift/tree/main/GoF-SingletonPattern)

<br>

오늘도 긴 글 읽어주셔서 감사합니다.!!!!
