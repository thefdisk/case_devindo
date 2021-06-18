import 'package:case_devindo/bloc/post_bloc.dart';
import 'package:case_devindo/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(GetPost()),
        child: BottomBar(),
      ),
    );
  }
}
