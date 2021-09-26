import 'dart:async';

class BottomAppBarBloc {
  late bool bottomAppBarActive;

  final _eventStreamController = StreamController<bool>();
  StreamSink<bool> get eventSink => _eventStreamController.sink;
  Stream<bool> get eventStream => _eventStreamController.stream;

  final _eventStateController = StreamController<bool>();
  StreamSink<bool> get stateSink => _eventStateController.sink;
  Stream<bool> get stateStream => _eventStateController.stream;

  BottomAppBarBloc() {
    bottomAppBarActive = false;

    eventStream.listen(
      (event) {
        if (event == true) {
          bottomAppBarActive = true;
        } else if (event == false) {
          bottomAppBarActive = false;
        }
        stateSink.add(bottomAppBarActive);
      },
    );
  }
}
