part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseEvent {}

class SaveData extends FirebaseEvent {
  UserModel userModel;
  SaveData({this.userModel});
}

class TakeImage extends FirebaseEvent {
  String source;
  TakeImage({this.source});
}

class LoadData extends FirebaseEvent {}
