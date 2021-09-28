import 'dart:async';

enum WhichBottom {
  home,
  explore,
  profile,
  wishlist,
}

class BottomAppBarBloc {
  final _eventStreamController = StreamController<bool>();
  StreamSink<bool> get eventSink => _eventStreamController.sink;
  Stream<bool> get eventStream => _eventStreamController.stream;

  final _eventStateController = StreamController<bool>();
  StreamSink<bool> get stateSink => _eventStateController.sink;
  Stream<bool> get stateStream => _eventStateController.stream;
}
