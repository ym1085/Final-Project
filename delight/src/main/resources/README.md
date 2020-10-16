# Chapter 16

Importance: ⭐️⭐️⭐️⭐️⭐️
Tags: 기본 자료형에 대한 제한 래퍼 클래스, 다중 매개변수 기반 제네릭, 제네릭 메소드 정의, 제네릭의 기본 문법, 제네릭이란?, 타입 매개변수 이름 규칙

# 왜 제네릭을 사용해야 하는가?

---

## 제네릭이란(Generic)이란

- **타입을 파라미터화해서** **컴파일시** **구체적인 타입이 결정되도록 하는 것**
    - **자바 5**부터 **추가된 기능**.
    - 컬렉션, 람다식(함수적 인터페이스), 스트링, NIO에서 널리 사용된다.
    - 제네릭을 모르면 도큐먼트를 해석할 수 없다.

### 예제 1-1

```java
Class ArrayList<E>

default BiConsumer<T,U> andThen(BiConsumer<? super T,? super I> after)
```

## 제네릭을 사용하므로서 얻는 이점

- 컴파일시 강한 **타입 체크**를 할 수 있다.
    - 실행 시 타입 에러가 나는 것보다, **컴파일시 미리 타입을 강하게 체크해 에러를 사전에 방지.**
- **타입 변환을 제거**할 수 있다.
    - **타입 변환이 많을수록 전체 애플리케이션 성능이 떨어진다.**

### 예제 1-2

```java
List list = new ArrayList();
list.add("hello");
String str = (String) list.get(0);
```

- 위의 코드에서는 강제 타입 변환이 두번 일어난다.
- 아래는 제네릭 적용 후 코드의 변화된 결과다.

### 예제 1-3

```java

List<**String**> list = new ArrayList<**String**>();
list.add("hello");
String str = list.get(0);
```

- 타입 인자로 <String>을 선언하여 Down Casting을 수행하지 않게된다.
- Down Casting을 수행하는 것은 JVM의 간섭을 없애기에 좋지 않다.

# 제네릭의 기본 문법

## 다중 매개변수 기반 제네릭 클래스의 정의

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.11.33.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.11.33.png)

- 다중 매개변수 기반 제네릭 클래스 정의도 가능하다.
- DBox<String, Integer> box = new DBox<String, Integer>();

## 타입 매개변수의 이름 규칙

---

### 일반적인 관례

- **한 문자**로 이름을 짓는다.
- **대문자**로 이름을 짓는다.

### 보편적인 선택

- E - Element
- K - Key
- N - Number
- T - Type
- V - Value

## 기본 자료형에 대한 제한 그리고 래퍼 클래스

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.17.59.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.17.59.png)

- **제네릭의 타입 인자로 기본 자료형이 올 수 없으므로, 컴파일 오류 발생**
- 기본 자료형의 값이 전달되면 **Auto Boxing, Auto UnBoxing**을 수행 한다.

## 매개변수화 타입을 타입 인자로 전달

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.27.42.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.27.42.png)

매개변수 타입에 매개변수화 타입을 넣는다.

- <String> - 타입 인자
- <T> - 타입 매개변수
- Box<T> - 매개변수화 타입

## 제네릭 클래스의 타입 인자 제한하기

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.37.14.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.37.14.png)

- class Box<T extends Number> { ... }
    - 인스턴스 생성 시 타입 인자로 Number 또는 이를 상속하는 클래스만 올 수 있음.
    - T로 전달이 되는 인자는 Number Class를 상속 또는 Number Class의 Instance만 가능.

## 타입 인자 제한의 효과

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.43.09.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.43.09.png)

**중요한 부분**

- 제한을 하는 이유가 무엇인가??
    - 제한하는데 끝나는 것이 아닌, 부가적으로 Number Class에 있는 메소드를 호출하는 효과
    - 제네릭 클래스를 정의할때 **extends**를 통해 **제한**을 하는 경우가 많다.

## 제네릭 클래스의 타입 인자를 인터페이스로 제한

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.49.11.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.49.11.png)

- T로 전달되는 이름은 Eatable Interface를 직접적으로, 혹은 간접적으로 구현한 이름만 올 수 있다.

## 하나의 클래스 하나의 인터페이스에 대해 동시 제한

---

### 예제 1-1

```java
class Box<T extends **Number** & **Eatable**> { ... } // Class, Interface 동시 제한
```

## 제네릭 메소드의 정의

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.52.54.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__1.52.54.png)

- 클래스 전체를 제네릭으로 선언하는 것이 아닌, 하나의 메소드에 대해 제네릭 선언을 하겠다.
- 제네릭 클래스에서의 타입 인자 <T>는 인스턴스를 생성하는 순간 초기화가 되었다.
- 제네릭 메소드에서의 타입 인자 <T>는 메소드가 호출 되는 순간 초기화 된다.
- 타입 인자 **T** 에는 **기본 자료형**이 올 수 없다.

### 예제 1-1

```java
// **제네릭 메소드**
class BoxFactory {
	public static <**T**> Box<**T**> makeBox(**T** o){
		Box<**T**> box = new Box<T>();
		box.set(o);
		return box;
	}
}

// **제네릭 메소드의 T는 메소드 호출 시점에 결정한다.**
	Box<String> sBox = BoxFactory.<**String**>makeBox("Sweet");
	Box<Double> sBox = BoxFactory.<**Double**>makeBox(7.59); // 오토 박싱

// **다음과 같이 타입 인자 생략 가능**
	Box<String> sBox = BoxFactory.makeBox("Sweet");
	Box<Double> sBox = BoxFactory.makeBox(7.59); // 오토 박싱
```

여기서 집중할 부분은 static <T> 이 부분이다.
- 메소드에 <T> 이러한 표시를 하는 것은 제네릭 메소드임을 의미 하는 것이다. 
- public <타입 파라미터 . . . > 리턴타입 메소드명 (매개변수, . . . ) { . . . }

## 제네릭 메소드의 제한된 타입 매개변수 선언

---

![Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__2.10.33.png](Chapter%2016%20df2b3410f3c04af4b42f6be28359cbc0/_2020-08-01__2.10.33.png)

<T extends Number> 
- T는 Number를 상속하거나, Number이어야 한다.
- 하나의 메소드만을 대상으로 제네릭 선언을 하기 위해 Class에서 내려온거라 생각하면 된다. 
- 즉, 제네릭 메소드임을 말하기 위해 위 같이 선언을 한 것이다.

 

updated by 2020.08.01

---