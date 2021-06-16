import 'dart:io';

import 'package:example1/bloc/firebase_bloc.dart';
import 'package:example1/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireBasePage extends StatelessWidget {
  FireBasePage({
    Key key,
  }) : super(key: key);
  TextEditingController nameCon = TextEditingController();
  File img;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FirebaseBloc>(
      create: (context) => FirebaseBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('firebase app'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: nameCon,
                        decoration: InputDecoration(
                          hintText: 'enter name ...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 32,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          BlocProvider.of<FirebaseBloc>(context).add(
                            SaveData(
                              userModel: UserModel(
                                  name: nameCon.text,
                                  img: this.img != null ? this.img : null),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                  flex: 4,
                  child: BlocConsumer<FirebaseBloc, FirebaseState>(
                    listener: (context, state) {
                      if (state is FirebaseInitial)
                        BlocProvider.of<FirebaseBloc>(context).add(LoadData());
                    },
                    builder: (context, state) {
                      if (state is FirebaseInitial || state is SavingData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is FaildState) {
                        return Center(
                          child: IconButton(
                            onPressed: () =>
                                BlocProvider.of<FirebaseBloc>(context)
                                    .add(LoadData()),
                            icon: Icon(Icons.replay_outlined),
                          ),
                        );
                      } else if (state is DataLoaded) {
                        return ListView.builder(
                          itemCount: state.users.length,
                          itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${state.users[i].name}',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4),
                            ),
                          ),
                        );
                      } else if (state is TakingImage) {
                        this.img = state.img;
                        return Stack(
                          children: [
                            ListView.builder(
                              itemCount: state.users.length,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${state.users[i].name}',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 4),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                width: 125,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  child: Image.file(
                                    state.img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else if (state is SavedData) {
                        return ListView.builder(
                          itemCount: state.users.length,
                          itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${state.users[i].name}',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: IconButton(
                            onPressed: () =>
                                BlocProvider.of<FirebaseBloc>(context)
                                    .add(LoadData()),
                            icon: Icon(Icons.replay_outlined),
                          ),
                        );
                      }
                    },
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctxt) => Dialog(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<FirebaseBloc>(context)
                            .add(TakeImage(source: 'camera'));
                      },
                      child: Text('camera'),
                    ),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<FirebaseBloc>(context)
                            .add(TakeImage(source: 'gallery'));
                      },
                      child: Text('gallery'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Icon(
            Icons.camera,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
