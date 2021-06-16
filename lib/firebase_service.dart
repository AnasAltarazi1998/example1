import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example1/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class FireBaseService {
  static final FireBaseService instance = FireBaseService._internal();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _firestorage = FirebaseStorage.instance;
  factory FireBaseService() {
    return instance;
  }

  FireBaseService._internal() {
    Firebase.initializeApp();
  }

  Future<List<UserModel>> save(UserModel model) async {
    String id = '';
    await _firestore
        .collection('users')
        .add({'name': model.name})
        .then((value) => id = value.id)
        .catchError((error) => print('$error'));
    if (model.img != null) {
      await _firestorage
          .ref(
            path.basename(model.img.path),
          )
          .putFile(
            model.img,
            SettableMetadata(
              customMetadata: {'created_by': id},
            ),
          );
    }
    return data();
  }

  Future<List<UserModel>> data() async {
    List<UserModel> list = List.empty(growable: true);
    _firestore.collection('users').get().then(
          (docs) => list = docs.docs.map<UserModel>(
            (item) => UserModel.fromJson(
              {
                'name': item.get('name'),
              },
            ),
          ),
        );
    return list;
  }
}
