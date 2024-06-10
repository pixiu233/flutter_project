import 'package:rxdart/rxdart.dart';

class EventBus {
  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;
  EventBus._internal();

  final BehaviorSubject<String> _eventBus =
      BehaviorSubject<String>.seeded("initial");

  Stream<String> get stream => _eventBus.stream;
  Function(String) get sink => _eventBus.sink.add;
}
