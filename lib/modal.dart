import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  Modal({Key key}) : super(key: key);

  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            i++;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Builder(builder: (ctxt) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  showBottomSheet(
                      context: ctxt,
                      builder: (_) {
                        return Center(
                            child: Text(
                          'data',
                          style: TextStyle(fontSize: 32),
                        ));
                      });
                },
                child: Text('show first bottomsheet'),
              ),
              TextButton(
                onPressed: () {
                  showBottomSheet(
                      context: ctxt,
                      builder: (_) {
                        return Center(
                          child: Text(
                            '$i',
                            style: TextStyle(fontSize: 32),
                          ),
                        );
                      });
                },
                child: Text('show bottomsheet with number $i'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
