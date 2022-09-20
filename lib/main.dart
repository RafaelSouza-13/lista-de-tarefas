import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text(
            'Tarefa',
          ),
        ),
        body: ListView(
          children: const [
            Task(
              task: "Aprender flutter",
              foto:
                  "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
            ),
            Task(
              task: "Aprender dart",
              foto:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Dart-logo.png/600px-Dart-logo.png",
            ),
            Task(
              task: "Aprender a desenhar",
              foto:
                  "https://static.wixstatic.com/media/a0d16a_2637724c036644cfbd0562bf02211f80~mv2.png/v1/fill/w_1080,h_1080,al_c/a0d16a_2637724c036644cfbd0562bf02211f80~mv2.png",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String task;
  final String foto;
  const Task({
    Key? key,
    required this.task,
    required this.foto,
  }) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black12,
                        width: 72,
                        height: 100,
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          widget.task,
                          style: TextStyle(fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(
                                  Icons.arrow_drop_up,
                                ),
                                Text(
                                  "UP",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.blue[200],
                          value: nivel / 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Nivel: $nivel",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
