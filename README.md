# provider_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## 프로바이더 가이드
프로바이더는 한개의 데이터 모델을 관리한다. 데이터 모델은 기본타입(int, String..)등 일 수도 있고 클래스일 수 도 있다.

### watch
context.watch<SomeModel>() 코드는 위젯 트리에서 SomeModel 모델이 변경되면 다시 렌더한다.
SomeModel의 변경은 ChangeNotifier프로바이더에서 notifyListeners를 사용한다.

위젯의 build 함수에 context.watch<SomeModel>() 이 코드가 있는것 만으로도 SomeModel가 변경되면 다시 렌더된다.
즉 모델이 상태에 따라 다시 렌더 하기 위해 사용한다.

main.dart 참고

### read
context.read<SomeModel>() 코드는 모델 상태 변경을 위해 사용한다.
SomeModel 프로바이더에 doSomething 이라는 모델 변경 함수가 있다고 가장하자
위젯의 build 함수에 context.read<SomeModel>() 코드가 실행되어도 다시 렌더되지 않는다.
그러나 context.read<SomeModel>().doSomething() 함수가 실행되어 내부적으로 notifyListeners가 호출되고
build 함수 어딘가에 watch 또는 consumer가 있다면 다시 렌더된다.

즉 모델 변경 이벤트 트리거 용도로 사용된다.


### Consumer
위젯이 모델과 연관이 있고 기본상태를 가져야할때 사용한다.
consumer_page.dart 참고