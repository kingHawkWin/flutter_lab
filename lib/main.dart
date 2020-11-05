import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int count = 0;
  final publishStream = PublishSubject<int>();

  dispose() {
    publishStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              StreamBuilder(
                initialData: count,
                stream: publishStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '$count',
                    );
                  }
                  return Center(
                    child: Text(
                      'xxx',
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.minimize),
                    onPressed: () {
                      count--;
                      publishStream.add(count);
                    }
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      count++;
                      publishStream.add(count);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: () {
                      dispose();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow_rounded),
                    onPressed: () {

                    }
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
