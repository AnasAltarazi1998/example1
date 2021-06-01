import 'package:example1/bloc/increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IncrementBloc _incrementBloc;
  int j = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _incrementBloc = IncrementBloc();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<IncrementBloc, IncrementState>(
          builder: (context, state) {
            if (state is IncrementInitial) {
              return Center(
                  child: Container(
                child: Text('$j'),
              ));
            } else if (state is IncrementProcessing) {
              return Center(
                  child: Container(
                child: CircularProgressIndicator(),
              ));
            } else if (state is Done) {
              return Center(
                child: Container(
                  child: Text('${(j = state.i ?? 0)}'),
                ),
              );
            } else
              return Center(
                  child: Container(
                child: Text('$j eew'),
              ));
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.plus_one),
            onPressed: () => _incrementBloc.add(IncrementImpl(i: j))),
      ),
    );
  }
}
