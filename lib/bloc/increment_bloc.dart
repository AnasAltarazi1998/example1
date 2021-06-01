import 'dart:async';
import 'dart:io';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  IncrementBloc() : super(IncrementInitial());
  void wait() async {
    get(Uri.parse(
        'https://www.digitalocean.com/community/tutorials/flutter-flutter-http#:~:text=How%20To%20Use%20HTTP%20Requests%20in%20Flutter%201,Displaying%20PostDetail.%20...%205%20Handling%20DELETE%20Requests.%20'));
  }

  @override
  Stream<IncrementState> mapEventToState(IncrementEvent event) async* {
    yield IncrementInitial();
    if (event is IncrementImpl) {
      yield IncrementProcessing();
      wait();
      yield Done(i: ++event.i);
    }
  }
}
