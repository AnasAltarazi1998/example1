import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:example1/firebase_service.dart';
import 'package:example1/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial());
  FireBaseService fireBaseService = FireBaseService();
  @override
  Stream<FirebaseState> mapEventToState(
    FirebaseEvent event,
  ) async* {
    if (event is SaveData) {
      yield UploadingImage();
      yield SavedData(
        users: await fireBaseService.save(event.userModel),
      );
    } else if (event is LoadData) {
      yield DataLoaded(
        users: await fireBaseService.data(),
      );
    } else if (event is TakeImage) {
      final picker = ImagePicker();
      PickedFile pickedImage = await picker.getImage(
          source: event.source == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);
      if (pickedImage?.path != null)
        yield TakingImage(
          users: await fireBaseService.data(),
          img: File(pickedImage.path),
        );
    }
  }
}
