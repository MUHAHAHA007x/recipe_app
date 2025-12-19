import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe.dart'; // เช็คชื่อโปรเจคให้ตรง
import 'package:recipe_app/model/recipe-detail.dart'; // import หน้า Detail เข้ามา

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
        // ปรับสีหลักของแอปให้ดูดีขึ้น (สีเขียวเข้ากับอาหาร)
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black, // สีตัวหนังสือใน Appbar
          elevation: 0,
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
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
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            // ส่ง object recipe ตัวที่ index ไปสร้างการ์ด
            return buildRecipeCard(Recipe.samples[index]);
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    // ใส่ GestureDetector เพื่อให้กดแล้วไปหน้า Detail
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RecipeDetail(recipe: recipe);
            },
          ),
        );
      },
      child: Card(
        elevation: 4.0, // เพิ่มเงาให้ดูสวยแบบ Week 4
        margin: const EdgeInsets.all(12.0), // ระยะห่างขอบ
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            // รูปภาพหัวมน
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image(
                image: AssetImage(recipe.imageUrl),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            // ชื่อเมนู
            Text(
              recipe.imgLable,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Palatino', // หรือใช้ GoogleFonts ถ้าชอบ
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
