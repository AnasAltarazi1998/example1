part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseState {}

class FirebaseInitial extends FirebaseState {}

class DataLoaded extends FirebaseState {
  List<UserModel> users;
  DataLoaded({this.users});
}

class TakingImage extends FirebaseState {
  File img;
  List<UserModel> users;
  TakingImage({this.img, this.users});
}

class SavingData extends FirebaseState {}

class SavedData extends FirebaseState {
  List<UserModel> users;
  SavedData({this.users});
}

class UploadingImage extends FirebaseState {}

class FaildState extends FirebaseState {}
