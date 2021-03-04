import 'package:cricket/screens/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'recp.dart';

class Recipe extends StatefulWidget {
  Recipe({Key key, @required this.name}) : super(key: key);
  String name;
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  rec a = new rec();
  Widget instr() {
    if (widget.name == 'Grilled egg plant and tomato pasta') {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text(
                a.nilesh_recipe,
                style: TextStyle(color: Colors.green[900], fontSize: 20),
              ),
              //(image: NetworkImage("youImageLink"))
            )
          ],
        ),
      );
    } else if (widget.name == 'Chickpea and poatato curry') {
      return SingleChildScrollView(
        child: Container(
          child: Text(a.shubham_recipe),
        ),
      );
    } else if (widget.name == 'Rainbow buddha bowl with cashew tahini sauce') {
      return SingleChildScrollView(
        child: Container(
          child: Text(a.rutuja_recipe),
        ),
      );
    } else if (widget.name == 'spinach-avacado smoothie') {
      return SingleChildScrollView(
        child: Container(
          child: Text(a.pratik_recipe),
        ),
      );
    } else if (widget.name == 'dietplan') {
      return SingleChildScrollView(
        child: Container(
          child: Text(a.pratii_recipe),
        ),
      );
    } else if (widget.name == 'Broccoli with balsamic mushroom') {
      return SingleChildScrollView(
        child: Container(
          child: Text(a.sakshi_recipe),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  child: instr(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Recipe'),
      ),
      drawer: Mydrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://digitalsynopsis.com/wp-content/uploads/2017/02/beautiful-color-gradients-backgrounds-049-fresh-milk.png"),
                fit: BoxFit.cover)),
        child: Align(
          child: instr(),
        ),
      ),
    );
  }
}
