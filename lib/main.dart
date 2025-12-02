import 'package:flutter/material.dart';

void main() {
  runApp(const ReceipeApp());
}

class ReceipeApp extends StatelessWidget {
  const ReceipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return buildRecipeCard(Receipe.samples[index]); //Reuseฟังก์ชั่น
            },
            itemCount: Receipe.samples.length,
          ),
        ),
      ),
    );
  }

  Widget buildRecipeCard(Receipe recipe) {
    //ฟังก์ชั่นดีไซต์
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          Text(recipe.imgLable),
        ],
      ),
    );
  }
}
