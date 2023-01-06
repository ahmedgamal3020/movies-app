import 'package:flutter/material.dart';
import 'package:movies/modules/movies/presentation/screens/movies_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child:TextButton(
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context)=>const MoviesScreen())
                );
              },
              child:const Text('Navigator')
          )
      ),
    );
  }
}
