import "dart:math";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:bloc_payload/theme/theme_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child:
            //   BlocBuilder<ThemeBloc, ThemeState>(
            //     builder: (context, state) {
            //       return
            Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "FEvent Payload",
            theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(),
          );
        })
        //   },
        );
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                final int randInt = Random().nextInt(10);
                print(randInt);
                context
                    .read<ThemeBloc>()
                    .add(ChangeThemeEvent(randInt: randInt));
                // print(map["data"]["color"]);
              },
              child: Text(
                "Change theme",
                style: TextStyle(fontSize: 24),
              ))),
    );
  }
}
