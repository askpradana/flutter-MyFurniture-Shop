import 'dart:async';

enum WhichBottom {
  home,
  explore,
  profile,
  wishlist,
}

class BottomAppBarBloc {
  late int whichMenu;

  final _eventStreamController = StreamController<WhichBottom>();
  StreamSink<WhichBottom> get eventSink => _eventStreamController.sink;
  Stream<WhichBottom> get eventStream => _eventStreamController.stream;

  final _eventStateController = StreamController<int>();
  StreamSink<int> get stateSink => _eventStateController.sink;
  Stream<int> get stateStream => _eventStateController.stream;

  BottomAppBarBloc() {
    whichMenu = 0;

    eventStream.listen(
      (event) {
        if (event == WhichBottom.home) {
          whichMenu = 0;
        } else if (event == WhichBottom.explore) {
          whichMenu = 1;
        } else if (event == WhichBottom.profile) {
          whichMenu = 2;
        } else if (event == WhichBottom.wishlist) {
          whichMenu = 3;
        }
        stateSink.add(whichMenu);
      },
    );
  }
}
