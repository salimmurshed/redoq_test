import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/ui/edit_screen/edit_screen_bloc.dart';
import '../presentation/ui/list_screen/list_screen.dart';
import '../presentation/ui/list_screen/list_screen_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListScreenBloc>(
          create: (BuildContext context) => ListScreenBloc(),
        ),
        BlocProvider<EditScreenBloc>(
          create: (BuildContext context) => EditScreenBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          color: Colors.white70,
          titleTextStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.normal,
            fontSize: 19,
            color: Colors.white,
          ),
          elevation: 0.5,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        )),
        home: const ListScreen(),
      ),
    );
  }
}
