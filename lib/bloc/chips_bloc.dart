import 'dart:async';

class ChipsBloc {
  late bool chipsIsActive;

  closeStream() {
    _eventStreamController.close();
    _stateStreamController.close();
  }

  final _eventStreamController = StreamController<bool>();
  StreamSink<bool> get eventSink => _eventStreamController.sink;
  Stream<bool> get eventStream => _eventStreamController.stream;

  final _stateStreamController = StreamController<bool>();
  StreamSink<bool> get stateSink => _stateStreamController.sink;
  Stream<bool> get stateStream => _stateStreamController.stream;

  ChipsBloc() {
    chipsIsActive = false;

    eventStream.listen(
      (event) {
        if (event == true) {
          chipsIsActive = true;
        } else if (event == false) {
          chipsIsActive = false;
        }
        stateSink.add(chipsIsActive);
      },
    );
  }
}
