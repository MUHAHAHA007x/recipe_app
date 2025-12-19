import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/model/recipe.dart'; // เช็คชื่อโปรเจคให้ตรง

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.imgLable),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // รูปภาพ
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14.0),
            // ชื่อเมนู
            Text(
              widget.recipe.imgLable,
              textAlign: TextAlign.center,
              style: GoogleFonts.chakraPetch(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // คำอธิบาย
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.recipe.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.chakraPetch(
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // รายการวัตถุดิบ (List ใน List)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: widget.recipe.ingredient.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredient[index];
                  // คำนวณปริมาณตาม Slider
                  final displayQuantity = ingredient.quantity * _sliderValue;

                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Row(
                      children: [
                        Text(
                          '$displayQuantity ${ingredient.unit}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          ingredient.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Slider ปรับจำนวนคน
            Container(
              color: Colors.green[50], // ใส่พื้นหลังให้ดูเด่นขึ้น
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'สำหรับ $_sliderValue ที่',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Slider(
                    min: 1.0,
                    max: 10.0,
                    divisions: 9,
                    activeColor: Colors.green,
                    inactiveColor: Colors.green[100],
                    label: '$_sliderValue คน',
                    value: _sliderValue.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue = newValue.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
