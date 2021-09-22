import 'dart:async';

class IsLikedBloc {
  late bool isLoved;

  final _eventStreamController = StreamController<bool>();
  StreamSink<bool> get eventSink => _eventStreamController.sink;
  Stream<bool> get eventStream => _eventStreamController.stream;

  final _eventStateController = StreamController<bool>();
  StreamSink<bool> get stateSink => _eventStateController.sink;
  Stream<bool> get stateStream => _eventStateController.stream;

  IsLikedBloc() {
    isLoved = false;

    eventStream.listen(
      (event) {
        if (event == true) {
          isLoved = true;
        } else if (event == false) {
          isLoved = false;
        }
        stateSink.add(isLoved);
      },
    );
  }
}
