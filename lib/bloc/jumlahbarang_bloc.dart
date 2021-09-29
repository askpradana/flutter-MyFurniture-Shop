import 'dart:async';

enum JumlahBarang {
  tambah,
  kurang,
}

class JumlahBarangBloc {
  late int kuantitasBarang;
  final _eventStreamController = StreamController<JumlahBarang>();
  StreamSink<JumlahBarang> get eventSink => _eventStreamController.sink;
  Stream<JumlahBarang> get eventStream => _eventStreamController.stream;

  final _stateStreamController = StreamController<int>();
  StreamSink<int> get stateSink => _stateStreamController.sink;
  Stream<int> get stateStream => _stateStreamController.stream;

  JumlahBarangBloc() {
    kuantitasBarang = 0;
    eventStream.listen(
      (event) {
        if (event == JumlahBarang.tambah) {
          kuantitasBarang++;
        } else if (event == JumlahBarang.kurang) {
          kuantitasBarang--;
        }
        stateSink.add(kuantitasBarang);
      },
    );
  }
}
