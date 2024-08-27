import 'package:bloc_task3/bloc/internet_connection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetConnectionBloc(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
              builder: (context, state) {
                if (state is ConnectedState) {
                  return Text(
                    state.message.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  );
                } else if (state is DisconnectedState) {
                  print(state.message);

                  return Text(
                    state.message.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  );
                }
                return const Text(
                  "X",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
